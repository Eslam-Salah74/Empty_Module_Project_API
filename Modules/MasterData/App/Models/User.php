<?php

namespace Modules\MasterData\App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\MasterData\Database\factories\UserFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;
use Laravel\Scout\Searchable;
use App\Models\User as OldUser;
use Modules\MasterData\App\Filters\UserFilter;
class User extends OldUser
{
    use HasFactory,SoftDeletes,Searchable;

    //this function use to make validation before destroy the record to refuse deleting if it has a related data in other tables
    protected static function boot()
    {
        parent::boot();
        static::deleting(function($model) {
            if
            (
                $model->client()->count() > 0 ||
                $model->employee()->count() > 0 ||
                $model->gl_journals()->count() > 0 ||
                $model->invoices()->count() > 0 ||
                $model->orders()->count() > 0 ||
                $model->receipts()->count() > 0
            )
            {
                throw new \Exception('Can Not Delete Beacause There Is A Related Data');
            }
        });
    }

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [];
    protected $guarded = ['id'];


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

    public function scopeFilter($query,UserFilter $filter)
    {
        return $filter->apply($query);
    }



    //start relations
    
    public function employee()
    {
        return $this->hasOne(Employee::class);
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
    }

}
