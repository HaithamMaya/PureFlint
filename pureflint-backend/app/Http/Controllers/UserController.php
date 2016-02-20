<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Validator;
use App\User;
use Response;

class UserController extends Controller
{
    public function exists(Request $request) {

    }

    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            "name" => "required",
            "email" => "required|unique:users,email|email",
            "password" => "required|min:8|max:16",
            "role_id" => "required|integer",
        ]);

        if($validator->fails()) {
            return Response::json([
                "status" => "NOT_OK",
                "response" => "Required fields: name, email, password, role_id."
            ], 400);
        }

        $user = User::create([
            "name" => $request->name,
            "email" => $request->email,
            "password" => md5($request->password),
            "role_id" => $request->role_id
        ]);
        $user->token = md5(md5($request->password) . time());
        $user->save();

        return Response::json([
            "status" => "OK",
            "response" => "User registered successfully!",
            "user" => $user,
            "token" => $user->token
        ], 200);

    }
}