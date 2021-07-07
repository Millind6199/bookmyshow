<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateColumnInMovieCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('movie_categories', function (Blueprint $table) {
            $table->dropForeign('movie_categories_fkmovie_id_foreign');
            $table->foreign('fkmovie_id')
                ->references('id')->on('movies')
                ->onDelete('cascade');

            $table->dropForeign('movie_categories_fkcat_id_foreign');
            $table->foreign('fkcat_id')
                ->references('id')->on('categories')
                ->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('movie_categories', function (Blueprint $table) {
            $table->dropForeign(['fkmovie_id']);
            $table->dropForeign(['fkcat_id']);

        });
    }
}
