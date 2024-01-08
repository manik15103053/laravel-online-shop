<?php

namespace App\Http\Controllers\Admin;

use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Support\Str;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\TempImage;
use Intervention\Image\Facades\Image;
use SebastianBergmann\Template\Template;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function index(){

        $products = Product::with('product_image')->orderBy('id', 'desc')->paginate(10);
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


        // dd($request->all());
        $new_image_arrays = explode(',', $request->image_new_array);
        // dd($new_image_array);
        // exit();
        $rules = [
            // 'title' => 'required',
            // 'slug' => 'required|unique:products',
            // 'sku' => 'nullable',
            // 'price' => 'required',
            // 'track_qty' => 'required|in:Yes,No',
            // 'category' => 'required|numeric',
            // 'is_featured' => 'required|in:Yes,No',
        ];

        if(!empty($request->track_qty) && $request->track_qty == 'Yes'){
            // $rules['qty'] = 'required|numeric';
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

    }

    public function update(Request $request, $id){

    }

    public function delete($id){

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
