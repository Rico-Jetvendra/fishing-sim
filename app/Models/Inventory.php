<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model{
    protected $table = 't_inventory';

    protected $primaryKey = 'inventory_id';

    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'updated_date';

    protected $fillable = [
        'user_id',
        'item_id',
        'item_amount',
    ];

    protected $casts = [
        'user_id'      => 'integer',
        'item_id'      => 'string',
        'item_amount'  => 'integer',
        'created_date' => 'datetime',
        'updated_date' => 'datetime',
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function fish(){
        return $this->belongsTo(Fish::class, 'item_id', 'fish_id');
    }
}
