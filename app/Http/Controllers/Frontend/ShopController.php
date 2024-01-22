<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    public function shop(){
        $data = [];
        $data['categories'] = Category::where('status',1)->with('subCategory')->orderBy('name','asc')->get();
        $data['brands'] = Brand::where('status', 1)->orderBy('name','asc')->get();
        $data['products'] = Product::where('status', 1)->latest()->get();
        return view('frontend.product.shop',$data);
    }
}
