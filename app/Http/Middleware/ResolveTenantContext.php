<?php

namespace App\Http\Middleware;

use App\Models\Tenant;
use App\Services\Tenancy\TenantContext;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ResolveTenantContext
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();

        // 1. If not authenticated, proceed (login, registration, public assets)
        if (! $user) {
            return $next($request);
        }

        // 2. Identify requested tenant: Session -> Header -> User's current_tenant_id
        $tenantId = session('active_tenant_id')
            ?? $request->header('X-Tenant-ID')
            ?? $user->current_tenant_id;

        $tenant = null;

        if ($tenantId) {
            // Super Admin can access any active tenant
            if ($user->is_super_admin ?? false) {
                $tenant = Tenant::where('id', $tenantId)->where('is_active', true)->first();
            } else {
                $tenant = $user->tenants()->where('tenants.id', $tenantId)->where('tenants.is_active', true)->first();
            }
        }

        // 3. Fallback: User's first assigned active tenant
        if (! $tenant) {
            if ($user->is_super_admin ?? false) {
                $tenant = Tenant::where('is_active', true)->orderBy('id')->first();
            } else {
                $tenant = $user->tenants()->where('tenants.is_active', true)->first();
            }

            if ($tenant) {
                session(['active_tenant_id' => $tenant->id]);
            }
        }

        // 4. Set TenantContext and Spatie team ID
        if ($tenant) {
            app(TenantContext::class)->setTenant($tenant);

            if (function_exists('setPermissionsTeamId')) {
                setPermissionsTeamId($tenant->id);
            }
        } elseif (! ($user->is_super_admin ?? false)) {
            if ($request->expectsJson() || $request->is('api/*')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Your account is not associated with any active business.',
                ], 403);
            }

            abort(403, 'Your account is not associated with any active business.');
        }

        return $next($request);
    }
}
