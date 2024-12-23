<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\MasterData\App\Filters\EmployeeFilter;
use Modules\MasterData\App\Http\Requests\EmployeeStoreRequest;
use Modules\MasterData\App\Models\Employee;
use Modules\MasterData\App\Http\Requests\EmployeeUpdateRequest;
use Modules\MasterData\App\Repositories\EmployeeInterface;

class EmployeesController extends Controller
{
    protected $employee;

    public function __construct(EmployeeInterface $employee)
    {
        $this->employee = $employee;
        // $this->middleware('check.expiration_date', ['except' => ['index','show']]);
        // $this->middleware('permission:read-employee', ['only' => ['index']]);
        // $this->middleware('permission:show-employee', ['only' => ['show']]);
        // $this->middleware('permission:create-employee', ['only' => ['store']]);
        // $this->middleware('permission:update-employee', ['only' => ['update']]);
        // $this->middleware('permission:delete-employee', ['only' => ['destroy']]);
    }

    public function index(Request $request, EmployeeFilter $filter)
    {
        return $this->employee->index($request,$filter);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(EmployeeStoreRequest $request)
    {
  // Assuming you have validation rules in your form request
        return $this->employee->store($request);
    }

    /**
     * Show the specified resource.
     */
    public function show(Employee $employee)
    {
        return $this->employee->show($employee);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Employee $employee , EmployeeUpdateRequest $request)
    {
        return $this->employee->update($employee , $request);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Employee $employee)
    {
        return $this->employee->destroy($employee);
    }
}
