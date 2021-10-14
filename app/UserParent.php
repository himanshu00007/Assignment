<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class UserParent extends Model
{

    protected $table = 'parents';

    public function student()
    {
        return $this->belongsTo('App\Student', 'student_id');
    }
}
