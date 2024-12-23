<?php

namespace Modules\MasterData\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;
use Laravel\Scout\Searchable;
// use App\Traits\ActivityLogTrait;


class Department extends Model implements HasMedia
{
    use HasFactory,SoftDeletes ,HasTranslations , InteractsWithMedia , Searchable;

    //this function use to make validation before destroy the record to refuse deleting if it has a related data in other tables
    protected static function boot()
    {
        parent::boot();
        static::deleting(function($model) {
            if
            (
                $model->employees()->count() > 0)
            {
                throw new \Exception('Can Not Delete Beacause There Is A Related Data');
            }
        });
    }
    /**
     * The attributes that are mass assignable.
     */
    protected $guarded = ['id'];

    public $translatable = ['name'];

    protected $casts = [
        'name' => 'json'
    ];

    public function scopeStatus($query)
    {
        $query->where('status' , 1);
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
        if($order_by == 'status')
        {
            return $this->orderBy($order_by,$order_type);}
            
            return $this->orderBy('created_at', 'desc');

    }
    
}