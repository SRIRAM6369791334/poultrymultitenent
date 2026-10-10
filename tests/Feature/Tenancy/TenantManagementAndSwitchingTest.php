<?php

namespace Tests\Feature\Tenancy;

use App\Models\Tenant;
use App\Models\User;
use App\Services\Tenancy\TenantContext;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class TenantManagementAndSwitchingTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        $this->seed(\Database\Seeders\TenantSeeder::class);
    }

    public function test_super_admin_can_access_tenant_management_index(): void
    {
        $superAdmin = User::where('email', 'admin@poultry.com')->first();
        $this->actingAs($superAdmin);

        $response = $this->get(route('admin.tenants.index'));
        $response->assertStatus(200);
        $response->assertSee('MSR Broilers');
    }

    public function test_regular_tenant_admin_cannot_access_tenant_management_index(): void
    {
        $tenant = Tenant::create([
            'name' => 'Farm B',
            'slug' => 'farm-b',
            'is_active' => true,
        ]);

        $tenantAdmin = User::create([
            'name' => 'Tenant B Admin',
            'username' => 'admin_b',
            'email' => 'admin@farmb.com',
            'password' => bcrypt('password'),
            'is_active' => true,
            'is_super_admin' => false,
            'current_tenant_id' => $tenant->id,
        ]);

        $this->actingAs($tenantAdmin);

        $response = $this->get(route('admin.tenants.index'));
        $response->assertStatus(403);
    }

    public function test_super_admin_can_create_new_business_tenant_with_admin(): void
    {
        $superAdmin = User::where('email', 'admin@poultry.com')->first();
        $this->actingAs($superAdmin);

        $response = $this->post(route('admin.tenants.store'), [
            'name'           => 'Kongu Broilers',
            'company_name'   => 'Kongu Broilers Ltd',
            'slug'           => 'kongu-broilers',
            'email'          => 'info@kongu.com',
            'phone'          => '9842100000',
            'admin_name'     => 'Kongu Manager',
            'admin_username' => 'kongu_admin',
            'admin_email'    => 'manager@kongu.com',
            'admin_password' => 'Secret@123',
        ]);

        $response->assertRedirect(route('admin.tenants.index'));

        // Verify Tenant exists
        $newTenant = Tenant::where('slug', 'kongu-broilers')->first();
        $this->assertNotNull($newTenant);
        $this->assertEquals('Kongu Broilers', $newTenant->name);

        // Verify Tenant Admin exists and is NOT super admin
        $adminUser = User::where('email', 'manager@kongu.com')->first();
        $this->assertNotNull($adminUser);
        $this->assertFalse((bool)$adminUser->is_super_admin);
        $this->assertEquals($newTenant->id, $adminUser->current_tenant_id);

        // Verify pivot table attachment
        $pivot = DB::table('tenant_user')
            ->where('tenant_id', $newTenant->id)
            ->where('user_id', $adminUser->id)
            ->first();
        $this->assertNotNull($pivot);
        $this->assertEquals('admin', $pivot->role);
    }

    public function test_super_admin_can_switch_tenant_context(): void
    {
        $superAdmin = User::where('email', 'admin@poultry.com')->first();
        $this->actingAs($superAdmin);

        $tenant2 = Tenant::create([
            'name' => 'Salem Farms',
            'slug' => 'salem-farms',
            'is_active' => true,
        ]);

        $response = $this->post(route('tenant.switch'), [
            'tenant_id' => $tenant2->id,
        ]);

        $response->assertSessionHas('active_tenant_id', $tenant2->id);
        $superAdmin->refresh();
        $this->assertEquals($tenant2->id, $superAdmin->current_tenant_id);
    }

    public function test_regular_user_cannot_switch_to_unassigned_tenant(): void
    {
        $tenant1 = Tenant::first();
        $tenant2 = Tenant::create([
            'name' => 'Isolated Farm',
            'slug' => 'isolated-farm',
            'is_active' => true,
        ]);

        $user = User::create([
            'name' => 'Farm 1 Staff',
            'username' => 'staff1',
            'email' => 'staff1@farm.com',
            'password' => bcrypt('password'),
            'is_active' => true,
            'is_super_admin' => false,
            'current_tenant_id' => $tenant1->id,
        ]);

        // Attach user only to tenant 1
        DB::table('tenant_user')->insert([
            'tenant_id' => $tenant1->id,
            'user_id' => $user->id,
            'role' => 'staff',
            'is_active' => true,
        ]);

        $this->actingAs($user);

        // Attempting to switch to unassigned tenant 2 must be blocked
        $response = $this->post(route('tenant.switch'), [
            'tenant_id' => $tenant2->id,
        ]);

        $response->assertSessionHas('error');
        $this->assertNotEquals($tenant2->id, session('active_tenant_id'));
    }
}
