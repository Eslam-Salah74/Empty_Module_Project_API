<?php

namespace Modules\MasterData\App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmployeeUpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules()
    {
        $roles = [] ;


         $roles = array_merge($roles, [
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email,'.$this->employee->user->id.',id,deleted_at,NULL',
            'status' => 'required|in:0,1',
            'department_id' => 'required|exists:departments,id',
            'branch_id' => 'required|exists:branches,id',
            'role_id'=>'required|exists:roles,id',
            'branches_accessibility'=>'required|in:0,1',
           
        ]);

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
