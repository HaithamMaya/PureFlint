<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWaterLeadTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('water_lead_data', function(Blueprint $table) {
            $table->increments('id');
            $table->string('address');
            $table->string('zip_code')->nullable();
            $table->double('latitude', 6, 4)->default(0);
            $table->double('longitude', 6, 4)->default(0);
            $table->string('water_source')->nullable();
            $table->string('water_test_kit_type')->nullable();
            $table->string('water_filter_type')->nullable();
            $table->string('water_usage')->nullable();
            $table->integer('copper_ppb')->default(0);
            $table->integer('lead_ppb')->default(0);
            $table->string('g_place_id')->nullable();
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users');
            $table->string('date_of_test')->nullable();
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
        Schema::drop('water_lead_data');
    }
}
