<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\Auth\LoginController;
use Illuminate\Support\Facades\Route;





Route::prefix('admin')->name('admin.')->group(function(){
    Route::middleware(['guest:admin'])->group(function(){
        Route::get('/',[LoginController::class,'login'])->name('login');
        Route::post('/check-authenticate',[LoginController::class,'authenticate'])->name('authenticate');
    });




Route::middleware(['auth:admin'])->group(function(){
        Route::get('/home',[AdminController::class,'home'])->name('home');
        Route::get('/logout',[LoginController::class,'logout'])->name('logout');
    });
});
