<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMovieTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('movie_tickets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('fkmovie_id');
            $table->foreign('fkmovie_id')->references('id')->on('movies');
            $table->string('qty');
            $table->date('date');
            $table->string('no');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('movie_tickets');
    }
}
