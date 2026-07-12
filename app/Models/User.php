<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model{
    protected $table = 't_user';
    protected $primaryKey = 'user_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'twitch_user_id',
        'username',
        'display_name',
        'user_rod',
        'user_bait',
        'last_fish_at'
    ];

    protected $casts = [
        'twitch_user_id' => 'integer',
        'user_rod'       => 'integer',
        'user_bait'      => 'integer',
        'created_date'   => 'datetime',
        'updated_date'   => 'datetime',
        'last_fish_at'   => 'datetime',
    ];

    public function inventories(){
        return $this->hasMany(
            Inventory::class,
            'user_id',
            'user_id'
        );
    }

    public function catchLogs(){
        return $this->hasMany(
            CatchLogs::class,
            'user_id',
            'user_id'
        );
    }
}
