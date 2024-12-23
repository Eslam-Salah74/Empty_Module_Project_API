<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Contracts\Validation\ValidationRule;

class DateFormat implements Rule
{
    public function passes($attribute, $value)
    {
        // Attempt to create a DateTime object from the input value with the specified format
        $date = \DateTime::createFromFormat('d-m-Y', $value);

        // Check if the input value matches the specified format and if it's a valid date
        return $date && $date->format('d-m-Y') === $value;
    }

    public function message()
    {
        return 'The :attribute must be in the format dd-mm-yyyy.';
    }
}
