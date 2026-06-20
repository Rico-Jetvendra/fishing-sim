<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishRod extends Model{
    protected $table = 't_fish_rod';

    protected $primaryKey = 'fish_rod_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'rod_id',
        'fish_id',
        'rod_modifier',
    ];

    protected $casts = [
        'rod_id'        => 'integer',
        'fish_id'       => 'integer',
        'rod_modifier'  => 'integer',
        'created_date'  => 'datetime',
    ];

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function rod(){
        return $this->belongsTo(Rod::class, 'rod_id', 'rod_id');
    }
}
