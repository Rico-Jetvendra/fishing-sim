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
    ];

    protected $casts = [
        'created_date' => 'datetime',
    ];
}
