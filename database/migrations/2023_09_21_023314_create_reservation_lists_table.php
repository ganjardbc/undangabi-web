<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReservationListsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reservation_lists', function (Blueprint $table) {
            $table->id();
            $table->string('reservation_list_id')->unique();
            $table->string('image')->nullable();
            $table->string('name');
            $table->string('phone')->nullable();
            $table->string('address')->nullable();
            $table->string('comments')->nullable();
            $table->unsignedInteger('attendance')->default(0);
            $table->string('present_type', 64)->nullable();
            $table->boolean('is_invited');
            $table->enum('status', ['active', 'inactive'])->default('inactive');
            $table->boolean('is_available');
            $table->unsignedBigInteger('invitation_id');
            $table->unsignedBigInteger('bride_id')->nullable();
            $table->unsignedBigInteger('reservation_schedule_id')->nullable();
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
        Schema::dropIfExists('reservation_lists');
    }
}
