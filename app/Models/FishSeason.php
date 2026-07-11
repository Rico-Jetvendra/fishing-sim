<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishSeason extends Model{
    protected $table = 't_fish_season';
    protected $primaryKey = 'fish_season_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'season_id',
        'fish_id',
        'season_modifier',
    ];

    protected $casts = [
        'season_id'       => 'integer',
        'fish_id'         => 'integer',
        'season_modifier' => 'integer',
        'created_date'    => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_fish_season.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function season(){
        return $this->belongsTo(Season::class, 'season_id', 'season_id');
    }
}
