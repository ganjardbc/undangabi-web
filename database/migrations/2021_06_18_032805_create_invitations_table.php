<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvitationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invitations', function (Blueprint $table) {
            $table->id();
            $table->string('invitation_id')->unique();
            $table->string('short_link')->unique()->nullable();
            $table->string('cover')->nullable();
            $table->string('title');
            $table->string('description')->nullable();
            $table->string('video')->nullable();
            $table->string('day');
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->date('date');
            $table->string('type')->nullable();
            $table->enum('status', ['active', 'inactive'])->default('inactive');
            $table->boolean('is_available');
            $table->unsignedBigInteger('theme_id')->nullable();
            $table->unsignedBigInteger('song_id')->nullable();
            $table->unsignedBigInteger('user_id');
            $table->string('created_by')->nullable();
            $table->string('updated_by')->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('invitations');
    }
}
