<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGuestBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('guest_books', function (Blueprint $table) {
            $table->id();
            $table->string('guest_book_id')->unique();
            $table->string('image')->nullable();
            $table->string('name');
            $table->string('address')->nullable();
            $table->string('phone')->nullable();
            $table->string('comments')->nullable();
            $table->unsignedInteger('attendance')->default(0);
            $table->enum('present_type', ['present', 'not_present'])->default('present');
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
        Schema::dropIfExists('guest_books');
    }
}
