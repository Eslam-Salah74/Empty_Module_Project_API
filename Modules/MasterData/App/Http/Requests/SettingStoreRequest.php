<?php

namespace Modules\MasterData\App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SettingStoreRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules()
    {
        $roles = [] ;

        $roles[] =
            [
                'value' => 'required|in:0,1',
                'type' => 'required|in:text,file,date,boolean,dropdown',
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
            'value.en.required' => trans('validation.required'),
            'value.ar.required' => trans('validation.required'),
            'type.required'   => trans('validation.required'),
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
