<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use App\Models\MovieCategory;
use Illuminate\Http\Request;
use phpseclib3\System\SSH\Agent\Identity;

class MovieController extends Controller
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
    public function store(Request $request)
    {
//        dd($request->file('image'));
//        dd($request->all());
        $request->file('image')->move('uploads/',$request->file('image')->getClientOriginalName());

        $data= Movie::create([
            'name' => $request->name,
            'overview' => $request->overview,
            'image' => $request->file('image')->getClientOriginalName(),
            'casts' => $request->casts,
            'runtime' => $request->runtime,
            'release_year' => $request->release_year,
            'lang' => $request->lang,
            'screen' => $request->screen,

        ]);

        $categories = explode(',' , $request->category);
            foreach( $categories as $cat ){
                MovieCategory::create([
                   'fkmovie_id'=>$data->id,
                   'fkcat_id' => $cat
                ]);
            }
        $response['status'] = "success";
        $response['massage'] = "Data inserted successfully";
        $response['data'] = $data;

        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $data = Movie::get();


        $response['status'] = "success";
        $response['massage'] = "Data inserted successfully";
        $response['data'] = $data;

        return $response;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function edit(Movie $movie)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Movie $movie ,$id)
    {
//        dd($request->all());
        $request->file('image')->move('uploads/',$request->file('image')->getClientOriginalName());

        $data = Movie::where('id',$id)->update(
            [
                'name' => $request->name,
                'overview' => $request->overview,
                'image' => $request->file('image')->getClientOriginalName(),
                'casts' => $request->casts,
                'runtime' => $request->runtime,
                'release_year' => $request->release_year,
                'lang' => $request->lang,
                'screen' => $request->screen,
            ]);
        MovieCategory::where('fkmovie_id',$id)->delete();

        $categories = explode(',',$request->category);
        foreach( $categories as $cat ){
            MovieCategory::create([
                'fkmovie_id'=>$id,
                'fkcat_id' => $cat
            ]);
        }

        $response['status'] = "success";
        $response['massage'] = "Data inserted successfully";
        $response['data'] = $data;

        return $response;



    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Movie  $movie
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)

    {

        Movie::destroy($id);
        MovieCategory::where('fkmovie_id', $id)->delete();

        $response['status'] = 'success';
        $response['massage'] = 'Data Deleted';


        return $response;

    }
    public function showById($id)
    {
        $data = Movie::where('id',$id)->first();


        $response['status'] = "success";
        $response['massage'] = "Get Data successfully";
        $response['data'] = $data;

        return $response;
    }
}
