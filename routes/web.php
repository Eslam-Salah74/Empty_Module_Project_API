<?php

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
   //\Artisan::call('migrate');
   //\Artisan::call('db:seed');
   //\Artisan::call('module:seed');
    return view('welcome');
});


Route::get('/clear-cache', function () {
   Artisan::call('cache:clear');
	Artisan::call('config:cache');
   Artisan::call('route:clear');

   return "Cache cleared successfully";
});


Route::get('/migrate', function () {
   Artisan::call('migrate');

   return "Migration created successfully";
});

Route::get('/seed', function () {
   //\Artisan::call('migrate');
   Artisan::call('db:seed');
   Artisan::call('module:seed');
    return "seeded successfully";
});

Route::get('/links', function () {
   Artisan::call('storage:link');

   return "Storage link created successfully";
});