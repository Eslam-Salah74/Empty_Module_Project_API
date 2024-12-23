<?php

namespace  Modules\MasterData\App\Filters;
use App\Filters\Filters;


class UserFilter extends Filters
{
    protected $var_filters=[
        'search','status'
    ];


   
    public function status($status)
    {
        if($status!='null' && $status!=null){
            return $this->builder->where('status',$status);
        }

    }

    // public function search($search)
    // {
    //     return $this->builder->where('name', 'LIKE', '%' . $search . '%');

    // }
    // public function search_mail($search)
    // {
    //     return $this->builder->where('email', 'LIKE', '%' . $search . '%');

    // }

    public function search($search)
    {
        return $this->builder->where(function ($query) use ($search) {
            $query->where('name','LIKE','%'.$search.'%')
            ->orWhere('email','LIKE','%'.$search.'%');
        });
    }
   
}
