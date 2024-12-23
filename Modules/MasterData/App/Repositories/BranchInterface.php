<?php

namespace Modules\MasterData\App\Repositories;

interface BranchInterface
{

    public function index($request,$filter);

    public function store($request);
    public function show($branch);

    public function update($branch , $request);

    public function destroy($branch);

}
