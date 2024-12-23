<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\MasterData\App\Http\Requests\Role\StoreRequest;
use Modules\MasterData\App\Http\Requests\Role\UpdateRequest;
use Modules\MasterData\App\Models\Role;
use Modules\MasterData\App\Repositories\RoleInterface;

class RoleController extends Controller
{
    protected $role;

    public function __construct(RoleInterface $role)
    {
        $this->role = $role;
        // $this->middleware('check.expiration_date', ['except' => ['index','show']]);
        // $this->middleware('permission:read-role', ['only' => ['index']]);
        // $this->middleware('permission:show-role', ['only' => ['show']]);
        // $this->middleware('permission:create-role', ['only' => ['store']]);
        // $this->middleware('permission:update-role', ['only' => ['update']]);
        // $this->middleware('permission:delete-role', ['only' => ['destroy']]);
    }

    public function index(Request $request)
    {
        return $this->role->index($request);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRequest $request)
    {
        return $this->role->store($request);
    }

    /**
     * Show the specified resource.
     */
    public function show(Role $role)
    {
        return $this->role->show($role);
    }



    /**
     * Update the specified resource in storage.
     */
    public function update(Role $role , UpdateRequest $request)
    {
        return $this->role->update($role , $request);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Role $role)
    {
        return $this->role->destroy($role);
    }
}
