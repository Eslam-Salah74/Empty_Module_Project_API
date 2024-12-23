<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\JsonResponse;

class CheckEmployee
{
    public function handle($request, Closure $next)
    {
        if (Auth::check() ) {
			if(Auth::user()->employee){
				return $next($request);
			}else{
				return new JsonResponse([
					'error' => 'Unauthorized',
					'message' => 'You are not authorized to access this resource , should be an employee.'
				], 403);
			}
            
        }

        return $next($request);
        // return redirect()->json()->with('error', 'You are not authorized to access this resource.');
    }
}