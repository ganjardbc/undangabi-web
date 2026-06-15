<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSpecialThanksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('special_thanks', function (Blueprint $table) {
            $table->id();
            $table->string('specialthanks_id')->unique();
            $table->string('icon')->nullable();
            $table->string('name');
            $table->string('link');
            $table->enum('status', ['active', 'inactive'])->default('inactive');
            $table->boolean('is_available');
            $table->unsignedBigInteger('invitation_id');
            $table->string('created_by')->nullable();
            $table->string('updated_by')->nullable();
            $table->timestamps();

            $table->foreign('invitation_id')->references('id')->on('invitations');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('special_thanks');
    }
}
