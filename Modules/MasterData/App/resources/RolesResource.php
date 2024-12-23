<?php

namespace Modules\MasterData\App\resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Modules\MasterData\App\resources\PermissionsResource;
class RolesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray($request): array
    {
        return [
            'id'=>$this->id,
            'name'=>$this->name,
            'name_en'=>$this->getTranslation('name' , 'en'),
            'name_ar'=>$this->getTranslation('name' , 'ar'),       
            'permissions'=>PermissionsResource::collection($this->permissions),
        ];
    }
}
