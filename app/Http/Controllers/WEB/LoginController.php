<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;

use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\{
    Validator
};

class LoginController extends Controller{
    public function index(){
        return view('index');
    }

    public function signin(){
        return view('login');
    }

    public function login(Request $request){
        $validator = Validator::make($request->all(), [
            'username' => 'required|string',
            'password' => 'required|string'
        ]);

        if($validator->fails()){
            return redirect()->route('web.signin')->withErrors($validator)->withInput();
        }

        if($request->username !== env('ADMIN_USERNAME')){
            return redirect()->route('web.signin')->with('error', 'Invalid username!')->withInput();
        }

        $user = User::where('username', $request->username)->first();

        if(!$user || $request->password !== env('ADMIN_PASSWORD')){
            return redirect()->route('web.signin')->with('error', 'Invalid password!')->withInput();
        }

        session(["endral_admin" => $user->toArray()]);
        $request->session()->regenerate();

        return redirect()->route('web.index')->with('success', 'Successfully logged in!');
    }

    public function logout(Request $request){
        $request->session()->forget(['endral_admin']);
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('web.signin')->with('success', 'Successfully logged out!');
    }
}
