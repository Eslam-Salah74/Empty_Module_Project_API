<?php

namespace Modules\MasterData\App\Repositories;

use App\Traits\API;
use App\Http\Responses\ApiResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Modules\MasterData\App\Models\User;
use App\Repositories\Dashboard\BaseRepository;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Modules\MasterData\App\resources\UsersResource;
use Modules\MasterData\App\Models\Role;
use Modules\MasterData\App\Http\Requests\UserStoreRequest;
use Modules\MasterData\App\Repositories\UserInterface;

class UserRepository extends BaseRepository implements UserInterface
{
    public function getModel()
    {
        return new User();
    }



    public function index($request , $filter): \Illuminate\Http\JsonResponse
    {
        $perPage = $request['per_page'] ?? config('myConfig.paginationCount');
        $collection = $this->getModel()->ordering($request->ordering)->filter($filter);
        $data = $perPage == -1 ? $collection->get() : $collection->paginate($perPage);
        // if an auth user is an employee
        if(Auth::user()->employee)
        {
            //when an auth employee has branches_accessibility
            if(empty(Auth::user()->employee->branches_accessibility))
            {
                $collection = $collection->whereRelation('employee','branch_id',Auth::user()->employee->branch_id);
            }
        }
        $data = $perPage == -1 ? $collection->get() : $collection->paginate($perPage);
        return (new API)
            ->isOk(__('Users'))
            ->setData($perPage == -1 ? UsersResource::collection($data) : (new API)->api_model_set_paginate(UsersResource::collection($data) ,$data))
            ->build();

    }

    public function store($request)
    {
        try {

        $user = $this->getModel()->create($request->validated());

        if($request->role_id){
            $user->roles()->attach($request->role_id);
        }


        return (new API)
            ->isOk(__('Stored Successfully'))
            ->build();
    }
        catch (\Exception $e) {
          return (new API)
                ->isError('An Error occured')
                ->setStatus(500)
                 ->build();
               }
    }

    public function show($user)
    {

        return (new API)
            ->isOk(__('User Data'))
            ->setData(UsersResource::make($user))
            ->build();

    }

    public function update($user ,$request)
    {
        try {

             $user->update($request->validated());

             if($request->role_id){
                $user->roles()->sync($request->role_id);
            }

            return (new API)
                ->isOk(__('Updated Successfully'))
                ->build();
        }
        catch (\Exception $e) {
            return (new API)
                ->isError('An Error occured')
                ->setStatus(500)
                ->build();
        }
    }

    public function destroy($user)
    {
        $user->delete();
        return (new API)
            ->isOk(__('Destroyed Successfully'))
            ->build();

    }

}
