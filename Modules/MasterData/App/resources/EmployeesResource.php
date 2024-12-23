<?php

namespace Modules\MasterData\App\resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Modules\MasterData\App\resources\RolesResource;

class EmployeesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray($request): array
    {
        return [
            'id'=>$this->id,
            'name'=>$this->user->name??null,
            'email'=>$this->user->email??null,
            'status'=>$this->user->status??null,
            'branches_accessibility'=>$this->branches_accessibility??null,
            'department'=>$this->department_id,
            'department_name'=>$this->department->name??null,
            'branch'=>$this->branch_id,
            'branch_name'=>$this->branch->name??null,
            'role'=>RolesResource::collection($this->user->role),
            ];
    }
}
