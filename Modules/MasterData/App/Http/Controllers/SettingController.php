<?php

namespace Modules\MasterData\App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\MasterData\App\Http\Requests\SettingStoreRequest;
use Modules\MasterData\App\Http\Requests\SettingUpdateRequest;
use Modules\MasterData\App\Models\Setting;
use Modules\MasterData\App\Repositories\SettingInterface;
class SettingController extends Controller
{
    protected $setting;

    public function __construct(SettingInterface $setting)
    {
        $this->setting = $setting;
        // $this->middleware('check.expiration_date', ['except' => ['index','show','all_available_options']]);
        // $this->middleware('permission:read-setting', ['only' => ['index','all_available_options']]);
        // $this->middleware('permission:show-setting', ['only' => ['show']]);
        // $this->middleware('permission:create-setting', ['only' => ['store']]);
        // $this->middleware('permission:update-setting', ['only' => ['update']]);
        // $this->middleware('permission:delete-setting', ['only' => ['destroy']]);
    }

    public function index(Request $request)
    {
        return $this->setting->index($request);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(SettingStoreRequest $request)
    {
        return $this->setting->store($request);
    }

    /**
     * Show the specified resource.
     */
    public function show(Setting $setting)
    {
        return $this->setting->show($setting);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Setting $setting , SettingUpdateRequest $request)
    {
        return $this->setting->update($setting , $request);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Setting $setting)
    {
        return $this->setting->destroy($setting);
    }

    public function all_available_options()
    {
        return $this->setting->all_available_options();
    }

}
