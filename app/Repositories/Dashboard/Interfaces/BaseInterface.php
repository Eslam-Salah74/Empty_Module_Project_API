<?php

namespace App\Repositories\Dashboard\Interfaces;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

interface  BaseInterface
{
    public function index($request,$filter=null);

    public function store($request);
    public function show($data);

    public function update($data , $request);

    public function destroy($data);
}
