<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['prefix' => '/api/v0.1'], function() {

    // heartbeat
	Route::get('heartbeat', "BaselineController@heartbeat");

    // user login
    Route::group(['prefix' => 'user'], function() {
        Route::post('exists', "UserController@exists");
        Route::post('register', "UserController@register");
        Route::post('login', "UserController@login");
    });

    Route::group(['middleware' => 'pureflint'], function() {
        Route::group(['prefix' => 'water'], function() {
            Route::post('create', "WaterLeadController@create");
            Route::get('samples/list', "WaterLeadController@getAllSamples");
            Route::get('samples/list/{id}', "WaterLeadController@getSample");
        });
    });
    

});

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    //
    Route::get('web/heatmap', function() {
        return View::make('heatmap', ['points' => App\WaterLead::all()]);
    });
});
