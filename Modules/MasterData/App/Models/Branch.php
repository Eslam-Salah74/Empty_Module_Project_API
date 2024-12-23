<?php

namespace Modules\MasterData\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;
use Laravel\Scout\Searchable;
use Modules\MasterData\App\Filters\BranchFilter;
// use App\Traits\ActivityLogTrait;


class Branch extends Model implements HasMedia
{
    use HasFactory,SoftDeletes,HasTranslations,InteractsWithMedia,Searchable;

    /**
     * The attributes that are mass assignable.
     */
    
    
     use Searchable {
        Searchable::search as parentSearch;
    }


    protected $guarded  = ['id'];


    public $translatable = ['name'];

    protected $casts = [
        'name' => 'json'
    ];


    protected static function boot()
    {
        parent::boot();
        //this function use to make validation before destroy the record to refuse deleting if it has a related data in other tables
        static::deleting(function($model) {
            if
            (
                $model->employees()->count() > 0 ||
                $model->invoices()->count() > 0 ||
                $model->orders()->count() > 0 ||
                $model->receipts()->count() > 0 ||
                $model->safes()->count() > 0
            )
            {
                throw new \Exception('Can Not Delete Beacause There Is A Related Data');
            }
        });

        static::addGlobalScope(function ($query) {

            if (auth()->check()) {
                $employee = auth()->user()->employee??null;
                if($employee && $employee->branches_accessibility != 1){
                    $query->where('id', $employee->branch_id);
                }else{

                }
            } else {
                // Define default behavior if user is not authenticated
            }

        });
    }

    public function scopeFilter($query,BranchFilter $filter)
    {
        return $filter->apply($query);
    }


    public function scopeAccessibleByUser($query, $user)
    {
        // Implement logic to filter branches accessible by the user
        if (auth()->check()) {
            $employee = auth()->user()->employee??null;
            if($employee && $employee->branches_accessibility != 1){
                $query->where('id', $employee->branch_id);
            }else{

            }
        } else {
            // Define default behavior if user is not authenticated
        }
    }

    public function scopeStatus($query)
    {
        $query->where('status' , 1);
    }

    public function toSearchableArray(): array
    {
        return [
            'name->'.app()->getLocale() => $this->getTranslation('name', app()->getLocale()),
            'areas.name->'.app()->getLocale() => '',

        ];
    }
   
    public static function search($query = '', $callback = null)
    {
        return static::parentSearch($query, $callback)->query(function ($builder) use($query) {
            $builder->join('areas', 'branches.area_id', '=', 'areas.id')
                    ->select(['areas.name' , 'branches.*'])
                    ->orderBy('branches.id', 'DESC');
        });
    }

    //start relations
    public function employees()
    {
        return $this->hasMany(\Modules\MasterData\App\Models\Employee::class);
    }
   
    public function ordering($ordering=[])
    {
        if(empty($ordering) || empty($ordering['order_by']))
            return $this->orderBy('created_at', 'desc');
        $order_by=$ordering["order_by"]??null;
        $order_type= (!empty($ordering["order_type"]) && in_array(strtolower($ordering["order_type"]),["desc","asc"]))?$ordering["order_type"]:'asc';
        if($order_by == 'name')
        {
            return $this->orderBy($order_by,$order_type)->orderByRaw('JSON_EXTRACT(name, "$.'.app()->getLocale().'") '.$order_type);
        }
        if(in_array($order_by,['created_at']))
        {
            return $this->orderBy($order_by,$order_type);
        }
        if(in_array($order_by,['email']))
        {
            return $this->orderBy($order_by,$order_type);
        }
        if(in_array($order_by,['status']))
        {
            return $this->orderBy($order_by,$order_type);
        }
        if(in_array($order_by,['mobile']))
        {
            return $this->orderBy($order_by,$order_type);
        }
        
        return $this->orderBy('created_at', 'desc');

    }

}