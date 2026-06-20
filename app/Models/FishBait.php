<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FishBait extends Model{
    protected $table = 't_fish_bait';

    protected $primaryKey = 'fish_bait_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'bait_id',
        'fish_id',
        'bait_modifier',
    ];

    protected $casts = [
        'bait_id'       => 'integer',
        'fish_id'       => 'integer',
        'bait_modifier' => 'integer',
        'created_date'  => 'datetime',
    ];

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }

    public function bait(){
        return $this->belongsTo(Bait::class, 'bait_id', 'bait_id');
    }
}
