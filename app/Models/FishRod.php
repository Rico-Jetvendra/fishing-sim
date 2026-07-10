<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishRod extends Model{
    protected $table = 't_fish_rod';
    protected $primaryKey = 'fish_rod_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'rod_id',
        'fish_id',
        'rod_modifier',
        'rod_escape',
    ];

    protected $casts = [
        'rod_id'        => 'integer',
        'fish_id'       => 'integer',
        'rod_modifier'  => 'integer',
        'rod_escape'  => 'integer',
        'created_date'  => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_fish_rod.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function rod(){
        return $this->belongsTo(Rod::class, 'rod_id', 'rod_id');
    }
}
