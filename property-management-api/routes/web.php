<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
Route::middleware('api')
    ->prefix('api')
    ->group(base_path('routes/api.php'));

Route::middleware('web')
    ->group(base_path('routes/web.php'));
