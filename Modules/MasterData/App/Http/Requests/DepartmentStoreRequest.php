<?php

namespace Modules\MasterData\App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DepartmentStoreRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules()
    {
        $roles = [] ;

        foreach (config('myConfig.langs') as $lang)
        {
            $roles ['name.'.$lang] = 'required|unique:departments,name->'.$lang.',NULL,id,deleted_at,NULL';
        }


        $roles = array_merge($roles, [
            'status' => 'required|in:0,1',
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
            'name.en.required' => trans('validation.required'),
            'name.ar.required' => trans('validation.required'),
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
