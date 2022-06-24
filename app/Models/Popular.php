<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Popular extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id'
    ];
    public $timestamps = false;
}