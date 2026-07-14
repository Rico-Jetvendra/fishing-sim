<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Redeem extends Model{
    protected $table = 't_redeem';
    protected $primaryKey = 'redeem_id';
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = false;

    protected $fillable = [
        'twitch_redeem_id',
        'redeem_name',
        'redeem_type',
        'redeem_description',
        'redeem_cost',
    ];

    protected $casts = [
        'redeem_id'    => 'integer',
        'redeem_cost'  => 'integer',
        'created_date' => 'datetime',
    ];

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_redeem.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }
}
