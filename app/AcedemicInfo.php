<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class AcedemicInfo extends Model
{
     /**
     * Parent table association of User table
     */
    public function student()
    {
        return $this->belongsTo('App\Student', 'student_id');
    }
}
