<?php

namespace Modules\MasterData\App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmployeeStoreRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules()
    {
        $roles = [] ;


        $roles = array_merge($roles, [

                'name' => 'required|string',
                'email' => 'required|email|unique:users,email,NULL,id,deleted_at,NULL',
               // 'type' => 'required|in:individual,corporation,both',
                'status' => 'required|in:0,1',
                'password' => request()->has('password')?'required|min:8|confirmed':'nullable',
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
