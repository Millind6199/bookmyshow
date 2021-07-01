<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    use HasFactory;
    protected $table = 'movies';
    protected $fillable = [
        'name',
        'overview',
        'image',
        'casts',
        'runtime',
        'release_year',
        'lang',
        'screen',
        'cat_id'
    ];

    public function getProductImageAttribute($value)
    {
        return asset('uploads/'.$value);
    }
}
