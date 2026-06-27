<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bait extends Model{
    protected $table = 't_bait';

    protected $primaryKey = 'bait_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = null;

    protected $fillable = [
        'bait_name',
        'bait_type',
        'bait_description',
    ];

    protected $casts = [
        'bait_type'     => 'integer',
        'created_date'  => 'datetime',
    ];
}
