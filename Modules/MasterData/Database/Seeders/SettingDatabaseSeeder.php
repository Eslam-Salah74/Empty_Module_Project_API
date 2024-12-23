<?php

namespace Modules\MasterData\Database\Seeders;

use Modules\MasterData\App\Models\Setting;

use Illuminate\Database\Seeder;
use Modules\MasterData\App\Models\Permission;

class SettingDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        
        $settings = [
            'app_name'     => 'text',
            'app_logo'     => 'file',

        ];
        $index=1;
        foreach ($settings as $key => $setting) {
            if(Setting::where("key",$key)->count()==0)
            Setting::create([
                'key' => $key,
                'type' => $setting,
                'title'=>'general_setting',
                'index'=>$index
            ]);
            $index++;
        }

        $actions = ['read', 'show', 'update'];
        $models = [
            'setting',

        ];
        foreach ($models as $model) {
            foreach ($actions as $action) {
                $permissionName = $action . '-' . strtolower($model); // Example: create-post
                $existingPermission = Permission::where('name',$permissionName)
                    ->where('guard_name', 'sanctum')
                    ->exists();
                if (!$existingPermission) {
                    Permission::create([
                        'name' => $permissionName,
                        'guard_name'=>'sanctum',
                    ]);
                }
            }
        }
    }
}
