<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\User;
use App\WaterLead;
use Validator;
use URL;
use Response;
use Illuminate\Support\Facades\Input;

use GuzzleHttp\Client;

class WaterLeadController extends Controller
{
    // Adds new data
    public function create(Request $request) {
        $user = User::where('token', $request->token)->with('waterLead')->first();

        $validator = Validator::make($request->all(), [
            'address' => 'required'
        ]);

        if($validator->fails()) {
            return Response::json([
                "status" => "NOT_OK",
                "response" => "Required fields: address"
            ], 400);
        }

        $client = new \GuzzleHttp\Client();
        $res = $client->request('GET', 'https://maps.googleapis.com/maps/api/geocode/json', [
            'query' => 
                [
                    "address" => $request->address,
                    "key" => getenv("GOOGLE_API_KEY")
                ]
        ]);
        $data = new WaterLead;
        $data->fill(Input::all());
        $google_places = json_decode($res->getBody(), true);

        if(array_key_exists("status", $google_places) && $google_places["status"] == "OK") {
            $data->latitude = floatval($google_places['results'][0]['geometry']['location']['lat']);
            $data->longitude = floatval($google_places['results'][0]['geometry']['location']['lng']);
            $data->g_place_id = $google_places['results'][0]['place_id'];
            foreach($google_places["results"][0]["address_components"] as $component) {
                if(in_array("postal_code", $component["types"])) {
                    $data->zip_code = $component['long_name'];
                }
            }
            $data->address = $google_places['results'][0]['formatted_address'];
        }
        
        $user->waterLead()->save($data);
        return Response::json([
            "status" => "OK",
            "response" => "Data has been added.",
            "user" => User::where('token', $request->token)->with('waterLead')->first(),
            "data" => $data,
            "google_result" => $google_places
        ], 200);
    }

    public function getAllSamples(Request $request) {
        return Response::json([
            "status" => "OK",
            "response" => WaterLead::with('user')->get()
        ], 200);
    }

    public function getSample(Request $request) {
        $validator = Validator::make($request->all(), [
            "id" => "require"
        ]);

        if($validator->fails()) {
            return Response::json([
                "status" => "NOT_OK",
                "response" => "Required fields: id"
            ], 200);
        }

        if(is_numeric($request->id)) {
            $field = "id";
        }
        else {
            $field = "g_place_id";
        }

        return Response::json([
            "status" => "OK",
            "response" => WaterLead::with('user')->where($field, $request->id)->first()
        ], 200);
    }

}
