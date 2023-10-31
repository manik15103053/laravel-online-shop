<?php

namespace App\Http\Controllers;

use App\Models\TempImage;
use Illuminate\Http\Request;

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

            return response()->json([
                'status' => true,
                'image_id' => $tempImage->id,
                'message' => 'Image Uploaded Successfully'
            ]);
        }
    }
}
