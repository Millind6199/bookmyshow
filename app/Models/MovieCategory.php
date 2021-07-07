<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MovieCategory extends Model
{
    use HasFactory;
    protected $table='movie_categories';
    public $timestamps = false;

    protected $fillable = [
      'fkmovie_id',
      'fkcat_id',
    ];

}
