<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Season extends Model{
    protected $table = 't_season';

    protected $primaryKey = 'season_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'season_name',
    ];

    protected $casts = [
        'created_date' => 'datetime',
    ];

    public function fishSeasons(){
        return $this->hasMany(
            FishSeason::class,
            'season_id',
            'season_id'
        );
    }

    public function fishes(){
        return $this->belongsToMany(
            Fish::class,
            't_fish_season',
            'season_id',
            'fish_id'
        )->withPivot('season_modifier');
    }
}
