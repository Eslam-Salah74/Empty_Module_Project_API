<?php

namespace  Modules\MasterData\App\Filters;
use App\Filters\Filters;


class EmployeeFilter extends Filters
{
    protected $var_filters=[
        'search','department_id','type','branch_id','branches_accessibility','status'
    ];


    public function department_id($department_id)
    {
        if($department_id!='null'&&$department_id!=null){
            return $this->builder->where('department_id',$department_id);
        }

    }
    public function status($status)
    {
        if($status!='null' && $status!=null){
            return $this->builder->where('status',$status);
        }

    }
    public function type($type)
    {
        if($type!='null'&&$type!=null){
            return $this->builder->where('type',$type);
        }
    }


    public function branches_accessibility($branches_accessibility)
    {
        if($branches_accessibility!='null' && $branches_accessibility!=null){
            return $this->builder->where('branches_accessibility',$branches_accessibility);
        }

    }

    public function branch_id($branch_id)
    {
        if($branch_id!='null'&&$branch_id!=null){
            return $this->builder->where('branch_id',$branch_id);
        }
    }


    // public function search($search)
    // {
    //     return $this->builder->whereHas('user', function ($query) use ($search) {
    //         $query->where('name', 'LIKE', '%' . $search . '%');
    //     });
    // }
   
   
    public function search($search)
    {
        return $this->builder->where(function ($query) use ($search) {
            $query->WhereHas('department',function($q) use($search){
                foreach (config('myConfig.langs') as $i=>$locale) {
                    if($i==0)
                        $q->where('name->' . $locale, 'LIKE', '%' . $search . '%');
                    else
                        $q->orWhere('name->' . $locale, 'LIKE', '%' . $search . '%');
                }
            })->orWhereHas('user',function($q) use($search){
                    $q->where('name', 'LIKE', '%' . $search . '%');
            })->orWhereHas('user',function($q) use($search){
                $q->where('email', 'LIKE', '%' . $search . '%');
        })->WhereHas('branch',function($q) use($search){
            foreach (config('myConfig.langs') as $i=>$locale) {
                if($i==0)
                    $q->where('name->' . $locale, 'LIKE', '%' . $search . '%');
                else
                    $q->orWhere('name->' . $locale, 'LIKE', '%' . $search . '%');
            }
        })
            ;
        });
    }
   
   
   
   
   
   
   
   

}
