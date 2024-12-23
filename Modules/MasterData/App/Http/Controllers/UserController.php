<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\MasterData\App\Http\Requests\UserStoreRequest;
use Modules\MasterData\App\Http\Requests\UserUpdateRequest;
use Modules\MasterData\App\Models\User;
use Modules\MasterData\App\Repositories\UserInterface;
use Modules\MasterData\App\Filters\UserFilter;
class UserController extends Controller
{
    protected $user;

    public function __construct(UserInterface $user)
    {
        $this->user = $user;
        // $this->middleware('check.expiration_date', ['except' => ['index','show']]);
        // $this->middleware('permission:read-user', ['only' => ['index']]);
        // $this->middleware('permission:show-user', ['only' => ['show']]);
        // $this->middleware('permission:create-user', ['only' => ['store']]);
        // $this->middleware('permission:update-user', ['only' => ['update']]);
        // $this->middleware('permission:delete-user', ['only' => ['destroy']]);
    }

    public function index(Request $request, UserFilter $filter)
    {
        return $this->user->index($request, $filter);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(UserStoreRequest $request)
    {
        return $this->user->store($request);
    }

    /**
     * Show the specified resource.
     */
    public function show(User $user)
    {
        return $this->user->show($user);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(User $user , UserUpdateRequest $request)
    {
        return $this->user->update($user , $request);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        return $this->user->destroy($user);
    }
}
