<?php

namespace App\Http\Controllers;

use App\Models\TempImage;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class TempImageController extends Controller
{
    public function tempImgCreate(Request $request){

        $image = $request->image;
        if(!empty($image)){
            $ext = $image->getClientOriginalExtension();
            $newImage = time().'.'.$ext;
            

            $tempImage = new TempImage();
            $tempImage->name = $newImage;
            $tempImage->save();

            $image->move(public_path().'/temp', $newImage);
            // $request->session()->flash('success', 'Image Uploaded Successfully');
            //Genarate Thumbnil
            $sourcePath = public_path().'/temp/'. $newImage;
            $desPath =    public_path().'/temp/thumb/'. $newImage;
            $image = Image::make($sourcePath);
            $image->fit(300,275);
            $image->save($desPath);
            return response()->json([
                'status' => true,
                'image_id' => $tempImage->id,
                'imagePath' => asset('temp/thumb/'.$newImage),
                'message' => 'Image Uploaded Successfully'
            ]);
        }
    }
}
