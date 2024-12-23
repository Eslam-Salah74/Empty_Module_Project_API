<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

use Modules\MasterData\App\Http\Requests\Permission\StoreRequest;
use Modules\MasterData\App\Http\Requests\Permission\UpdateRequest;
use Modules\MasterData\App\Models\Permission;
use Modules\MasterData\App\Repositories\PermissionInterface;

class PermissionController extends Controller
{
    protected $permission;

    public function __construct(PermissionInterface $permission)
    {
        $this->permission = $permission;
        // $this->middleware('check.expiration_date', ['except' => ['index','show']]);
        // $this->middleware('permission:read-permission', ['only' => ['index']]);
    }

    public function index(Request $request)
    {
        return $this->permission->index($request);
    }


}
