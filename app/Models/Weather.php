<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Weather extends Model{
    protected $table = 't_weather';

    protected $primaryKey = 'weather_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'weather_name',
    ];

    protected $casts = [
        'created_date' => 'datetime',
    ];

    public function fishWeathers(){
        return $this->hasMany(
            FishWeather::class,
            'weather_id',
            'weather_id'
        );
    }

    public function fishes(){
        return $this->belongsToMany(
            Fish::class,
            't_fish_weather',
            'weather_id',
            'fish_id'
        )->withPivot('weather_modifier');
    }
}
