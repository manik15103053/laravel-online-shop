<?php

namespace App\Http\Controllers\Admin;

use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\TempImage;
use App\Models\SubCategory;
use Illuminate\Support\Str;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use SebastianBergmann\Template\Template;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function index(Request $request){

        $products = Product::with('product_image');

        if($request->get('keyword') != null){
            $products = $products->where('title','like','%'.$request->keyword.'%')
                                  ->orWhere('price','like','%'.$request->keyword.'%')
                                  ->orWhere('sku','like','%'.$request->keyword.'%');
        }
        $products = $products->orderBy('id', 'desc')->paginate(10);
        // dd($products);
        return view('admin.product.index', compact('products'));
    }

    public function create(){

        $data = [];
        $categories = Category::orderBy('id','ASC')->get();
        $brands     = Brand::orderBy('id','ASC')->get();
        $data['categories'] = $categories;
        $data['brands'] = $brands;
        return view('admin.product.create', $data);
    }

    public function store(Request $request){


        $new_image_arrays = explode(',', $request->image_new_array);

        $rules = [
            'title' => 'required',
            'slug' => 'required|unique:products',
            'sku' => 'nullable',
            'price' => 'required',
            'track_qty' => 'required|in:Yes,No',
            'category' => 'required|numeric',
            'is_featured' => 'required|in:Yes,No',
        ];

        if(!empty($request->track_qty) && $request->track_qty == 'Yes'){
            $rules['qty'] = 'required|numeric';
        }

       $validator =  Validator::make($request->all(), $rules);
        if($validator->passes()){
            $product = new Product();
            $product->title = $request->title;
            $product->slug = $request->slug;
            $product->price = $request->price;
            $product->description = $request->description;
            $product->compare_price = $request->compare_price;
            $product->sku = $request->sku;
            $product->barcode = $request->barcode;
            $product->track_qty = $request->track_qty;
            $product->qty = $request->qty;
            $product->status = $request->status;
            $product->category_id = $request->category;
            $product->category_id = $request->category;
            $product->sub_category_id = $request->sub_category;
            $product->brand_id = $request->brand;
            $product->is_featured = $request->is_featured;
            $product->save();

            //Save Gallery Image
            if (!empty($new_image_arrays)) {
                foreach ($new_image_arrays as $tem_img_id) {

                    $tempImageInfo  = TempImage::find($tem_img_id);
                    // $extArray = $tempImageInfo->name;
                    // $ext = last($extArray);
                    $productImage = new ProductImage();
                    $productImage->product_id = $product->id;
                    $productImage->image = 'NULL';
                    $productImage->save();

                    $imageName = $product->id . '-' . $productImage->id . '-' . time() . '-' . $tempImageInfo->name;
                    $productImage->image = $imageName;
                    $productImage->save();

                    $sourcePath = public_path() . '/temp/' . $tempImageInfo->name;
                    $destPathLarge = public_path() . '/uploads/product/large/' . $imageName;
                    $destPathSmall = public_path() . '/uploads/product/small/' . $imageName;

                    $image = Image::make($sourcePath);

                    // Large Image (resize to 1400 width)
                    $imageLarge = clone $image;
                    $imageLarge->resize(1400, null, function ($constraint) {
                        $constraint->aspectRatio();
                    });
                    $imageLarge->save($destPathLarge);

                    // Small Image (fit into 300x300)
                    $imageSmall = clone $image;
                    $imageSmall->fit(300, 300);
                    $imageSmall->save($destPathSmall);
                }
            }

            $request->session()->flash('success', 'Product Created Successfully');
            return response()->json([
                'status' => true,
                'message' => 'Product Created Successfully'
            ]);
        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

    }

    public function edit($id){

        $data = [];
        $product = Product::find($id);

        $data['product'] = $product;
        $data['product_images'] = ProductImage::where('product_id', $product->id)->get();
        $data['subCategory'] = SubCategory::where('category_id',$product->category_id)->get();

        $categories = Category::orderBy('id','ASC')->get();
        $brands     = Brand::orderBy('id','ASC')->get();
        $data['categories'] = $categories;
        $data['brands'] = $brands;

        return view('admin.product.edit',$data);
    }

    public function update(Request $request, $id){

        $new_image_arrays = explode(',', $request->image_new_array);
        $product = Product::find($id);

        $rules = [
            'title' => 'required',
            // 'slug' => 'required|unique:products,slug,' . $product->id,
            'slug' => 'required|unique:products,slug,'.$product->id,
            'sku' => 'nullable',
            'price' => 'required',
            'track_qty' => 'required|in:Yes,No',
            'category' => 'required|numeric',
            'is_featured' => 'required|in:Yes,No',
        ];

        if(!empty($request->track_qty) && $request->track_qty == 'Yes'){
            $rules['qty'] = 'required|numeric';
        }

       $validator =  Validator::make($request->all(), $rules);
        if($validator->passes()){

            $product->title = $request->title;
            // $product->slug = $request->slug;
            $product->price = $request->price;
            $product->description = $request->description;
            $product->compare_price = $request->compare_price;
            $product->sku = $request->sku;
            $product->barcode = $request->barcode;
            $product->track_qty = $request->track_qty;
            $product->qty = $request->qty;
            $product->status = $request->status;
            $product->category_id = $request->category;
            $product->category_id = $request->category;
            $product->sub_category_id = $request->sub_category;
            $product->brand_id = $request->brand;
            $product->is_featured = $request->is_featured;
            $product->save();

            //Save Gallery Image
            if (!empty($new_image_arrays)) {
                foreach ($new_image_arrays as $tem_img_id) {

                    $tempImageInfo  = TempImage::find($tem_img_id);
                    // $extArray = $tempImageInfo->name;
                    // $ext = last($extArray);
                    $productImage = new ProductImage();
                    $productImage->product_id = $product->id;
                    $productImage->image = 'NULL';
                    $productImage->save();

                    $imageName = $product->id . '-' . $productImage->id . '-' . time() . '-' . $tempImageInfo->name;
                    $productImage->image = $imageName;
                    $productImage->save();

                    $sourcePath = public_path() . '/temp/' . $tempImageInfo->name;
                    $destPathLarge = public_path() . '/uploads/product/large/' . $imageName;
                    $destPathSmall = public_path() . '/uploads/product/small/' . $imageName;

                    $image = Image::make($sourcePath);

                    // Large Image (resize to 1400 width)
                    $imageLarge = clone $image;
                    $imageLarge->resize(1400, null, function ($constraint) {
                        $constraint->aspectRatio();
                    });
                    $imageLarge->save($destPathLarge);

                    // Small Image (fit into 300x300)
                    $imageSmall = clone $image;
                    $imageSmall->fit(300, 300);
                    $imageSmall->save($destPathSmall);
                }
            }

            $request->session()->flash('success', 'Product Updated Successfully');
            return response()->json([
                'status' => true,
                'message' => 'Product Updated Successfully'
            ]);
        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function delete(Request $request, $id){

        $product = Product::find($id);
        if(empty($product)){
            $request->session()->flash('error', 'Product not found');
            return response()->json([
                'status' => false,
                'message' => 'Product not found'
            ]);
        }

        // Retrieve and delete associated images
        $productImages = ProductImage::where('product_id', $id)->get();
        if(!empty($productImages)){
            foreach($productImages as $item_image){
                File::delete(public_path('uploads/product/large/'.$item_image->image));
                File::delete(public_path('uploads/product/small/'.$item_image->image));
            }

            ProductImage::where('product_id', $id)->delete();
        }

        // Delete the product
        $product->delete();

        $request->session()->flash('success', 'Product  deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Product  deleted successfully'
        ]);
    }


    public function getProductSlug(Request $request){
        if(!empty($request->title)){
            $slug = Str::slug($request->title);

            return response()->json([
                'status' => true,
                'slug' => $slug,
            ]);
        }
    }

    public function getSubCategory(Request $request){
        if(!empty($request->category_id)){
            $subCategory = SubCategory::where('category_id', $request->category_id)->orderBy('id', 'ASC')->get();
            return response()->json([
                'status' => true,
                'subCategory' => $subCategory,
            ]);
        }else{
            return response()->json([
                'status' => true,
                'subCategory' => [],
            ]);
        }
    }
}
