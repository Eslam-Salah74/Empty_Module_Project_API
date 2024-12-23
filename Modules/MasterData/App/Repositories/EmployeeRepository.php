<?php

namespace Modules\MasterData\App\Repositories;

use App\Traits\API;
use App\Http\Responses\ApiResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use App\Repositories\Dashboard\BaseRepository;
use Modules\MasterData\App\Models\Employee;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Modules\MasterData\App\Models\Role;
use Modules\MasterData\App\Http\Requests\EmployeeStoreRequest;
use Modules\MasterData\App\resources\EmployeesResource;
use Modules\MasterData\App\Repositories\EmployeeInterface;
use App\Models\User;
use Illuminate\Support\Facades\Schema;
class EmployeeRepository extends BaseRepository implements EmployeeInterface
{
    public function getModel()
    {
        return new Employee();
    }



    public function index($request,$filter): \Illuminate\Http\JsonResponse
    {
        $perPage = $request['per_page'] ?? config('myConfig.paginationCount');
        $collection = $this->getModel()->ordering($request->ordering)->filter($filter);
        // $data = $perPage == -1 ? $collection->get() : $collection->paginate($perPage);
        //if an auth user is an employee
        if(Auth::user()->employee)
        {
            //when an auth employee has branches_accessibility
            if(empty(Auth::user()->employee->branches_accessibility))
            {
                $collection = $collection->where('branch_id',Auth::user()->employee->branch_id);
            }
        }
        $data = $perPage == -1 ? $collection->get() : $collection->paginate($perPage);
        return (new API)
            ->isOk(__('Employees'))
            ->setData($perPage == -1 ? EmployeesResource::collection($data) : (new API)->api_model_set_paginate(EmployeesResource::collection($data) ,$data))
            ->build();

    }

    public function store($request)
    {
        //  try {
            $userData = $request->validated(); // Assuming you have validation rules in your form request
            if(!$request->has('password')){
                $request['password']="12345678";
            }
            // Create or update the user record excluding 'type' field
            $user = User::create(
                $request->except(['department_id', 'branch_id', 'branches_accessibility'])
            );
           
            $emp = [
                'department_id' => $userData['department_id'],
                'branch_id' => $userData['branch_id'],
                'branches_accessibility' => $userData['branches_accessibility']
            ];
           
            $user->employee()->create($emp);


            if($request->role_id){
                $user->roles()->attach($request->role_id);
            }
            




        return (new API)
            ->isCreated(__('Stored Successfully'))
            ->build();
    // }
    //     catch (\Exception $e) {
    //       return (new API)
    //             ->isError('An Error occured')
    //             ->setStatus(500)
    //              ->build();
    //            }
    }

    public function show($employee)
    {

        return (new API)
            ->isOk(__('Employee Data'))
            ->setData(EmployeesResource::make($employee))
            ->build();

    }

    public function update($employee ,$request)
    {
       try
        {

            $userData = $request->validated(); // Assuming you have validation rules in your form request
            // Create or update the user record excluding 'type' field
            $employee->user->update(
                $request->except('department_id')
            );

            $emp=[
                'department_id' => $userData['department_id'],
                'branch_id' => $userData['branch_id'],
                'branches_accessibility'=>$userData['branches_accessibility']
            ];
           
            if($request->role_id){
                $employee->user->roles()->sync($request->role_id);
            }
            
            return (new API)
                ->isCreated(__('Updated Successfully'))
                ->build();
        }
        catch (\Exception $e) {
            return (new API)
                ->isError('An Error occured')
                ->setStatus(500)
                ->build();
        }
    }

    public function destroy($employee)
    {
        $employee->user->delete();
        $employee->delete();
        return (new API)
            ->isOk(__('Destroyed Successfully'))
            ->build();

    }

}
