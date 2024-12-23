<?php

namespace Modules\MasterData\App\Repositories;

use App\Traits\API;
use App\Http\Responses\ApiResponse;
use Illuminate\Support\Facades\File;
use App\Repositories\Dashboard\BaseRepository;
use Modules\MasterData\App\Models\Setting;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Modules\MasterData\App\resources\SettingResource;
use Modules\MasterData\App\Repositories\SettingInterface;

class SettingRepository extends BaseRepository implements SettingInterface
{
    public function getModel()
    {
        return new Setting();
    }



    public function index($request): \Illuminate\Http\JsonResponse
    {
        $perPage = $request['per_page'] ?? config('myConfig.paginationCount');
        $collection = $this->getModel()->distinct('title');
        $data = $perPage == -1 ? $collection->select(['title'])->get() : $collection->select(['title'])->paginate($perPage);
        // $grouped_setting_data = $this->getModel()->distinct()->get(['title']);
        $grouped_setting_data = $data->map(function ($item) {
            // Fetch additional data based on the title
            $setting_data_by_title = $this->getModel()->where('title', $item->title)->where('key','!=','exp_date')->get();

            // Append the additional data to the item
            $item->data = SettingResource::collection($setting_data_by_title);
            $item->title = $item->custom_title;

            return $item;
        });


        // return response()->json($grouped_setting_data);
        return (new API)
            ->isOk(__('Setting'))
            ->setData($perPage == -1 ? $data : (new API)->api_model_set_paginate($data ,$data))
            ->build();

    }

    public function store($request)
    {
        try {

            $setting = $this->getModel()->create($request->validated());
            // get the currencies of '1' and update base of currency
            
            //save image with setting object
            if ($request->hasFile('image')) {
                $setting->addMediaFromRequest('image')->toMediaCollection('setting');
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

    public function show($setting)
    {

        return (new API)
            ->isOk(__('Setting Data'))
            ->setData(SettingResource::make($setting))
            ->build();

    }

    public function update($setting ,$request)
    {
        try {
            $save_data=$request->validated();
            // get the currencies of '1' and update base of currency
            
             if($setting->type == 'file'){
                /*$file = $request->file('value');
                $filename = $file->getClientOriginalName();
                $path = '/uploads/settings/';
                $file->move($path, $filename);
                $setting->update(['value'=>$path.$filename]);*/

                //save new image with setting object and delete old image
                if ($request->hasFile('value')) {
                    if($setting->getMedia('setting')->last())
                    {
                        $file_name = $setting->getMedia('setting')->last()->file_name;
                        $img_id = $setting->getMedia('setting')->last()->id;
                        if($img_id && $file_name){
                            if (File::exists(public_path('storage/'. $img_id .'/'.$file_name))) {
                                unlink(public_path('storage/' . $img_id .'/'.$file_name));
                            }
                        }
                        Media::find($setting->getMedia('setting')->last()->id)->delete();
                    }
                    $setting->addMediaFromRequest('value')->toMediaCollection('setting');
                    //$setting->update($save_data);
                }
            }
            else
                $setting->update($save_data);


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

    public function destroy($setting)
    {
        $setting->delete();
        return (new API)
            ->isOk(__('Destroyed Successfully'))
            ->build();

    }

    public function all_available_options()
    {
        $tables=Setting::where('type','dropdown')->where('options','like','@%')->distinct('options')->pluck('options')->toArray();
        $return=[];
       
        return (new API)
            ->isOk(__('Setting options'))
            ->setData($return)
            ->build();
    }

}
