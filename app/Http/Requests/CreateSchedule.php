<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateSchedule extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'day_of_week'   => 'required',
            'shift'   => 'required',
            'user_id'       => 'required',
        ];
    }

    public function messages()
    {
        return  [
            'day_of_week.required'  => 'Thứ không được để trống',
            'time_of_day.required'  => 'Ca không được để trống',
            'user_id.required'      => 'Nhân viên không được để trống',
        ];
    }
}
