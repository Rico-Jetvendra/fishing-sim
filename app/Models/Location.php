<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Location extends Model{
    protected $table = 't_location';
    protected $primaryKey = 'location_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'city_id',
        'location_name',
        'location_water',
        'location_description',
    ];

    protected $casts = [
        'city_id'        => 'integer',
        'location_water' => 'integer',
        'created_date'   => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_location.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function fishLocations(){
        return $this->hasMany(
            FishLocation::class,
            'location_id',
            'location_id'
        );
    }

    public function fishes(){
        return $this->belongsToMany(
            Fish::class,
            't_fish_location',
            'location_id',
            'fish_id'
        )->withPivot('location_modifier');
    }
}
