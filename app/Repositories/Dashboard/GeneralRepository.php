<?php

namespace App\Repositories\Dashboard;
use App\Http\Responses\ApiResponse;
use App\Repositories\Dashboard\Interfaces\BaseInterface;
use App\Traits\API;
use Illuminate\Database\Eloquent\Model;

class GeneralRepository implements BaseInterface
{

    protected $model;
    public function __construct(Model $model)
    {
        $this->model =$model;
    }

    
    public function index($request, $filter=null)
    {
        $perPage = $request['per_page'] ?? config('myConfig.paginationCount');
        $collection = $this->model->ordering($request->ordering);
        if ($filter) {
            $collection = $collection->filter($filter);
        }
        $data = $perPage == -1 ? $collection->get() : $collection->paginate($perPage);
        return $data;
    }



    public function store($request)
    {
        try {
            $this->model->create($request->validated());
            return (new API)
            ->isCreated(__('Stored Successfully'))
            ->build();
        } catch (\Exception $e) {
            dd($e);
            return (new API)
                ->isError('An Error occured')
                ->setStatus(500)
                ->build();
        }
    }

    public function show($data)
    {
        $record = $this->model->find($data);

        if (!$record) {
            return (new API)
                ->isError('Record not found')
                ->setStatus(404)
                ->build();
        }

        return (new API)
            ->setData($record)
            ->setMessage('Record retrieved successfully')
            ->setStatus(200) // Ensure a 200 status code is set
            ->build();
    }



    public function update($data, $request)
    {
        try {
            $data->update($request->validated());
           return (new API)
           ->isCreated(__('Stored Successfully'))
           ->build();

        } catch (\Exception $e) {
            return (new API)
                ->isError('An Error occured')
                ->setStatus(500)
                ->build();
        }
    }



    public function destroy($data)
    {
        return $data->delete();
    }

}
