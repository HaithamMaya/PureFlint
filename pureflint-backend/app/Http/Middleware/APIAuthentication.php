<?php

namespace App\Http\Middleware;

use App\User;
use Closure;

class APIAuthentication
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // A token wasn't included.
        if(!$request->token) {
            return Response::json([
                "status" => "NOT_OK",
                "response" => "A token is required to access this route."
            ], 200);
        }

        $user = User::where('token', $request->token)->first();

        // A user wasn't found.
        if(!$user) {
            return Response::json([
                "status" => "NOT_OK",
                "response" => "This user was not found."
            ], 200);
        }

        return $next($request);
    }
}
