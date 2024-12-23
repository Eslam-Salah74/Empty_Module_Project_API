<?php
namespace App\Traits;
use \Modules\MasterData\App\Models\Setting;
trait SettingTrait
{

    public function checkDropdownSetting($table,$id)
    {
        return Setting::where('type','dropdown')->where('options','@'.$table)->where('value',$id)->count();
    }

}
