<?php

namespace App\Repositories\Dashboard;
use App\Http\Responses\ApiResponse;

abstract class BaseRepository
{
    protected $model;

    public function __construct()
    {
        $this->model = $this->getModel();
    }

    abstract public function getModel();




//    public function store($request)
//    {
//        try {
//            $validated = $request->validated();
//            $inputs    = $request->all();
//            $data      = $this->model::create($inputs);
//            if (!$data) {
//                return ApiResponse::error('An error occurred', 500);
//            }
//            return ApiResponse::success($responseData, 'Added successfully');
//        } catch (\Exception $e) {
//            return ApiResponse::error('An error occurred', 500);
//        }
//    }
//
//
//
//    public function update($request)
//    {
//        try {
//            $validated = $request->validated();
//            $inputs    = $request->all();
//            $data      = $this->model::findOrFail($request->id);
//            if (!$data) {
//                return ApiResponse::error('An error occurred', 500);
//
//            }
//            $data->update($inputs);
//            if (!$data) {
//                return ApiResponse::error('An error occurred', 500);
//            }
//
//            return ApiResponse::success($responseData, 'Added successfully');
//        } catch (\Exception $e) {
//            return ApiResponse::error('An error occurred', 500);
//        }
//    }
//
//
//
//    public function destroy($request)
//    {
//        try {
//            $data = $this->model::findOrFail($request->id);
//            if (!$data) {
//                session()->flash('error');
//                return redirect()->back();
//            }
//            $data->delete();
//            session()->flash('success');
//            return redirect()->back();
//        } catch (\Exception $e) {
//            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
//        }
//    }
}
