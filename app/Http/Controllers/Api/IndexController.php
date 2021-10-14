<?php 

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller as MainController;
use App\Student;

class IndexController extends MainController 
{
    public function index()
    {
        // fetch all students
        $users = Student::with('parent', 'acedemics', 'invoices.payments')->get();
        $output = [];
        if(!empty($users)) {
            $count =0;
            foreach ($users as $user) {
                $output[$count]['firstname'] = $user['firstname'];
                $output[$count]['lastname'] = $user['lastname'];
                $output[$count]['phone'] = $user['phone'];
                $output[$count]['email'] = $user['email'];
                // fetch parent info
                if(isset($user['parent']) && !empty($user['parent'])) {
                    $output[$count]['parent'] = $user['parent'];
                } else {
                    $output[$count]['parent'] = [];
                }
                // fetch acedemic info of student
                if(isset($user['acedemics']) && !empty($user['acedemics'])) {
                    $Acedemiccount =0;
                    foreach ($user['acedemics'] as $acedemics) {
                        $output[$count]['acedemics'][$Acedemiccount]['school_name'] = $acedemics['school_name'];
                        $output[$count]['acedemics'][$Acedemiccount]['school_grade'] = $acedemics['school_grade'];
                        $output[$count]['acedemics'][$Acedemiccount]['school_roll_number'] = $acedemics['school_roll_number'];
                        $Acedemiccount++;
                    }
                } else {
                    $output[$count]['acedemics'] = [];
                }
                
                // fetch invoice info of student
                if(isset($user['invoices']) && !empty($user['invoices'])) {
                    $Invoicecount =0;
                    foreach ($user['invoices'] as $invoices) {
                        $output[$count]['invoices'][$Invoicecount]['issue_date'] = $invoices['issue_date'];
                        $output[$count]['invoices'][$Invoicecount]['due_date'] = $invoices['due_date'];
                        $output[$count]['invoices'][$Invoicecount]['amount'] = $invoices['amount'];
                        $output[$count]['invoices'][$Invoicecount]['tax'] = $invoices['tax'];
                        $output[$count]['invoices'][$Invoicecount]['discount'] = $invoices['discount'];
                        $output[$count]['invoices'][$Invoicecount]['net_amount'] = $invoices['net_amount'];
                        // get payment info of invoice
                        if(isset($invoices['payments']) && !empty($invoices['payments'])) {
                            $paymentCount = 0;
                            foreach ($invoices['payments'] as $payments) {
                                $output[$count]['invoices'][$Invoicecount]['payments'][$paymentCount]['payment_date'] = $payments['payment_date'];
                                $output[$count]['invoices'][$Invoicecount]['payments'][$paymentCount]['payment_amount'] = $payments['payment_amount'];
                                $output[$count]['invoices'][$Invoicecount]['payments'][$paymentCount]['payment_mode'] = $payments['payment_mode'];
                                $paymentCount++;
                            }
                        } else {
                            $output[$count]['invoices'][$Invoicecount]['issue_date'] = $invoices['issue_date'];
                            $output[$count]['invoices'][$Invoicecount]['due_date'] = $invoices['due_date'];
                            $output[$count]['invoices'][$Invoicecount]['amount'] = $invoices['amount'];
                            $output[$count]['invoices'][$Invoicecount]['tax'] = $invoices['tax'];
                            $output[$count]['invoices'][$Invoicecount]['discount'] = $invoices['discount'];
                            $output[$count]['invoices'][$Invoicecount]['net_amount'] = $invoices['net_amount'];
                        }
                        $Invoicecount++;
                    }
                } else {
                    $output[$count]['invoices'] = [];
                }
                $count++;
            }
        }
        echo json_encode($output);
    }

}