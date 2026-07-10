<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class FishType extends Model{
    protected $table = 't_fish_type';

    protected $primaryKey = 'fish_type_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'fish_type',
        'water_type',
    ];

    protected $casts = [
        'water_type' => 'integer',
        'created_date' => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_fish_type.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function fishes(){
        return $this->hasMany(Fish::class, 'fish_type', 'fish_type_id');
    }
}
