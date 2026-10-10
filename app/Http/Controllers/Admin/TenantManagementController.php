<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Tenant;
use App\Models\User;
use App\Models\Reseller;
use App\Services\ActivityLogger;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\View\View;
use Spatie\Permission\Models\Role;

class TenantManagementController extends Controller
{
    /**
     * Ensure only Platform Super Admin can access SaaS tenant management.
     */
    public function __construct()
    {
        // Middleware handled via routes or manual gate
    }

    private function authorizeSuperAdmin(): void
    {
        if (! (Auth::user()?->is_super_admin ?? false)) {
            abort(403, 'Unauthorized. Only Platform Super Admin can manage SaaS business tenants.');
        }
    }

    /**
     * List all business tenants.
     */
    public function index(Request $request): View
    {
        $this->authorizeSuperAdmin();

        $query = Tenant::with(['reseller', 'users'])->withCount(['dealers', 'users']);

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('company_name', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%")
                  ->orWhere('slug', 'like', "%{$search}%");
            });
        }

        if ($request->filled('status')) {
            $query->where('is_active', $request->input('status') === 'active');
        }

        $tenants = $query->orderBy('id', 'desc')->paginate(15);
        $resellers = Reseller::where('is_active', true)->orderBy('company_name')->get();

        return view('admin.tenants.index', compact('tenants', 'resellers'));
    }

    /**
     * Show form to create a new business tenant and its initial Tenant Admin.
     */
    public function create(): View
    {
        $this->authorizeSuperAdmin();

        $resellers = Reseller::where('is_active', true)->orderBy('company_name')->get();

        return view('admin.tenants.create', compact('resellers'));
    }

    /**
     * Onboard a new business tenant and create its Tenant Admin account.
     */
    public function store(Request $request): RedirectResponse
    {
        $this->authorizeSuperAdmin();

        $request->validate([
            // Business Details
            'name'         => 'required|string|max:255',
            'company_name' => 'nullable|string|max:255',
            'slug'         => 'nullable|string|max:100|unique:tenants,slug',
            'email'        => 'nullable|email|max:255',
            'phone'        => 'nullable|string|max:30',
            'address'      => 'nullable|string',
            'gst_number'   => 'nullable|string|max:50',
            'currency'     => 'nullable|string|max:10',
            'reseller_id'  => 'nullable|exists:resellers,id',

            // Initial Tenant Admin Credentials
            'admin_name'     => 'required|string|max:255',
            'admin_username' => 'required|string|max:100|unique:users,username',
            'admin_email'    => 'required|email|max:255|unique:users,email',
            'admin_password' => 'required|string|min:6',
        ]);

        return DB::transaction(function () use ($request) {
            $slug = $request->input('slug') ? Str::slug($request->input('slug')) : Str::slug($request->input('name'));
            
            // Ensure unique slug
            $originalSlug = $slug;
            $counter = 1;
            while (Tenant::where('slug', $slug)->exists()) {
                $slug = $originalSlug . '-' . $counter;
                $counter++;
            }

            // 1. Create Tenant
            $tenant = Tenant::create([
                'name'         => $request->input('name'),
                'slug'         => $slug,
                'company_name' => $request->input('company_name') ?: $request->input('name'),
                'email'        => $request->input('email') ?: $request->input('admin_email'),
                'phone'        => $request->input('phone'),
                'address'      => $request->input('address'),
                'gst_number'   => $request->input('gst_number'),
                'currency'     => $request->input('currency', 'INR'),
                'timezone'     => 'Asia/Kolkata',
                'date_format'  => 'd-m-Y',
                'is_active'    => true,
                'reseller_id'  => $request->input('reseller_id'),
            ]);

            // 2. Create Initial Tenant Admin User (Strictly is_super_admin = false)
            $adminUser = User::create([
                'name'              => $request->input('admin_name'),
                'username'          => $request->input('admin_username'),
                'email'             => $request->input('admin_email'),
                'password'          => Hash::make($request->input('admin_password')),
                'is_active'         => true,
                'is_super_admin'    => false, // NEVER super admin
                'current_tenant_id' => $tenant->id,
            ]);

            // 3. Attach User to Tenant in pivot table
            DB::table('tenant_user')->insert([
                'tenant_id'  => $tenant->id,
                'user_id'    => $adminUser->id,
                'role'       => 'admin',
                'is_active'  => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // 4. Assign Spatie Admin role scoped to this team/tenant
            if (config('permission.teams', false)) {
                setPermissionsTeamId($tenant->id);
            }
            $adminRole = Role::firstOrCreate([
                'name'       => 'admin',
                'guard_name' => 'web',
            ]);
            $adminUser->assignRole($adminRole);

            ActivityLogger::log('Created Business Tenant: ' . $tenant->name, 'TenantManagement', $tenant->id);

            return redirect()->route('admin.tenants.index')->with('success', "Business Tenant '{$tenant->name}' created successfully with Admin: {$adminUser->email}");
        });
    }

    /**
     * Show form to edit an existing business tenant.
     */
    public function edit(Tenant $tenant): View
    {
        $this->authorizeSuperAdmin();

        $resellers = Reseller::where('is_active', true)->orderBy('company_name')->get();

        return view('admin.tenants.edit', compact('tenant', 'resellers'));
    }

    /**
     * Update business tenant details.
     */
    public function update(Request $request, Tenant $tenant): RedirectResponse
    {
        $this->authorizeSuperAdmin();

        $request->validate([
            'name'         => 'required|string|max:255',
            'company_name' => 'nullable|string|max:255',
            'email'        => 'nullable|email|max:255',
            'phone'        => 'nullable|string|max:30',
            'address'      => 'nullable|string',
            'gst_number'   => 'nullable|string|max:50',
            'currency'     => 'nullable|string|max:10',
            'reseller_id'  => 'nullable|exists:resellers,id',
            'is_active'    => 'boolean',
        ]);

        $tenant->update([
            'name'         => $request->input('name'),
            'company_name' => $request->input('company_name') ?: $request->input('name'),
            'email'        => $request->input('email'),
            'phone'        => $request->input('phone'),
            'address'      => $request->input('address'),
            'gst_number'   => $request->input('gst_number'),
            'currency'     => $request->input('currency', 'INR'),
            'reseller_id'  => $request->input('reseller_id'),
            'is_active'    => $request->boolean('is_active', true),
        ]);

        ActivityLogger::log('Updated Business Tenant: ' . $tenant->name, 'TenantManagement', $tenant->id);

        return redirect()->route('admin.tenants.index')->with('success', "Business Tenant '{$tenant->name}' updated successfully.");
    }

    /**
     * Toggle active/suspended status of a business tenant.
     */
    public function toggleStatus(Tenant $tenant): RedirectResponse
    {
        $this->authorizeSuperAdmin();

        // Cannot deactivate Tenant #1 (MSR Broilers - Primary)
        if ($tenant->id === 1) {
            return back()->with('error', 'Cannot deactivate Primary Tenant #1 (MSR Broilers).');
        }

        $tenant->is_active = ! $tenant->is_active;
        $tenant->save();

        ActivityLogger::log(($tenant->is_active ? 'Activated' : 'Suspended') . ' Tenant: ' . $tenant->name, 'TenantManagement', $tenant->id);

        return back()->with('success', "Tenant status updated to: " . ($tenant->is_active ? 'Active' : 'Suspended'));
    }
}
