<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasRoles, HasApiTokens;

    protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
        'username',
        'is_active',
        'current_tenant_id',
        'is_super_admin',
    ];

    protected $hidden = ['password', 'remember_token'];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'is_active' => 'boolean',
            'is_super_admin' => 'boolean',
        ];
    }

    public function activityLogs()
    {
        return $this->hasMany(ActivityLog::class);
    }

    /**
     * Tenants that this user belongs to.
     */
    public function tenants(): BelongsToMany
    {
        return $this->belongsToMany(Tenant::class, 'tenant_user')
            ->withPivot('role', 'is_active')
            ->withTimestamps();
    }

    /**
     * Active / currently selected tenant context.
     */
    public function currentTenant(): BelongsTo
    {
        return $this->belongsTo(Tenant::class, 'current_tenant_id');
    }

    /**
     * Check if user is the platform super admin.
     */
    public function isSuperAdmin(): bool
    {
        return (bool) $this->is_super_admin;
    }

    /**
     * Check if user belongs to a given tenant.
     */
    public function belongsToTenant(int|Tenant $tenant): bool
    {
        $tenantId = $tenant instanceof Tenant ? $tenant->id : $tenant;
        return $this->tenants()->where('tenants.id', $tenantId)->exists();
    }

    /**
     * Check if user is a tenant administrator (Company MD / Business Admin).
     */
    public function isTenantAdmin(?Tenant $tenant = null): bool
    {
        if ($this->is_super_admin) {
            return true;
        }

        if ($this->hasRole('admin')) {
            return true;
        }

        $tenantId = $tenant?->id 
            ?? app(\App\Services\Tenancy\TenantContext::class)->getTenantId() 
            ?? $this->current_tenant_id;

        if (! $tenantId) {
            return false;
        }

        return $this->tenants()
            ->where('tenants.id', $tenantId)
            ->wherePivot('role', 'admin')
            ->exists();
    }

    /**
     * Get the highest role level for the user.
     */
    public function getRoleLevel(): int
    {
        $hierarchy = [
            'viewer' => 1,
            'staff' => 2,
            'delivery_staff' => 2,
            'data_entry' => 2,
            'accountant' => 3,
            'manager' => 3,
            'admin' => 4
        ];

        return $this->roles->map(fn($role) => $hierarchy[$role->name] ?? 0)->max() ?? 0;
    }
}
