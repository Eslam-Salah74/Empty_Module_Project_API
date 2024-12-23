<?php

namespace App\Http\Middleware;

use Closure;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Modules\MasterData\App\Models\Setting;
use App\Traits\API;

class CheckExpirationData
{
    public function handle($request, Closure $next)
    {
        $exp_date = Setting::where('key','exp_date')->first();
        if (!empty($exp_date) && !empty($exp_date->value))
        {
            // Assuming $expirationDateFromDatabase contains the date value from the database
            $expirationDateFromDatabase = $exp_date->value;
            $databaseDate               = Carbon::createFromFormat('d-m-Y', $expirationDateFromDatabase)->startOfDay();
            $today                      = Carbon::today();
            if ($databaseDate->gt($today))
            {
                // The date from the database is greater than today's date
                return $next($request);
            }
            else
            {
                // The date from the database is less than today's date
                return (new API)
                    ->isError(__('Your Date Has Expired'))
                    ->setStatus(500)
                    ->build();
            }
        }

        return $next($request);
    }
}
