<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishLocation extends Model{
    protected $table = 't_fish_location';

    protected $primaryKey = 'fish_location_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'location_id',
        'fish_id',
        'location_modifier',
    ];

    protected $casts = [
        'location_id'       => 'integer',
        'fish_id'           => 'integer',
        'location_modifier' => 'integer',
        'created_date'      => 'datetime',
    ];

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function location(){
        return $this->belongsTo(Location::class, 'location_id', 'location_id');
    }
}
