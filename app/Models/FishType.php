<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishType extends Model{
    protected $table = 't_fish_type';

    protected $primaryKey = 'fish_type_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'fish_type',
    ];

    protected $casts = [
        'created_date' => 'datetime',
    ];

    public function fishes(){
        return $this->hasMany(Fish::class, 'fish_type', 'fish_type_id');
    }
}
