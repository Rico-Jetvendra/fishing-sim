<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model{
    protected $table = 't_city';
    protected $primaryKey = 'city_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'city_name',
        'city_capital',
        'city_description',
        'created_date',
    ];

    protected function casts(): array{
        return [
            'city_id'       => 'integer',
            'city_capital'  => 'integer',
            'created_date'  => 'datetime',
        ];
    }

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_city.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }
}
