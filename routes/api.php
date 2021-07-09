<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\MovieTicketController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::apiResource('/login' , 'Auth\LoginController');
Route::apiResource('/signup' , 'Auth\RegisterController');

Route::post('/addmovie' ,[MovieController::class,'store'])->middleware('auth:api');
Route::get('/viewdata' ,[MovieController::class,'show'])->middleware('auth:api');
Route::get('/viewdata/{id}' ,[MovieController::class,'showById'])->middleware('auth:api');
Route::delete('/deletedata/{id}',[MovieController::class , 'destroy'])->middleware('auth:api');
Route::post('/edit/{id}',[MovieController::class,'update'])->middleware('auth:api');
Route::get('/search/{search}',[MovieController::class, 'search'])->middleware('auth:api');
Route::get('/search/{search}',[MovieController::class, 'search'])->middleware('auth:api');


Route::get('/categories' ,[CategoryController::class,'show'])->middleware('auth:api');

Route::post('/booking/{id}',[MovieTicketController::class,'store'] )->middleware('auth:api');
Route::get('/bookedticket/{id}',[MovieTicketController::class,'getAllBookedSeats'])->middleware('auth:api');
Route::get('/bookedtickets',[MovieTicketController::class,'show'])->middleware('auth:api');

Route::get('/email', 'EmailController@create');
Route::post('/email', 'EmailController@sendEmail')->middleware('auth:api');
