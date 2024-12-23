<?php

namespace Modules\MasterData\App\Models;

use Illuminate\Support\Str;
use Laravel\Scout\Searchable;
use Spatie\MediaLibrary\HasMedia;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Setting extends Model implements HasMedia
{
   use HasFactory, Searchable, InteractsWithMedia;

    /**
     * The attributes that are mass assignable.
     */

     protected $fillable = ['key','value','options'];
    //  protected $guarded = ['id'];
     protected $table = 'settings';
    //  protected $appends = ['custom_key'];


    public function getCasts()
    {
        $casts = parent::getCasts();
        // $options = $this->attributes['options'];
        if (isset($this->attributes['options'])) {
        $options = $this->attributes['options'];

        if (Str::startsWith($options, '@')) {
            $casts['options'] = 'string';
        } else {
            $casts['options'] = 'json';
        }
    }
        return $casts;
    }


    // protected $translatable =['key'];
    public function toSearchableArray(): array
    {
        return [
            'name' => trans('message.'.$this->key,app()->getLocale()),
        ];
    }


    public function getCustomKeyAttribute()
    {
        $language = request()->header('Accept-Language', 'en'); // Default to English if Accept-Language header is not provided
        if(isset($this->attributes['key'])){
            return trans($this->attributes['key'], [], $language) ?? $this->attributes['key'];
        }
    }

    public function getCustomTitleAttribute()
    {
        $language = request()->header('Accept-Language', 'en'); // Default to English if Accept-Language header is not provided
        if(isset($this->attributes['title'])){
            return trans($this->attributes['title'], [], $language) ?? $this->attributes['title'];
        }
    }


    public function getAvailableOptionsAttribute()
    {
        if($this->attributes['type'] == 'dropdown' && $this->attributes['options'] != null){
            $options = $this->attributes['options'];
            if (Str::startsWith($options, '@')) {
                $tableName = substr($options, 1);
                $modelName = \Illuminate\Support\Str::studly(\Illuminate\Support\Str::singular($tableName));
               return  $modelName .='Resource';
                $chartAccounts = DB::table($tableName)->get();
                return $modelName::collection($chartAccounts);
                return 'yes here';
            } else {
                return null;
            }

        }else{
            return null;
        }
    }

    /** image library **/
    public function getValueAttribute()
    {
        if($this->attributes['type']=='file')
        {
            $file = $this->getMedia('setting')->last();
            if ($file) {
                return $file->getUrl();
                $file->id = $this->getMedia('setting')->last()->id;
                $file->url = $file->getUrl();
                $file->localUrl = app('url')->asset('storage/' . $file->id . '/' . $file->file_name);
            }
        }
        return $this->attributes['value'];
    }

    public function getImagesAttribute()
    {
        $files = $this->getMedia('setting_images');
        return  $this->filesData($files);
    }

    public function filesData($data)
    {
        $urls = [];
        foreach ($data as $key => $file) {
            $urls[$key]['id'] = $file->id;
            $urls[$key]['url'] = $file->getFullUrl();
            $file->localUrl = app('url')->asset('storage/' . $file->id . '/' . $file->file_name);

        }
        return ($urls);
    }



}
