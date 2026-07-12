<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CatchLogs extends Model{
    protected $table = 't_catch_log';
    protected $primaryKey = 'catch_log_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'fish_id',
        'fish_weight',
        'fish_length',
        'bait_id',
        'rod_id',
        'location_id',
        'season_id',
        'weather_id',
        'is_teras',
    ];

    protected $casts = [
        'user_id'      => 'integer',
        'fish_id'      => 'integer',
        'fish_weight'  => 'decimal:2',
        'fish_length'  => 'decimal:2',
        'bait_id'       => 'integer',
        'rod_id'       => 'integer',
        'location_id'  => 'integer',
        'season_id'    => 'integer',
        'weather_id'   => 'integer',
        'is_teras'     => 'boolean',
        'created_date' => 'datetime:d F Y H:i:s',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_catch_log.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }
}
