<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CatchLog extends Model{
    protected $table = 't_catch_log';

    protected $primaryKey = 'catch_log_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'user_id',
        'fish_id',
        'fish_weight',
    ];

    protected $casts = [
        'user_id'      => 'integer',
        'fish_id'      => 'integer',
        'fish_weight'  => 'decimal:2',
        'created_date' => 'datetime',
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }
}
