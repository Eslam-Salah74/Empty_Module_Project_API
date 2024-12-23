<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Traits\ActivityLogTrait;
use App\Traits\AdditionalDataTrait;
use Spatie\Permission\Traits\HasRoles;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, SoftDeletes, Notifiable, AdditionalDataTrait;

    use  HasRoles;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'status',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
    protected $guard_name = 'sanctum';


   
    public function employee()
    {
        return $this->hasOne(\Modules\MasterData\App\Models\Employee::class, 'user_id', 'id');
    }

    public function role()
    {
        return $this->morphToMany(\Modules\MasterData\App\Models\Role::class, 'model', 'model_has_roles', 'model_id', 'role_id');
    }


   

}
