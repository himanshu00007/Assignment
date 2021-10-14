<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $table = 'users';

    /**
     * Parent table association of User table
     */
    public function parent()
    {
        return $this->hasOne('App\UserParent', 'student_id', 'student_id');
    }
    
    /**
     * Invoices relationship with user
     */
    public function invoices()
    {
        return $this->hasMany('App\Invoice', 'student_id', 'student_id');
    }
    
    /**
     * Acedemic Info relationship with user
     */
    public function acedemics()
    {
        return $this->hasMany('App\AcedemicInfo', 'student_id', 'student_id');
    }
}
