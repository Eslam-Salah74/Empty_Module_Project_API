<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\MasterData\App\Http\Requests\BranchStoreRequest;
use Modules\MasterData\App\Http\Requests\BranchUpdateRequest;
use Modules\MasterData\App\Models\Branch;
use Modules\MasterData\App\Repositories\BranchInterface;
use Modules\MasterData\App\Filters\BranchFilter;
class BranchController extends Controller
{
    protected $branch;


    public function __construct(BranchInterface $branch)
    {
        $this->branch = $branch;
      //   $this->middleware('check.expiration_date', ['except' => ['index','show']]);
      //   $this->middleware('permission:read-branch', ['only' => ['index']]);
      //   $this->middleware('permission:show-branch', ['only' => ['show']]);
      //   $this->middleware('permission:create-branch', ['only' => ['store']]);
      //   $this->middleware('permission:update-branch', ['only' => ['update']]);
      //   $this->middleware('permission:delete-branch', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     */

     public function index(Request $request,BranchFilter $filter)
     {
        return $this->branch->index($request,$filter);
     }

     /**
      * Show the form for creating a new resource.
      */

     public function store(BranchStoreRequest $request)
     {
        return $this->branch->store($request);
     }

     /**
      * Show the specified resource.
      */
     public function show(Branch $branch)
     {
        return $this->branch->show($branch);
     }

     /**
      * Show the form for editing the specified resource.
      */
     public function update(Branch $branch , BranchUpdateRequest $request)
     {
        return $this->branch->update($branch , $request);
     }

     /**
      * Remove the specified resource from storage.
      */
     public function destroy(Branch $branch)
     {
        return $this->branch->destroy($branch);
     }
}
