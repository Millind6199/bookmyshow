<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\CategoryController;

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

Route::post('/addmovie' ,[MovieController::class,'store']);
Route::get('/viewdata' ,[MovieController::class,'show']);
Route::get('/viewdata/{id}' ,[MovieController::class,'showById']);
Route::delete('/deletedata/{id}',[MovieController::class , 'destroy']);

Route::get('/categories' ,[CategoryController::class,'show']);


//Route::post('/login' , [LoginController::class,'store']);
