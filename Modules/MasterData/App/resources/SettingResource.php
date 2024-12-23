<?php

namespace Modules\MasterData\App\resources;

use Illuminate\Http\Resources\Json\JsonResource;
class SettingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray($request): array
    {
        if($this->key != 'exp_date')
        {
            return [
                'id'                  => $this->id,
                'key'                 => $this->custom_key,
                'key_en'              => trans($this->key,[],'en'),
                'key_ar'              => trans($this->key,[],'ar'),
                'value'               => $this->value,
                'type'                => $this->type,
                'title'               => $this->title,
                'index'               => $this->index,
                'options'             => $this->options,
                //'available_options' => $this->available_options,
            ];
        }
        else
        {
            return [
                'id'                  => '',
                'key'                 => '',
                'key_en'              => '',
                'key_ar'              => '',
                'value'               => '',
                'type'                => '',
                'title'               => '',
                'index'               => '',
                'options'             => '',
                //'available_options' => '',
            ];
        }

    }
}
