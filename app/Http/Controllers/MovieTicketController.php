<?php

namespace App\Http\Controllers;

use App\Models\MovieTicket;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MovieTicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request ,$movie_id )
    {
//            dd($id);
//            dd($request->all());
        $user_id = auth()->guard('api')->user()->id;
//        dd($user_id);
        $data = MovieTicket::create([
           'fkmovie_id'=> $movie_id,
            'qty'=> $request->qty,
            'date' => $request->showDate,
            'no' => $request->seat,
            'fkuser_id'=> $user_id
        ]);

        $response['status'] = "success";
        $response['massage'] = "Data inserted successfully";
        $response['data'] = $data;

        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\MovieTicket  $movieTicket
     * @return \Illuminate\Http\Response
     */
    public function show(MovieTicket $movieTicket)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\MovieTicket  $movieTicket
     * @return \Illuminate\Http\Response
     */
    public function edit(MovieTicket $movieTicket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\MovieTicket  $movieTicket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MovieTicket $movieTicket)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\MovieTicket  $movieTicket
     * @return \Illuminate\Http\Response
     */
    public function destroy(MovieTicket $movieTicket)
    {
        //
    }
}
