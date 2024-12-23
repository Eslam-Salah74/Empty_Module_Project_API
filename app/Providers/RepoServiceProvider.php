<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class RepoServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        /*** Start Dashboard ***/

        //Country
        $this->app->bind(
            'App\Repositories\Dashboard\Country\CountryInterface',
            'App\Repositories\Dashboard\Country\CountryRepository',
        );

        //City
        $this->app->bind(
            'App\Repositories\Dashboard\City\CityInterface',
            'App\Repositories\Dashboard\City\CityRepository',
        );

        //Area
        $this->app->bind(
            'App\Repositories\Dashboard\Area\AreaInterface',
            'App\Repositories\Dashboard\Area\AreaRepository',
        );
        //general repository
        $this->app->bind(
            'App\Repositories\Dashboard\Interfaces\BaseInterface',
            'App\Repositories\Dashboard\GeneralRepository',
        );


    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
