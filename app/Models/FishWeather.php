<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishWeather extends Model{
    protected $table = 't_fish_weather';

    protected $primaryKey = 'fish_weather_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'weather_id',
        'fish_id',
        'weather_modifier',
    ];

    protected $casts = [
        'weather_id'       => 'integer',
        'fish_id'          => 'integer',
        'weather_modifier' => 'integer',
        'created_date'     => 'datetime',
    ];

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function weather(){
        return $this->belongsTo(Weather::class, 'weather_id', 'weather_id');
    }
}
