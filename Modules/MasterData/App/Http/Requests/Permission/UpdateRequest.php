<?php

namespace Modules\MasterData\App\Http\Requests\Permission;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules()
    {
        $roles =
            [
                'name' => 'required|string|unique:permissions,name,'.$this->permission->id.',id,deleted_at,NULL',
                
            ];

        return $roles;
    }


    /**
     * Get the validation messages that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function messages()
    {
        return [
            'name.required' => trans('validation.required'),
            'email.required' => trans('validation.required'),
            'name.string'   => trans('validation.string'),
        ];
    }

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }
}
