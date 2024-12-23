<?php

namespace Modules\MasterData\App\Repositories;

use App\Http\Responses\ApiResponse;
use App\Traits\API;
use App\Models\User;
use Illuminate\Support\Facades\File;
use Modules\MasterData\App\Http\Requests\StoreRequest;
use Modules\MasterData\App\Models\Permission;
use App\Repositories\Dashboard\BaseRepository;
use Modules\MasterData\App\Repositories\PermissionInterface;
use Modules\MasterData\App\resources\PermissionsResource;
use Spatie\MediaLibrary\MediaCollections\Models\Media;


class PermissionRepository extends BaseRepository implements PermissionInterface
{

    public function getModel()
    {
        return new Permission();
    }



    public function index($request): \Illuminate\Http\JsonResponse
    {
 $perPage = $request['per_page'] ?? config('myConfig.paginationCount');
        $data = $perPage == -1 ? $this->getModel()->search($request['search'])->orderBy('name', 'asc')->get() : $this->getModel()->search($request['search'])->orderBy('created_at', 'desc')->paginate($perPage);
        if($perPage==-1)
        {
            $new_data=[];
            foreach($data as $one)
            {
                $item=explode('-',$one->name);
                $action=array_shift($item);
                $model=implode('-', $item);
                $new_data[$model][$action] = new PermissionsResource($one);
            }
        }
        return (new API)
            ->isOk(__('Permissions'))
            ->setData($perPage == -1 ? $new_data : (new API)->api_model_set_paginate(PermissionsResource::collection($data) ,$data))
            ->build();

    }


}
