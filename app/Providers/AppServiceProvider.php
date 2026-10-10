<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     * Binds Repository Interfaces → Eloquent Implementations (Clean Architecture).
     */
    public function register(): void
    {
        $this->app->bind(
            \App\Repositories\Contracts\StockRepositoryInterface::class,
            \App\Repositories\StockRepository::class
        );

        $this->app->bind(
            \App\Repositories\Contracts\PurchaseRepositoryInterface::class,
            \App\Repositories\PurchaseRepository::class
        );

        $this->app->singleton(\App\Services\Tenancy\TenantContext::class, function () {
            return new \App\Services\Tenancy\TenantContext();
        });
    }


    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // ✅ Gate authorization rules for Multi-Tenant SaaS
        \Illuminate\Support\Facades\Gate::before(function ($user, $ability) {
            // 1. Platform Super Admin (MSR Broilers Owner) has universal bypass
            if ($user->is_super_admin ?? false) {
                return true;
            }

            // 2. SaaS Tenant Management abilities are STRICTLY reserved for Platform Super Admin
            if (in_array($ability, ['manage-platform-tenants', 'create-tenants', 'resell-saas'])) {
                return false;
            }

            // 3. Tenant Admin (Company MD / Business Admin) has 100% full operational access within their business
            if ($user->isTenantAdmin()) {
                return true;
            }

            return null; // Sub-users (staff, accountants) evaluate granular Spatie permissions
        });

        // \Illuminate\Pagination\Paginator::useBootstrapFive();
        \Illuminate\Support\Facades\RateLimiter::for('billing', function (\Illuminate\Http\Request $request) {
            return \Illuminate\Cache\RateLimiting\Limit::perMinute(5)->by($request->user()?->id ?: $request->ip());
        });

        \Illuminate\Support\Facades\RateLimiter::for('payments', function (\Illuminate\Http\Request $request) {
            return \Illuminate\Cache\RateLimiting\Limit::perMinute(10)->by($request->user()?->id ?: $request->ip());
        });

        \App\Models\Customer::observe(\App\Observers\CustomerObserver::class);
        \App\Models\Item::observe(\App\Observers\ItemObserver::class);
    }
}
