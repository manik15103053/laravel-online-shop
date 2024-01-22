<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\SubCategory;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    public function shop(Request $request, $categorySlug = null, $subCategorySlug = null){

        $categorySelected = '';
        $subCategorySelected = '';
        $brandArray = [];
        $data = [];

        if(!empty($request->get('brand'))){
            $brandArray = explode(',',$request->get('brand'));
        }
        $data['categories'] = Category::where('status',1)->with('subCategory')->orderBy('name','asc')->get();
        $data['brands'] = Brand::where('status', 1)->orderBy('name','asc')->get();


        $products = Product::where('status', 1);
        if(!empty($categorySlug)){
            $category = Category::where('slug', $categorySlug)->first();
            $products = $products->where('category_id',$category->id);
            $categorySelected = $category->id;
        }

        if(!empty($subCategorySlug)){
            $subCategory = SubCategory::where('slug', $subCategorySlug)->first();
            $products = $products->where('sub_category_id', $subCategory->id);
            $subCategorySelected = $subCategory->id;
        }


        $products = $products->orderBy('id','desc');
        $data['products'] = $products->get();
        $data['categorySelected'] = $categorySelected;
        $data['subCategorySelected'] = $subCategorySelected;
        $data['brandArray']  = $brandArray;
        return view('frontend.product.shop',$data);
    }
}
