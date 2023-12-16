<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BrandController extends Controller
{
    public function index(){
        $brands = Brand::orderBy('id', 'desc')->paginate(10);
        return view('admin.brand.index', compact('brands'));
    }

    public function create(){
        return view('admin.brand.create');
    }

    public function store(Request $request){

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:brands,slug,',
        ]);

        if($validator->passes()){

            $brand = new Brand();
            $brand->name = $request->name;
            $brand->slug = $request->slug;
            $brand->status = $request->status;
            $brand->save();

            $request->session()->flash('success', 'Brand Added successfully');
            return response()->json([
                'status' => true,
                'message' => 'Brand Added successfully'
            ]);
        }else{
            return response()->json([
                'status'  => false,
                'errors' => $validator->errors()
            ]);
        }
    }
    public function edit($id){
        $brand = Brand::find($id);
        return view('admin.brand.edit', compact('brand'));
    }

    public function update(Request $request, $id){

        $brand =  Brand:: find($id); 

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:brands,slug,'.$brand->id,
        ]);

        if($validator->passes()){

            
            $brand->name = $request->name;
            $brand->slug = $request->slug;
            $brand->status = $request->status;
            $brand->save();

            $request->session()->flash('success', 'Brand Updated successfully');
            return response()->json([
                'status' => true,
                'message' => 'Brand Updated successfully'
            ]);
        }else{
            return response()->json([
                'status'  => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function delete(Request $request, $id){

        $brand = Brand::find($id);
        if(empty($brand)){
            $request->session()->flash('error', 'Brand not found');
            return response()->json([
                'status' => true,
                'message' => 'Brand not found'
            ]);

            // return redirect()->route('admin.category.index');
        }

        $brand->delete();

        $request->session()->flash('success', 'Brand Deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Brand Deleted successfully.'
        ]);

    }  
    
    public function getBrandSlug(Request $request){
        if(!empty($request->title)){
            $slug = Str::slug($request->title);

            return response()->json([
                'status' => true,
                'slug' => $slug
            ]);
        }
    }
}
