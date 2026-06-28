<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GameState extends Model{
    protected $table = 't_game_state';

    protected $primaryKey = 'game_state_id';

    const CREATED_AT = 'last_change_at';

    protected $fillable = [
        'weather_id',
        'current_weather',
        'current_location',
        'current_season',
    ];

    protected $casts = [
        'current_weather'      => 'integer',
        'current_location'     => 'integer',
        'current_season'       => 'integer',
        'last_change_at'       => 'datetime',
    ];
}
