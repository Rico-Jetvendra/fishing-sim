<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Fish extends Model{
    protected $table = 't_fish';
    protected $primaryKey = 'fish_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'fish_name',
        'fish_type',
        'fish_rarity',
        'fish_base_weight',
        'fish_min_weight',
        'fish_max_weight',
        'fish_min_length',
        'fish_max_length',
        'fish_description',
    ];

    protected $casts = [
        'fish_type'        => 'integer',
        'fish_rarity'      => 'integer',
        'fish_base_weight' => 'integer',
        'fish_min_weight'  => 'decimal:2',
        'fish_max_weight'  => 'decimal:2',
        'fish_min_length'  => 'decimal:2',
        'fish_max_length'  => 'decimal:2',
        'created_date'     => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_fish.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function catchLogs(){
        return $this->hasMany(CatchLogs::class, 'fish_id', 'fish_id');
    }
}
