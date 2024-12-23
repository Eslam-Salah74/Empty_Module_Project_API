<?php

// Note
// Please do not Change any english word
// focus on all arabic word and its translation


$attributes = [];
$languages = ['ar' => 'العربي', 'en' => 'الانجليزي'];
for ($i = 0; $i <= 5; $i++) {
    for ($j = 0; $j <= 5; $j++) {

        $attributes["custom_fields.$i.options.$j"] = "الحقول المخصصة $i الاختيار $j "; // ستظهر الترجمه بهذه الطريقه "الحقول المخصصه 0 الاختيار 1" تطبق هذه الطريقه علي باقي العناصر الموجوده في بدايه الملف
        $attributes["custom_fields.$i.custom_field_data.$j.status"] = "الحقول المخصصة $i معلومات الحقول المخصصه $j الحالة "; // "الحقول المخصصة 0 معلومات الحقوق المخصصة 0 الحالة"
        $attributes["custom_fields.$i.custom_field_data.$j.value.en"] = "الحقول المخصصة $i معلومات الحقول المخصصه $j القيمه الانجليزي ";
        $attributes["custom_fields.$i.custom_field_data.$j.value.ar"] = "الحقول المخصصة $i معلومات الحقول المخصصه $j القيمه العربي ";
        $attributes["order_items.$i.custom_field_data.$j.custom_field_id"] = "عناصر الطلب $i معلومات العناصر المخصصة $j العنصر المخصص ";

    }
    $attributes["custom_fields.$i.status"] = "الحقول المخصصة $i الحالة ";
    $attributes["custom_fields.$i.type"] = "الحقول المخصصة $i النوع ";


    foreach ($languages as $key => $value) {
        $attributes["custom_fields.$i.name.$key"] = "الحقول المخصصة $i الاسم $value ";
        $attributes["additional_data.$i.key.$key"] = "المعلومات الاضافيه $i المفتاح $value ";
        $attributes["additional_data.$i.value.$key"] = "المعلومات الاضافيه $i القيمه $value ";
        $attributes["custom_fields.$i.name.$key"] = "الحقول المخصصة $i الاسم $value ";
    }

    $attributes["additional_data.$i.is_default"] = "المعلومات الاضافيه $i قيمه ثابته ";

    $attributes["transactions_data.$i.chart_account_id"] = "معلومات العمليات $i حساب الرسم البياني ";
    $attributes["transactions_data.$i.amount"] = "معلومات العمليات $i الكميه ";
    $attributes["transactions_data.$i.cost_center_id"] = "معلومات العمليات $i مركز التسعير ";
    $attributes["transactions_data.$i.notes"] = "معلومات العمليات $i الملاحظات ";

    $attributes["invoice_items.$i.notes"] = "عناصر الفاتوره $i الملاحظات ";
    $attributes["invoice_items.$i.currency_id"] = "عناصر الفاتوره $i العملة ";
    $attributes["invoice_items.$i.unit_price"] = "عناصر الفاتوره $i سعر الوحدة ";
    $attributes["invoice_items.$i.quantity"] = "عناصر الفاتوره $i الكمية ";


    $attributes["order_items.$i.activity_id"] = "عناصر الطلب $i النشاط ";
    $attributes["order_items.$i.quantity"] = "عناصر الطلب $i الكمية ";
    $attributes["order_items.$i.notes"] = "عناصر الطلب $i الملاحظات ";
    $attributes["order_items.$i.model_type"] = "عناصر الطلب $i نوع الموديل ";
    $attributes["order_items.$i.model_id"] = "عناصر الطلب $i الموديل ";
    $attributes["order_items.$i.cost"] = "عناصر الطلب $i التكلفه ";

    $attributes["order_id.$i"] = "الطلب $i";
    $attributes["permission_ids.$i"] = "الصلاحيه $i";
    $attributes["role_id.$i"] = "الدور $i";
    $attributes["program_booking_clients.$i.client_id"] = "عملاء حجز البرنامج $i العميل";


    $attributes["custom_field_data.$i.value"] = "معلومات الحقول المخصصة $i القيمة ";
    $attributes["custom_field_data.$i.custom_field_id"] = "معلومات الحقول المخصصة $i الحقل المخصص ";

    $attributes["programs_hotels.$i.hotel_id"] = "فنادق البرنامج $i الفندق ";
    $attributes["programs_hotels.$i.num_of_days"] = "فنادق البرنامج $i عدد الايام ";
    $attributes["programs_hotels.$i.residence_type"] = "فنادق البرنامج $i نوع الإقامة ";
    $attributes["programs_hotels.$i.city_id"] = "فنادق البرنامج $i  المدينة ";

}


return [

    'accepted' => 'يجب قبول الحقل :attribute',
    'accepted_if' => 'الحقل :attribute مقبول في حال ما إذا كان :other يساوي :value.',
    'active_url' => 'الحقل :attribute لا يُمثّل رابطًا صحيحًا',
    'after' => 'يجب على الحقل :attribute أن يكون تاريخًا لاحقًا للتاريخ :date.',
    'after_or_equal' => 'الحقل :attribute يجب أن يكون تاريخاً لاحقاً أو مطابقاً للتاريخ :date.',
    'alpha' => 'يجب أن لا يحتوي الحقل :attribute سوى على حروف',
    'alpha_dash' => 'يجب أن لا يحتوي الحقل :attribute على حروف، أرقام ومطّات.',
    'alpha_num' => 'يجب أن يحتوي :attribute على حروفٍ وأرقامٍ فقط',
    'array' => 'يجب أن يكون الحقل :attribute ًمصفوفة',
    'before' => 'يجب على الحقل :attribute أن يكون تاريخًا سابقًا للتاريخ :date.',
    'before_or_equal' => 'الحقل :attribute يجب أن يكون تاريخا سابقا أو مطابقا للتاريخ :date',
    'between' => [
        'array' => 'يجب أن يحتوي :attribute على عدد من العناصر بين :min و :max',
        'file' => 'يجب أن يكون حجم الملف :attribute بين :min و :max كيلوبايت.',
        'numeric' => 'يجب أن تكون قيمة :attribute بين :min و :max.',
        'string' => 'يجب أن يكون عدد حروف النّص :attribute بين :min و :max',
    ],
    'boolean' => 'يجب أن تكون قيمة الحقل :attribute إما true أو false ',
    'confirmed' => 'حقل التأكيد غير مُطابق للحقل :attribute',
    'current_password' => 'كلمة المرور غير صحيحة',
    'date' => 'الحقل :attribute ليس تاريخًا صحيحًا',
    'date_equals' => 'لا يساوي الحقل :attribute مع :date.',
    'date_format' => 'لا يتوافق الحقل :attribute مع الشكل :format.',
    'declined' => 'يجب رفض الحقل :attribute',
    'declined_if' => 'الحقل :attribute مرفوض في حال ما إذا كان :other يساوي :value.',
    'different' => 'يجب أن يكون الحقلان :attribute و :other مُختلفان',
    'digits' => 'يجب أن يحتوي الحقل :attribute على :digits رقمًا/أرقام',
    'digits_between' => 'يجب أن يحتوي الحقل :attribute بين :min و :max رقمًا/أرقام',
    'dimensions' => 'الـ :attribute يحتوي على أبعاد صورة غير صالحة.',
    'distinct' => 'للحقل :attribute قيمة مُكرّرة.',
    'doesnt_end_with' => 'الحقل :attribute يجب ألا ينتهي بواحدة من القيم التالية: :values.',
    'doesnt_start_with' => 'الحقل :attribute يجب ألا يبدأ بواحدة من القيم التالية: :values.',
    'email' => 'يجب أن يكون :attribute عنوان بريد إلكتروني صحيح البُنية',
    'ends_with' => 'الـ :attribute يجب ان ينتهي بأحد القيم التالية :value.',
    'enum' => 'الحقل :attribute غير صحيح',
    'exists' => 'الحقل :attribute غير صحيح',
    'file' => 'الـ :attribute يجب أن يكون من ملفا.',
    'filled' => 'الحقل :attribute إجباري',
    'gt' => [
        'array' => 'الـ :attribute يجب ان يحتوي علي اكثر من :value عناصر/عنصر.',
        'file' => 'الـ :attribute يجب ان يكون اكبر من :value كيلو بايت.',
        'numeric' => 'الـ :attribute يجب ان يكون اكبر من :value.',
        'string' => 'الـ :attribute يجب ان يكون اكبر من :value حروفٍ/حرفًا.',
    ],
    'gte' => [
        'array' => 'الـ :attribute يجب ان يحتوي علي :value عناصر/عنصر او اكثر.',
        'file' => 'الـ :attribute يجب ان يكون اكبر من او يساوي :value كيلو بايت.',
        'numeric' => 'الـ :attribute يجب ان يكون اكبر من او يساوي :value.',
        'string' => 'الـ :attribute يجب ان يكون اكبر من او يساوي :value حروفٍ/حرفًا.',
    ],
    'image' => 'يجب أن يكون الحقل :attribute صورةً',
    'in' => 'الحقل :attribute غير صحيح',
    'in_array' => 'الحقل :attribute غير موجود في :other.',
    'integer' => 'يجب أن يكون الحقل :attribute عددًا صحيحًا',
    'ip' => 'يجب أن يكون الحقل :attribute عنوان IP ذا بُنية صحيحة',
    'ipv4' => 'يجب أن يكون الحقل :attribute عنوان IPv4 ذا بنية صحيحة.',
    'ipv6' => 'يجب أن يكون الحقل :attribute عنوان IPv6 ذا بنية صحيحة.',
    'json' => 'يجب أن يكون الحقل :attribute نصا من نوع JSON.',
    'lowercase' => 'الحقل :attribute يجب ان يتكون من حروف صغيرة',
    'lt' => [
        'array' => 'الـ :attribute يجب ان يحتوي علي اقل من :value عناصر/عنصر.',
        'file' => 'الـ :attribute يجب ان يكون اقل من :value كيلو بايت.',
        'numeric' => 'الـ :attribute يجب ان يكون اقل من :value.',
        'string' => 'الـ :attribute يجب ان يكون اقل من :value حروفٍ/حرفًا.',
    ],
    'lte' => [
        'array' => 'الـ :attribute يجب ان يحتوي علي اكثر من :value عناصر/عنصر.',
        'file' => 'الـ :attribute يجب ان يكون اقل من او يساوي :value كيلو بايت.',
        'numeric' => 'الـ :attribute يجب ان يكون اقل من او يساوي :value.',
        'string' => 'الـ :attribute يجب ان يكون اقل من او يساوي :value حروفٍ/حرفًا.',
    ],
    'mac_address' => 'يجب أن يكون الحقل :attribute عنوان MAC ذا بنية صحيحة.',
    'max' => [
        'array' => 'يجب أن لا يحتوي الحقل :attribute على أكثر من :max عناصر/عنصر.',
        'file' => 'يجب أن لا يتجاوز حجم الملف :attribute :max كيلوبايت',
        'numeric' => 'يجب أن تكون قيمة الحقل :attribute مساوية أو أصغر لـ :max.',
        'string' => 'يجب أن لا يتجاوز طول نص :attribute :max حروفٍ/حرفًا',
    ],
    'max_digits' => 'الحقل :attribute يجب ألا يحتوي أكثر من :max أرقام.',
    'mimes' => 'يجب أن يكون الحقل ملفًا من نوع : :values.',
    'mimetypes' => 'يجب أن يكون الحقل ملفًا من نوع : :values.',
    'min' => [
        'array' => 'يجب أن يحتوي الحقل :attribute على الأقل على :min عُنصرًا/عناصر',
        'file' => 'يجب أن يكون حجم الملف :attribute على الأقل :min كيلوبايت',
        'numeric' => 'يجب أن تكون قيمة الحقل :attribute مساوية أو أكبر لـ :min.',
        'string' => 'يجب أن يكون طول نص :attribute على الأقل :min حروفٍ/حرفًا',
    ],
    'min_digits' => 'الحقل :attribute يجب أن يحتوي :min أرقام على الأقل.',
    'multiple_of' => 'الحقل :attribute يجب أن يكون من مضاعفات :value.',
    'not_in' => 'الحقل :attribute غير صحيح',
    'not_regex' => 'الحقل :attribute نوعه غير صحيح',
    'numeric' => 'يجب على الحقل :attribute أن يكون رقمًا',
    'password' => [
        'letters' => 'يجب ان يشمل حقل :attribute على حرف واحد على الاقل.',
        'mixed' => 'يجب ان يشمل حقل :attribute على حرف واحد بصيغة كبيرة على الاقل وحرف اخر بصيغة صغيرة.',
        'numbers' => 'يجب ان يشمل حقل :attribute على رقم واحد على الاقل.',
        'symbols' => 'يجب ان يشمل حقل :attribute على رمز واحد على الاقل.',
        'uncompromised' => 'حقل :attribute تبدو غير آمنة. الرجاء اختيار قيمة اخرى.',
    ],
    'present' => 'يجب تقديم الحقل :attribute',
    'prohibited' => 'الحقل :attribute محظور',
    'prohibited_if' => 'الحقل :attribute محظور في حال ما إذا كان :other يساوي :value.',
    'prohibited_unless' => 'الحقل :attribute محظور في حال ما لم يكون :other يساوي :value.',
    'prohibits' => 'الحقل :attribute يحظر :other من اي يكون موجود',
    'regex' => 'صيغة الحقل :attribute .غير صحيحة',
    'required' => 'الحقل :attribute مطلوب.',
    'required_array_keys' => 'الحقل :attribute يجب ان يحتوي علي مدخلات للقيم التالية :values.',
    'required_if' => 'الحقل :attribute مطلوب في حال ما إذا كان :other يساوي :value.',
    'required_if_accepted' => 'The :attribute field is required when :other is accepted.',
    'required_unless' => 'الحقل :attribute مطلوب في حال ما لم يكن :other يساوي :values.',
    'required_with' => 'الحقل :attribute إذا توفّر :values.',
    'required_with_all' => 'الحقل :attribute إذا توفّر :values.',
    'required_without' => 'الحقل :attribute إذا لم يتوفّر :values.',
    'required_without_all' => 'الحقل :attribute إذا لم يتوفّر :values.',
    'same' => 'يجب أن يتطابق الحقل :attribute مع :other',
    'size' => [
        'array' => 'يجب أن يحتوي الحقل :attribute على :size عنصرٍ/عناصر بالظبط',
        'file' => 'يجب أن يكون حجم الملف :attribute :size كيلوبايت',
        'numeric' => 'يجب أن تكون قيمة الحقل :attribute مساوية لـ :size',
        'string' => 'يجب أن يحتوي النص :attribute على :size حروفٍ/حرفًا بالظبط',
    ],
    'starts_with' => 'الحقل :attribute يجب ان يبدأ بأحد القيم التالية: :values.',
    'string' => 'يجب أن يكون الحقل :attribute نصآ.',
    'timezone' => 'يجب أن يكون :attribute نطاقًا زمنيًا صحيحًا',
    'unique' => 'قيمة الحقل :attribute مُستخدمة من قبل',
    'uploaded' => 'فشل في تحميل الـ :attribute',
    'uppercase' => 'The :attribute must be uppercase.',
    'url' => 'صيغة الرابط :attribute غير صحيحة',
    'uuid' => 'الحقل :attribute يجب ان ايكون رقم UUID صحيح.',
    'unique_combination' => 'هذه القيم موجودة بالفعل سوياً من قبل',



// please review the next fields translation properly as our bessiness translation demand

    'attributes' => array_merge($attributes, [
        'name' => 'الاسم',
        'name.ar' => 'الاسم العربي',
        'name.en' => 'الاسم االانجليزي',
        'status' => 'الحالة',
        'activity_code' => 'رقم النشاط',
        'custom_fields' => 'الحقول المخصصه',
        'currency_id' => 'العملة',
        'branch_id' => 'الفرع',
        'chart_account_origin_id' => 'اصل حساب الرسم البياني',
        'chart_account_expense_id' => ' حساب الرسم البياني',
        'type_id' => 'النوع',
        'code' => 'الرقم',
        'flight_company_id' => 'شركة الطيران',
        'travel_date' => 'تاريخ السفر',
        'travel_h_date' => 'تاريخ السفر الهجري',
        'travel_hegri_date ' => 'تاريخ السفر الهجري',
        'return_date' => 'تاريخ العوده',
        'return_h_date' => 'تاريخ العودة الهجري',
        'return_hegri_date ' => 'تاريخ العودة الهجري',
        'numbers' => 'الارقام',
        'cost' => 'التكلفة',
        'confirmation_date' => 'تاريخ التاكيد',
        'travel_path_id' => 'طريق السفر',
        'return_path_id' => 'طريق العودة',
        'flight_num' => 'رقم الرحلة',
        'pnr' => 'اسم المسافر',
        'Date_arrival_d' => 'وقت الوصول ذهاب',
        'Date_departure_d' => 'وقت المغادره ذهاب',
        'Date_departure_r' => ',وقت المغادره عوده',
        'Date_arrival_r' => 'وقت الوصول عودة',
        'program_count' => 'عدد البرنامج',
        'program_booking_count' => 'عدد حجز البنامج',
        'flight_count' => 'عدد رحلات الطيران',
        'from_city_id' => 'من مدينة',
        'to_city_id' => 'الي مدينة',
        'distance' => 'المسافة',
        'facilities' => 'التسهيلات',
        'baby_price' => 'سعر الرضيع',
        'child_price' => 'سعر الطفل',
        'count' => 'العدد',
        'close_days' => 'ايام العطلة',
        'room_type_id' => 'نوع الغرفة',
        'service_cost' => 'تكلفة الخدمة',
        'reservation_payment' => 'طريقة دفع الحجز',
        'total_cost' => 'التكلفة الكلية',
        'member_count' => 'عدد الاعضاء',
        'room_type' => 'نوع الغرفة',
        'program_date' => 'تاريخ البرنامج',
        'program_id' => 'البرنامج',
        'user_id' => 'المستخدم',
        'service_id' => 'الخدمة',
        'open_rooms' => 'الغرف المتاحة',
        'reset_rooms' => 'الغاء الحجز',
        'no_rooms' => 'لايوجد غرف',
        'reservation_type' => 'نوع الحجز',
        'client_category' => 'فئه العميل',
        'main_client' => 'العميل الرئيسي',
        'client_name' => 'اسم العميل',
        'client_id' => 'العميل',
        'program_booking_clients' => 'عملاء حجز البرنامج',
        'role_id' => 'الدور',
        'type' => 'النوع',
        'permission_ids' => 'الصلاحية',
        'branches_accessibility' => 'إمكانية الوصول إلى الفروع',
        'receipt_type' => 'نوع الايصال',
        'account_id' => 'الحساب',
        'cost_center_id' => 'مركز التسعير ',
        'model_type' => 'نوع الموديل',
        'model_id' => 'الموديل',
        'chart_account_id' => 'حساب الرسم البياني',
        'class_id' => 'التصنيف',
        'notes' => 'الملاحظات',
        'note' => 'ملاحظة',
        'user_mobile' => 'رقم هاتف المستخدم',
        'value' => 'القيمة',
        'symbol' => 'الرمز',
        'base' => 'الاساس',
        'department_id' => 'القسم',
        'country_id' => 'الدولة',
        'area_id' => 'المنطقة',
        'gl_type_id' => 'نوع ال GL',
        'parent_id' => 'الرئيسي ',
        'image' => 'صوره ',
        'user_email' => 'البريد الالكتروني للمستخدم',
        'item_id' => 'العنصر',
        'branch_code' => 'رقم الفرع',
        'city_id' => 'المدينة ',
        'user_type' => 'نوع المستخدم',
        'rate' => 'التقييم ',
        'safe_id' => 'الخزنه ',
        'reference_num' => 'رقم المرجع ',
        'order_type' => 'نوع الطلب',
        'start_date' => 'يبدا من ',
        'due_date' => 'ينتهي في',
        'username' => 'اسم المُستخدم',
        'payment_type' => 'نوع الدفع ',
        'email' => 'البريد الالكتروني',
        'first_name' => 'الاسم',
        'payment_method_id' => 'طريقه الدفع',
        'last_name' => 'اسم العائلة',
        'password' => 'كلمة المرور',
        'password_confirmation' => 'تأكيد كلمة المرور',
        'city' => 'المدينة',
        'level' => 'المستوي',
        'flight_id' => 'الرحلة',
        'programe_type' => 'نوع البرنامج',
        'programs_hotels' => 'فنادق البرنامج',
        'country' => 'الدولة',
        'address' => 'العنوان',
        'phone' => 'الهاتف',
        'mobile' => 'الجوال',
        'age' => 'العمر',
        'sex' => 'الجنس',
        'gender' => 'النوع',
        'day' => 'اليوم',
        'month' => 'الشهر',
        'year' => 'السنة',
        'hour' => 'ساعة',
        'minute' => 'دقيقة',
        'second' => 'ثانية',
        'content' => 'المُحتوى',
        'description' => 'الوصف',
        'excerpt' => 'المُلخص',
        'date' => 'التاريخ',
        'time' => 'الوقت',
        'available' => 'مُتاح',
        'size' => 'الحجم',
        'price' => 'السعر',
        'desc' => 'نبذه',
        'title' => 'العنوان',
        'q' => 'البحث',
        'link' => ' ',
        'slug' => ' ',
    ]),

];
