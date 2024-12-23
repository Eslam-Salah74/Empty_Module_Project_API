<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('v1/test',function(){
    $settings = [
         [
            'key' => 'receipt_type',
            'value' => 'R',
            'options' => [
                'R',
                'P',
            ],
            'type'=>'dropdown'

        ],
        [
            'key' => 'branch_code',
            'value' => true,
            'options' => [
                true,
                false,
            ],
            'type'=>'boolean',

        ],
        [
            'key' => 'activity_code',
            'options' => [
                true,
                false,
            ],
            'type'=>'boolean',

        ],
        [
            'key' => 'serial',
            'value' => 1,
            'type'=>'numeric',

        ],

    ];

    return $settings;
});
