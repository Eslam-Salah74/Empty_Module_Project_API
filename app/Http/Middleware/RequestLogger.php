<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Log;

class RequestLogger
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $startTime = microtime(true);

        // Log the request path
        Log::info('Request Path: ' . $request->path());

        Log::info('Middleware: ' . get_class($this));

        // Log the executed controller and method
        Log::info('Controller: ' . app('router')->getCurrentRoute()->getActionName());

        // Log the accessed files, if any
        Log::info('Files Accessed: ' . json_encode($request->allFiles()));

        // Pass the request to the next middleware / route handler
        $response = $next($request);

        // Record the end time of the request
        $endTime = microtime(true);

        // Calculate the elapsed time
        $elapsedTime = round(($endTime - $startTime) * 1000, 2); // Convert to milliseconds

        // Log the elapsed time
        Log::info('Request Time: ' . $elapsedTime . ' ms');

        return $response;
    }
}
