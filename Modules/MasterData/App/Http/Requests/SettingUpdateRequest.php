<?php

namespace Modules\MasterData\App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Str;

class SettingUpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules()
    {
        $roles = [] ;

        // $roles =
        //     [
        //         'type' => 'required|in:text,file,date,boolean',
        //     ];
            switch($this->setting->type){
                case'file':
                    $roles = array_merge($roles, [
                        'value' => 'required|file',
                    ]);
                    break;
                 case'integer':
                    $roles = array_merge($roles, [
                        'value' => 'required|integer',
                    ]);
                    break;
                case'date':
                    $roles = array_merge($roles, [
                        'value' => 'required|date',
                    ]);
                    break;
                case'boolean':
                    $roles = array_merge($roles, [
                        'value' => 'required|in:0,1',
                    ]);
                    break;
                case'text':
                    $roles = array_merge($roles, [
                        'value' => 'required|string|min:5',
                    ]);
                    break;

                case'json':
                    $roles = array_merge($roles, [
                        'value' => 'required|string',
                    ]);
                    break;
                case'dropdown':
                    // $setting = \Modules\MasterData\App\Models\Setting::find($this->setting->id);
                    $options = $this->setting->options;
                    // dd($options);
                    if (Str::startsWith($options, '@')) {
                        $extractedString = substr($options, 1);
                        $roles = array_merge($roles, [
                            'value' => 'required|exists:'.$extractedString.',id',
                        ]);
                    } else {
                        $roles = array_merge($roles, [
                            'value' => 'required|array',
                        ]);
                    }
                    break;
            }

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
