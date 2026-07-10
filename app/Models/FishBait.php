<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishBait extends Model{
    protected $table = 't_fish_bait';
    protected $primaryKey = 'fish_bait_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'bait_id',
        'fish_id',
        'bait_modifier',
        'bait_bite',
    ];

    protected $casts = [
        'bait_id'       => 'integer',
        'fish_id'       => 'integer',
        'bait_modifier' => 'integer',
        'bait_bite'     => 'integer',
        'created_date'  => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_fish_bait.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function bait(){
        return $this->belongsTo(Bait::class, 'bait_id', 'bait_id');
    }
}
