<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    public function student()
    {
        return $this->belongsTo('App\Student', 'student_id');
    }

    public function payments()
    {
        return $this->hasMany('App\Payment', 'invoice_id', 'invoice_id');
    }
}
