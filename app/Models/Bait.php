<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bait extends Model{
    protected $table = 't_bait';
    protected $primaryKey = 'bait_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'bait_name',
        'bait_category',
        'bait_description',
    ];

    protected $casts = [
        'bait_category'     => 'integer',
        'created_date'  => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_bait.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }
}
