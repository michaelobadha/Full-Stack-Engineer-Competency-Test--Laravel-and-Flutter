<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::get('/properties', [CustomerController::class, 'index']);
Route::get('/properties/{id}', [CustomerController::class, 'show']);
Route::post('/properties', [CustomerController::class, 'store']);
Route::put('/properties/{id}', [CustomerController::class, 'update']);
Route::delete('/properties/{id}', [CustomerController::class, 'destroy']);
