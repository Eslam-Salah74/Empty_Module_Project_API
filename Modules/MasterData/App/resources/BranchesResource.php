<?php

namespace Modules\MasterData\App\resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BranchesResource extends JsonResource
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
            'branch_code'=>$this->branch_code??null,
            'email'=>$this->email??null,
            'mobile'=>$this->mobile??null,
            'status'=>$this->status??null,
        ];
    }
}
