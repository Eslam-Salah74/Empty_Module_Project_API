<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        if(\App\Models\User::where("email","tsmv_admin@mv-is.com")->count()==0)
        {
            $role = \Modules\MasterData\App\Models\Role::create(['name'=>['en'=>'Super Admin','ar'=>'سوبر ادمن'],'guard_name'=>'sanctum']);
            $branch = \Modules\MasterData\App\Models\Branch::create(['name'=>['en'=>'Main branch','ar'=>'المركز الرئيسي'],'email'=>'tsmv_admin@mv-is.com','mobile'=>'01111111111','branch_code'=>'01']);
            $dept = \Modules\MasterData\App\Models\Department::create(['name'=>['en'=>'Admin','ar'=>'ادمن']]);
            $emp=['name'=>'Super Admin', 'email'=>'tsmv_admin@mv-is.com','password'=>'123456789'];
            $user = \App\Models\User::create($emp);
            $employee['department_id']=$dept->id;
            $employee['branch_id']=$branch->id;
            $user->employee()->create($employee);
            $role->givePermissionTo(\Modules\MasterData\App\Models\Permission::pluck('name')->toArray());
            $user->assignRole($role->id);
        }

        // \App\Models\User::factory(1)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

       
    }
}
