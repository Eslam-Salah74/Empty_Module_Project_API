<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Traits\API;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Modules\MasterData\App\Http\Requests\LoginRequest;
use Modules\MasterData\App\resources\UsersResource;

class AuthController extends Controller
{
    /**
     * Login Admin
     */
    public function login(LoginRequest $request)
    {
        // return $request->all();
        if (Auth::attempt(['email' => $request['email'], 'password' => $request['password'], 'status' => 1, 'deleted_at' => null])) {
            $user = Auth::user();
            $token = $user->createToken('travelSanctumAuth')->plainTextToken;
            data_set($user, 'token', $token);
            return (new API)
                ->isOk(__('Successful Login'))
                ->setData((new UsersResource($user)))
                ->build();
        }
        return (new API)
            ->isError(__('Invalid login credentials'))
            ->setStatus(450)
            ->build();
    }

}
