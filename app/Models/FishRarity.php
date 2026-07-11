<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishRarity extends Model{
    protected $table = 't_fish_rarity';

    protected $primaryKey = 'fish_rarity_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'fish_rarity',
        'fish_initial',
        'base_bite',
        'base_escape',
        'base_mutation',
    ];

    protected $casts = [
        'base_bite' => 'integer',
        'base_escape' => 'integer',
        'base_mutation' => 'integer',
        'created_date' => 'datetime:d F Y H:i:s',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_fish_rarity.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }
}
