<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::get('/properties', [PropertiesController::class, 'index']);
Route::get('/properties/{id}', [PropertiesController::class, 'show']);
Route::post('/properties', [PropertiesController::class, 'store']);
Route::put('/properties/{id}', [PropertiesController::class, 'update']);
Route::delete('/properties/{id}', [PropertiesController::class, 'destroy']);
