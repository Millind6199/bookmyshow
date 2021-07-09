<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    public function create()
    {

        return view('/Email/mail');
    }
    public function sendEmail(Request $request)
    {
//        dd($request->all());
//        $request->validate([
//            'email' => 'required|email',
//            'subject' => 'required',
//            'content' => 'required',
//        ]);

        $email_id = auth()->guard('api')->user()->email;

        $data = [
            'subject' => "You booked movie-tickets successfully",
            'email' => $email_id,
            'content' => $request->content
        ];

        Mail::send('/Email/mail', $data, function($message) use ($data) {
            $message->to($data['email'])
                ->subject($data['subject']);
        });

        return back()->with(['message' => 'Email successfully sent!']);
    }
}
