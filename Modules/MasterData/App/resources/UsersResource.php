<?php

namespace Modules\MasterData\App\resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Modules\MasterData\App\resources\RolesResource;

class UsersResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     */
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'token' => $this->token,
            'name' => $this->name,
            'email' => $this->email,
            'role'=>RolesResource::collection($this->role??$this->roles),
        ];
    }
}
