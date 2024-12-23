<?php

namespace Modules\MasterData\App\resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PermissionsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray($request): array
    {
        // $language = request()->header('Accept-Language', 'en'); // Default to English if Accept-Language header is not provided
        // $custom_name = trans($this->name, [], $language) ;
        return [
            'id'=>$this->id,
            'name'=>$this->name,
            'name_en'=>trans($this->name,[],'en'),
            'name_ar'=>trans($this->name,[],'ar'),

        ];
    }
}
