<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index(){
        $data = [];
      
        $data['feature_products'] = Product::where('is_featured','Yes')->where('status', 1)->orderBy('id','desc')->get();
        $data['latest_products'] = Product::where('is_featured', "No")->where('status', 1)->orderBy('id','desc')->get();
        return view('frontend.home',$data);
    }
}
