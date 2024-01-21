<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class SubCategoryController extends Controller
{
    public function index(){

        $subCategories = SubCategory::orderBy('id', 'desc')->paginate(10);
        return view('admin.sub-category.index', compact('subCategories'));
    }

    public function create(){

        $categories = Category::orderBy('id','desc')->get();
        return view('admin.sub-category.create', compact('categories'));
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(),[

            'category' => 'required',
            'name' => 'required',
            'slug' => 'required|unique:sub_categories,slug,',
        ]);

        if($validator->passes()){

            $sub_category = new SubCategory();
            $sub_category->name = $request->name;
            $sub_category->slug = $request->slug;
            $sub_category->category_id = $request->category;
            $sub_category->status = $request->status;
            $sub_category->show_home = $request->show_home;
            $sub_category->save();

            $request->session()->flash('success', 'Sub Category Added successfully');
            return response()->json([
                'status' => true,
                'message' => 'Sub Category Added successfully'
            ]);

        }else{
            return response()->json([
                'status'  => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit($id){
        $sub_category = SubCategory::find($id);
        $categories = Category::orderBy('id','desc')->get();

        return view('admin.sub-category.edit', compact('sub_category', 'categories'));
    }

    public function update(Request $request, $id){

        $sub_category = SubCategory::find($id);

        $validator = Validator::make($request->all(),[

            'category' => 'required',
            'name' => 'required',
            'slug' => 'required|unique:sub_categories,slug,' . $sub_category->id.',id',

        ]);

        if($validator->passes()){


            $sub_category->name = $request->name;
            $sub_category->slug = $request->slug;
            $sub_category->category_id = $request->category;
            $sub_category->status = $request->status;
            $sub_category->show_home = $request->show_home;
            $sub_category->save();

            $request->session()->flash('success', 'Sub Category Updated successfully');
            return response()->json([
                'status' => true,
                'message' => 'Sub Category Updated successfully'
            ]);

        }else{
            return response()->json([
                'status'  => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function delete(Request $request, $id){

        $sub_category = SubCategory::find($id);
        if(empty($sub_category)){
            $request->session()->flash('error', 'Sub Category not found');
            return response()->json([
                'status' => true,
                'message' => 'Sub Category not found'
            ]);

            // return redirect()->route('admin.category.index');
        }

        $sub_category->delete();

        $request->session()->flash('success', 'Sub Category Deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Sub Category Deleted successfully.'
        ]);
    }

    public function getSubCatSlug(Request $request){
        $slug = '';
        if(!empty($request->title)){
            $slug = Str::slug($request->title);

            return response()->json([
                'status' => true,
                'slug' => $slug
            ]);
        }
    }




}
