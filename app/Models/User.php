<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model{
    protected $table = 't_user';

    protected $primaryKey = 'user_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'updated_date';

    protected $fillable = [
        'twitch_user_id',
        'username',
        'display_name',
        'user_rod',
        'user_bait',
    ];

    protected $casts = [
        'twitch_user_id' => 'integer',
        'user_rod'       => 'integer',
        'user_bait'      => 'integer',
        'created_date'   => 'datetime',
        'updated_date'   => 'datetime',
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
            CatchLog::class,
            'user_id',
            'user_id'
        );
    }
}
