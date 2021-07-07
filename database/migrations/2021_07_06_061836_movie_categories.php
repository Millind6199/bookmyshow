<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class MovieCategories extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
            Schema::create('movie_categories', function(Blueprint $table){
                $table->id();
                $table->unsignedBigInteger('fkmovie_id');
                $table->foreign('fkmovie_id')->references('id')->on('movies');
                $table->unsignedBigInteger('fkcat_id');
                $table->foreign('fkcat_id')->references('id')->on('categories');


            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('movie_categories');
    }
}
