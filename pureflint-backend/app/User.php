<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'role_id'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'token',
    ];

    protected $guarded = [
        'id', 'created_at', 'updated_at'
    ];

    public function waterLead() {
        return $this->hasMany('App\WaterLead', 'user_id', 'id');
    }
}
