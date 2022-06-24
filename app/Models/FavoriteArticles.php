<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FavoriteArticles extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 'articles_id'
    ];
    public $timestamps = false;
}
