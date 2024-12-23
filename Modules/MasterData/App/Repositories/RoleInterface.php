<?php

namespace Modules\MasterData\App\Repositories;

interface RoleInterface
{

    public function index($request);

    public function store($request);
    public function show($role);

    public function update($role , $request);

    public function destroy($role);

}
