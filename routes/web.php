<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/download/guest/export/{id}', 'PublicController@guestExport');
Route::get('/download/guestBook/export/{id}', 'PublicController@guestBookExport');
Route::get('/download/reservation/export/{id}', 'PublicController@reservationExport');
Route::get('/download/invitation/receipt/{id}', 'PublicController@invitationReceipt');
Route::get('{any}', 'AppController@main')->where('any', '.*');
