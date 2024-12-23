<?php

namespace Modules\MasterData\App\Repositories;

interface EmployeeInterface
{

    public function index($request,$filter);

    public function store($request);
    public function show($employee);

    public function update($employee , $request);

    public function destroy($employee);

}
