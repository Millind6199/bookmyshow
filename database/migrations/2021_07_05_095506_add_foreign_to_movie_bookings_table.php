<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignToMovieBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('movie_tickets', function (Blueprint $table) {
            $table->unsignedBigInteger('fkuser_id');
            $table->foreign('fkuser_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('movie_tickets', function (Blueprint $table) {
            $table->dropForeign(['cat_id']);
        });
    }
}
