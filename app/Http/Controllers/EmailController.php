<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmailController extends Controller
{
    public function create()
    {

        return view('email');
    }
    public function sendEmail(Request $request)
    {
//        $request->validate([
//            'email' => 'required|email',
//            'subject' => 'required',
//            'content' => 'required',
//        ]);

        $email_id = auth()->guard('api')->user()->id;

        $data = [
            'subject' => $request->subject,
            'email' => $email_id,
            'content' => $request->content
        ];

        Mail::send('email-template', $data, function($message) use ($data) {
            $message->to($data['email'])
                ->subject($data['subject']);
        });

        return back()->with(['message' => 'Email successfully sent!']);
    }
}
