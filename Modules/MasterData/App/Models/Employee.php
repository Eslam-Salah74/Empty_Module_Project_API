<?php

namespace Modules\MasterData\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;
use Laravel\Scout\Searchable;
use App\Models\User;
use Spatie\Permission\Traits\HasRoles;
use Modules\MasterData\App\Models\Department;
use Modules\MasterData\App\Models\Branch;
use Modules\MasterData\App\Filters\EmployeeFilter;

class Employee extends User
{
    use HasFactory,SoftDeletes, Searchable ,HasRoles;

    /**
     * The attributes that are mass assignable.
     */

     use Searchable {
        Searchable::search as parentSearch;
  }


    //   protected $fillable = ['branch_id','department_id','branches_accessibility','user_id'];
    // protected $guarded = [];

    protected $fillable = [];
    protected $guarded = ['id'];
    
    public function scopeFilter($query,EmployeeFilter $filter)
    {
        return $filter->apply($query);
    }

    public function scopeStatus($query)
    {
        $query->where('status' , 1);
    }

    public function toSearchableArray(): array
    {
        return [
            'name' => $this->name,
        ];
    }


    public static function search($query = '', $callback = null)
    {
        return static::parentSearch($query, $callback)->query(function ($builder) use($query) {
            $builder->join('departments', 'employees.department_id', '=', 'departments.id')
                    ->select(['departments.name' , 'employees.*'])
                    ->orderBy('employees.id', 'DESC');
        });
    }

   
    public function department()
    {
        return $this->belongsTo(Department::class, 'department_id', 'id');
    }
    public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id', 'id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
    

    public function ordering($ordering=[])
    {
        if(empty($ordering) || empty($ordering['order_by']))
            return $this->orderBy('created_at', 'desc');
        $order_by=$ordering["order_by"]??null;
        $order_type= (!empty($ordering["order_type"]) && in_array(strtolower($ordering["order_type"]),["desc","asc"]))?$ordering["order_type"]:'asc';
        
        if(in_array($order_by,['created_at']))
        {
            return $this->orderBy($order_by,$order_type);
        }
        if($order_by == 'status')
        {
            return $this->orderBy($order_by,$order_type);}

        if(in_array($order_by,['branch_id','department_id']))
        {
            $model= str_replace("_id","",$order_by);
            $models = $order_by=="branch_id"? $model.'es':$model.'s';
            return $this->select("employees.*")->join($models,$models.".id","=","employees.".$order_by)->orderByRaw('JSON_EXTRACT('.$models.'.name, "$.'.app()->getLocale().'") '.$order_type);
        }
        if($order_by=='user_id')
        return $this->select("employees.*")->join("users","users.id","=","employees.".$order_by)->orderBy('name', $order_type);
        return $this->orderBy('created_at', 'desc');

    }

    

}
