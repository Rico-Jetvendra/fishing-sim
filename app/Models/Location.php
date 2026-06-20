<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Location extends Model{
    protected $table = 't_location';

    protected $primaryKey = 'location_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'location_name',
    ];

    protected $casts = [
        'created_date' => 'datetime',
    ];

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
