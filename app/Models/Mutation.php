<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mutation extends Model{
    protected $table = 't_mutation';
    protected $primaryKey = 'mutation_id';
    public $incrementing = true;
    public $timestamps = false;

    protected $fillable = [
        'fish_id',
        'mutation_name',
        'mutation_description',
        'mutation_chance',
        'mutation_min_weight',
        'mutation_max_weight',
        'mutation_min_length',
        'mutation_max_length',
        'created_date',
    ];

    protected function casts(): array{
        return [
            'mutation_id'         => 'integer',
            'fish_id'             => 'integer',
            'mutation_chance'     => 'decimal:2',
            'mutation_min_weight' => 'decimal:2',
            'mutation_max_weight' => 'decimal:2',
            'mutation_min_length' => 'decimal:2',
            'mutation_max_length' => 'decimal:2',
            'created_date'        => 'datetime',
        ];
    }

    protected static function booted(){
        static::addGlobalScope('latest', function ($query) {
            $query->orderBy('t_mutation.created_date', 'desc');
        });

        static::creating(function ($model) {
            $model->created_date = now();
        });
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'fish_id', 'fish_id');
    }
}
