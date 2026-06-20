<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rod extends Model{
    protected $table = 't_rod';

    protected $primaryKey = 'rod_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'rod_name',
        'rod_description',
    ];

    protected $casts = [
        'created_date' => 'datetime',
    ];

    public function fishRods(){
        return $this->hasMany(
            FishRod::class,
            'rod_id',
            'rod_id'
        );
    }

    public function fishes(){
        return $this->belongsToMany(
            Fish::class,
            't_fish_rod',
            'rod_id',
            'fish_id'
        )->withPivot('rod_modifier');
    }
}
