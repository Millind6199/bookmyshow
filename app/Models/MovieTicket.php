<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MovieTicket extends Model
{
    use HasFactory;
    protected $table = 'movie_tickets';
    protected $fillable = [
        'fkmovie_id',
        'qty',
        'date',
        'no',
        'fkuser_id'


    ];
}
