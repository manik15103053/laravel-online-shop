<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\TempImage;
use Illuminate\Support\Facades\Validator;
use File;
use Image;
class CategoryController extends Controller
{
    public function index(Request $request){



        $categories = Category::orderBy('id','desc')->paginate(10);


        return view('admin.category.index', compact('categories'));
    }

    public function create(){
        return view('admin.category.create');
    }

    public function store(Request $request){

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:categories'
        ]);

        if($validator->passes()){

            $category = new Category();
            $category->name = $request->name;
            $category->slug = $request->slug;
            $category->status = $request->status;
            $category->show_home = $request->show_home;
            $category->save();

            //Save Image Here
            if(!empty($request->image_id)){
                $tempImage = TempImage::find($request->image_id);
                $extArray = explode('.', $tempImage->name);
                $ext = last($extArray);



                $newImageName = $category->id.'.'.$ext;
                $sPath = public_path().'/temp/'.$tempImage->name;
                $dPath = public_path().'/uploads/category/'.$newImageName;
                File::copy($sPath, $dPath);


                //Genarate Image Thumb
                $dPath = public_path().'/uploads/category/thumb/'.$newImageName;
                $img = Image::make($sPath);
                $img->resize(450, 600);
                $img->save($dPath);


                $category->image = $newImageName;
                $category->save();

            }

            $request->session()->flash('success', 'Category Added successfully');
            return response()->json([
                'status' => true,
                'message' => 'Category Added successfully.'
            ]);
        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }


    public function getSlug(Request $request){
        $slug = '';
        if(!empty($request->title)){
            $slug = Str::slug($request->title);
        }

        return response()->json([
            'status' => true,
            'slug'  => $slug
        ]);
    }


    public function edit($id){
        $category = Category::find($id);
        if(empty($category)){
            return redirect()->route('admin.category.index');
        }

        return view('admin.category.edit', compact('category'));
    }

    public function update(Request $request, $id){

        $category = Category::find($id);
        if(empty($category)){
            return response()->json([
                'status' => false,
                'notFound' => false,
                'message' => 'Category Not found'
            ]);
        }

        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'slug' => 'required|unique:categories,slug,'.$category->id,
        ]);

        if($validator->passes()){

            $category->name = $request->name;
            $category->slug = $request->slug;
            $category->status = $request->status;
            $category->show_home = $request->show_home;

            $category->save();

            //Save Image Here
            if(!empty($request->image_id)){

                if($category->image){

                    $image_path = public_path().'/uploads/category/'.$category->image;

                    if (File::exists($image_path)) {
                        File::delete($image_path);
                    }
                }

                $tempImage = TempImage::find($request->image_id);
                $extArray = explode('.', $tempImage->name);
                $ext = last($extArray);



                $newImageName = $category->id.'.'.$ext;
                $sPath = public_path().'/temp/'.$tempImage->name;
                $dPath = public_path().'/uploads/category/'.$newImageName;
                File::copy($sPath, $dPath);


                //Genarate Image Thumb
                $dPath = public_path().'/uploads/category/thumb/'.$newImageName;
                $img = Image::make($sPath);
                $img->resize(450, 600);
                $img->save($dPath);


                $category->image = $newImageName;
                $category->save();

            }

            $request->session()->flash('success', 'Category Updated successfully');
            return response()->json([
                'status' => true,
                'message' => 'Category Updated successfully.'
            ]);
        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

    }

    public function delete(Request $request, $id){

        $category = Category::find($id);
        if(empty($category)){
            $request->session()->flash('error', 'Category not found');
            return response()->json([
                'status' => true,
                'message' => 'Category not found'
            ]);

            // return redirect()->route('admin.category.index');
        }

        if($category->image){

            $image_path = public_path().'/uploads/category/'.$category->image;

            if (File::exists($image_path)) {
                File::delete($image_path);
            }
        }

        $category->delete();

        $request->session()->flash('success', 'Category Deleted successfully');

        return response()->json([
            'status' => true,
            'message' => 'Category Deleted successfully.'
        ]);
    }

}
