<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Modules\MasterData\App\Http\Controllers\DepartmentController;
use Modules\MasterData\App\Http\Controllers\AuthController;
use Modules\MasterData\App\Http\Controllers\EmployeesController;
use Modules\MasterData\App\Http\Controllers\RoleController;
use Modules\MasterData\App\Http\Controllers\PermissionController;
use Modules\MasterData\App\Http\Controllers\BranchController;

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

Route::prefix('v1/auth')->name('api.')->group(function () {
    Route::post('login' , [AuthController::class , 'login'])->name('auth')->middleware('request.logger');
    });
    Route::middleware(['auth:sanctum'])->prefix('v1')->name('api.')->group(function () {
        Route::prefix('master-data')->name('department.')->group(function () {
          Route::resource('/departments', DepartmentController::class);
          Route::resource('/employees', EmployeesController::class);
          Route::resource('/roles', RoleController::class);
          Route::resource('/permissions', PermissionController::class);
          Route::resource('/branches', BranchController::class);
        });
      
      
        });
    
    