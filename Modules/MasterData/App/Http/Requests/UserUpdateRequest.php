<?php

namespace Modules\MasterData\App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserUpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules()
    {
        $roles =
            [
                'name' => 'required|string',
                'email' => 'required|email|unique:users,email,'.$this->user->id.',id,deleted_at,NULL',
                'status' => 'required|in:0,1',
                'password' => request()->has('password')?'required|min:8|confirmed':'nullable',
                'role_id'=>'required|exists:roles,id',
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
