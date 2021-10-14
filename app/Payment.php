<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    /**
     * Parent table association of User table
     */
    public function invoice()
    {
        return $this->belongsTo('App\Invoice', 'invoice_id');
    }
}
