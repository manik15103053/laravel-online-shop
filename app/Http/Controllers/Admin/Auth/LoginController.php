<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(){
        return view('admin.auth.login');
    }

    public function authenticate(Request $request) {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
    
        if (Auth::guard('admin')->attempt($credentials)) {
            if (Auth::check()) {
                $user = Auth::user();
                if ($user->role == 2) {
                    return redirect()->route('admin.home');
                    $request->session()->flash('success', 'Welcome To Dashboard');

                } else {
                    return redirect()->route('user.home');
                }
            }
        }
        $request->session()->flash('error', 'Invalid Credentials');
        return redirect()->route('admin.login')->with('error', 'Invalid Credentials');
    }
    
    

    public function logout(){
        if (Auth::guard('admin')->check()) {
            // Check the user's role
            if (Auth::user()->role == 2) {
                Auth::guard('admin')->logout();
                return redirect()->route('admin.login');
            }
        }
        
        // If the user doesn't have role 2 or is not authenticated, just log them out and redirect
        Auth::logout();
        return redirect()->route('index');
    }
    
    
    
    
    
    
}
