<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\MasterData\App\Http\Requests\DepartmentStoreRequest;
use Modules\MasterData\App\Http\Requests\DepartmentUpdateRequest;
use Modules\MasterData\App\Models\Department;
use Modules\MasterData\App\Repositories\DepartmentInterface;

class DepartmentController extends Controller
{
    protected $department;

    public function __construct(DepartmentInterface $department)
    {
        $this->department = $department;
        // $this->middleware('check.expiration_date', ['except' => ['index','show']]);
        // $this->middleware('permission:read-department', ['only' => ['index']]);
        // $this->middleware('permission:show-department', ['only' => ['show']]);
        // $this->middleware('permission:create-department', ['only' => ['store']]);
        // $this->middleware('permission:update-department', ['only' => ['update']]);
        // $this->middleware('permission:delete-department', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     */

    public function index(Request $request)
    {
        return $this->department->index($request);
    }

    /**
     * Show the form for creating a new resource.
     */

    public function store(DepartmentStoreRequest $request)
    {
        return $this->department->store($request);
    }

    /**
     * Show the specified resource.
     */
    public function show(Department $department)
    {
        return $this->department->show($department);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function update(Department $department , DepartmentUpdateRequest $request)
    {
        return $this->department->update($department , $request);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Department $department)
    {
        return $this->department->destroy($department);
    }
}
