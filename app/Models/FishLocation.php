<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishLocation extends Model{
    protected $table = 't_fish_location';
    protected $primaryKey = 'fish_location_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'location_id',
        'fish_id',
        'location_modifier',
        'location_mutation',
    ];

    protected $casts = [
        'location_id'       => 'integer',
        'fish_id'           => 'integer',
        'location_modifier' => 'integer',
        'location_mutation' => 'integer',
        'created_date'      => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_fish_location.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function location(){
        return $this->belongsTo(Location::class, 'location_id', 'location_id');
    }
}
