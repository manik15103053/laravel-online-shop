<?php

use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SubCategoryController;
use App\Http\Controllers\TempImageController;
use App\Models\Product;
use Illuminate\Support\Facades\Route;





Route::prefix('admin')->name('admin.')->group(function(){
    Route::middleware(['auth:admin'])->group(function(){

        //Category
        Route::prefix('categories')->name('category.')->group(function(){
            Route::get('/',[CategoryController::class,'index'])->name('index');
            Route::get('/create',[CategoryController::class,'create'])->name('create');
            Route::post('/store',[CategoryController::class,'store'])->name('store');
            Route::get('/edit/{id}',[CategoryController::class,'edit'])->name('edit');
            Route::post('/update/{id}',[CategoryController::class,'update'])->name('update');
            Route::get('/delete/{id}',[CategoryController::class,'delete'])->name('delete');
            Route::get('/get-slug',[CategoryController::class,'getSlug'])->name('get-slug');
        });

        Route::post('/temp-image-create',[TempImageController::class,'tempImgCreate'])->name('tempImage_create');

        //Sub Category
        Route::prefix('sub-categories')->name('sub-category.')->group(function(){
            Route::get('/',[SubCategoryController::class,'index'])->name('index');
            Route::get('/create',[SubCategoryController::class,'create'])->name('create');
            Route::post('/store',[SubCategoryController::class,'store'])->name('store');
            Route::get('/edit/{id}',[SubCategoryController::class,'edit'])->name('edit');
            Route::post('/update/{id}',[SubCategoryController::class,'update'])->name('update');
            Route::get('/delete/{id}',[SubCategoryController::class,'delete'])->name('delete');
            Route::get('/get-sub-category-slug',[SubCategoryController::class,'getSubCatSlug'])->name('getSubCategorySlug');
        });

        //Brand
        Route::prefix('brands')->name('brand.')->group(function(){
            Route::get('/',[BrandController::class,'index'])->name('index');
            Route::get('/create',[BrandController::class,'create'])->name('create');
            Route::post('/store',[BrandController::class,'store'])->name('store');
            Route::get('/edit/{id}',[BrandController::class,'edit'])->name('edit');
            Route::post('/update/{id}',[BrandController::class,'update'])->name('update');
            Route::get('/delete/{id}',[BrandController::class,'delete'])->name('delete');
            Route::get('/get-brand-slug',[BrandController::class,'getBrandSlug'])->name('getBrand.slug');
        });

        //Product
        Route::prefix('products')->name('product.')->group(function(){
            Route::get('/',[ProductController::class,'index'])->name('index');
            Route::get('/create',[ProductController::class,'create'])->name('create');
            Route::post('/store',[ProductController::class,'store'])->name('store');
            Route::get('/edit/{id}',[ProductController::class,'edit'])->name('edit');
            Route::post('/update/{id}',[ProductController::class,'update'])->name('update');
            Route::get('/delete/{id}',[ProductController::class,'delete'])->name('delete');
            Route::get('/get-product-slug',[ProductController::class,'getProductSlug'])->name('getProduct.slug');
            Route::get('/get-subCategory/by-category',[ProductController::class,'getSubCategory'])->name('getSubCategoryByCategory');
        });
    });
});
