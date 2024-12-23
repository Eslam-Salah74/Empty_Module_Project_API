<?php

namespace Modules\MasterData\App\Repositories;

use App\Traits\API;
use App\Models\User;
use App\Http\Responses\ApiResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use App\Repositories\Dashboard\BaseRepository;
use Modules\MasterData\App\Models\Branch;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Modules\MasterData\App\Http\Requests\BranchStoreRequest;
use Modules\MasterData\App\resources\BranchesResource;
use Modules\MasterData\App\Repositories\BranchInterface;

class BranchRepository extends BaseRepository implements BranchInterface
{
    public function getModel()
    {
        return new Branch();
    }



    public function index($request,$filter): \Illuminate\Http\JsonResponse
    {
        $perPage = $request['per_page'] ?? config('myConfig.paginationCount');
        $collection = $this->getModel()->filter($filter)->orderBy('created_at', 'desc');
        // $data = $perPage == -1 ? $collection->get() : $collection->paginate($perPage);
        //if an auth user is an employee
        if(Auth::user()->employee)
        {
            //when an auth employee has branches_accessibility
            if(empty(Auth::user()->employee->branches_accessibility))
            {
                $collection = $collection->where('id',Auth::user()->employee->branch_id);
            }
        }
        $data = $perPage == -1 ? $collection->get() : $collection->paginate($perPage);
        return (new API)
            ->isOk(__('Branches'))
            ->setData($perPage == -1 ? BranchesResource::collection($data) : (new API)->api_model_set_paginate(BranchesResource::collection($data) ,$data))
            ->build();

    }

    public function store($request)
    {
        try {


        switch($request->user_type){
            case'our_branch':
                break;
            // case'client':
            //     $item = Client::find($request->item_id);
            //     break;
            // case'supplier':
            //     $item = Supplier::find($request->item_id);
            //     break;
        }

        if($request->user_type == 'our_branch')
        {
            $branch = $this->getModel()->create($request->validated());
        }
        // else{
        //     $branch = $item->branchable()->create($request->validated());
        // }


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

    public function show($branch)
    {

        return (new API)
            ->isOk(__('Branch Data'))
            ->setData(BranchesResource::make($branch))
            ->build();

    }

    public function update($branch ,$request)
    {
        try {
            switch($request->user_type){
                case'our_branch':
                    break;
                // case'client':
                //     $item = Client::find($request->item_id);
                //     break;
                // case'supplier':
                //     $item = Supplier::find($request->item_id);
                //     break;
            }

            if($request->user_type == 'our_branch')
            {
                $branch->update($request->validated());
            }
            // else{
            //     $branch = $item->branchable()->update($request->validated());
            // }

            //save new image with branch object and delete old image

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

    public function destroy($branch)
    {
        $branch->delete();
        return (new API)
            ->isOk(__('Destroyed Successfully'))
            ->build();

    }

}
