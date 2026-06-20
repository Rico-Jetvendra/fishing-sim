<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Fish extends Model{
    protected $table = 't_fish';

    protected $primaryKey = 'fish_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'fish_name',
        'fish_type',
        'fish_rarity',
        'fish_base_weight',
        'fish_min_weight',
        'fish_max_weight',
        'fish_description',
    ];

    protected $casts = [
        'fish_type'        => 'integer',
        'fish_rarity'      => 'integer',
        'fish_base_weight' => 'integer',
        'fish_min_weight'  => 'integer',
        'fish_max_weight'  => 'integer',
        'created_date'     => 'datetime',
    ];

    public function catchLogs(){
        return $this->hasMany(CatchLog::class, 'fish_id', 'fish_id');
    }
}
