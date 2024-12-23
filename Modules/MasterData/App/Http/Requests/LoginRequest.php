<?php

namespace Modules\MasterData\App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return [
            'email'=> 'required|email|exists:users,email',
            'password' => 'required|min:6|max:200'
        ];
    }

    public function messages()
    {
        return [
            'email.required' => trans('validation.required'),
            'password.required' => trans('validation.required'),
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
