<?php

namespace Modules\MasterData\App\resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DepartmentsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray($request): array
    {
        return [
            'id'=>$this->id,
            'name_en'=>$this->getTranslation('name' , 'en'),
            'name_ar'=>$this->getTranslation('name' , 'ar'),
            'status'=>$this->status??null,
        ];
    }
}
