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

        $selectedBrands = $request->input('brand', []);

        // dd($selectedBrands);
        // $brands = explode(',',$request->get('brand'));
        $categorySelected = '';
        $subCategorySelected = '';
        $brandArray = [];
        $data = [];

        // if(!empty($request->get('brand'))){
        //     $brandArray = explode(',',$request->get('brand'));
        // }

        // if(!empty($brands)){
        //     $brandArray = $brands;
        // }
        // dd($brandArray);
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
        //   dd($subCategory);
            $products = $products->where('sub_category_id',$subCategory->id);
            $subCategorySelected = $subCategory->id;
        }

        if(!empty($selectedBrands)){
            $products = $products->whereIn('brand_id',$selectedBrands);
        }


        // if ($request->ajax()) {
        //     // If the request is AJAX, return a partial view with the filtered products
        //     return view('partials.filtered_products', compact('products'));
        // }

        $products = $products->orderBy('id','desc');
        $data['products'] = $products->get();
        $data['categorySelected'] = $categorySelected;
        $data['subCategorySelected'] = $subCategorySelected;
        $data['brandArray']  = $brandArray;


        if ($request->ajax()) {
            // If the request is AJAX, return a partial view with the filtered products
            return view('frontend.product.shop',$data);
        }

        return view('frontend.product.shop',$data);
    }
}
