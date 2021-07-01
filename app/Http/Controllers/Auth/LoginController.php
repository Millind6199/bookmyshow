<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function store(Request $request){
//        dd($request->all());
//        $data = User::get()->first();
//        print_r($data);


        if(Auth::guard('user')->attempt($request->all())) {
                    $data = Auth::guard('user')->user();
            if ($request['email'] == 'admin@admin.com') {
                $response['status'] = 'success';
                $response['isAdmin'] = 'true';
                $response['message'] = 'Admin login Successfully';
                $response['data'] =$data ;
                $response['token'] = $data->createToken('Api token')->accessToken;

                return $response;

            } else {
                return response()->json(['error' => 'Unauthorised'], 401);


            }
        }
        else{
            $response['status'] = 'Failed';
            $response['message'] = 'Admin login Failed';

            return $response;
        }

    }
}
