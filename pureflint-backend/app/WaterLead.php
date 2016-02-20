<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WaterLead extends Model
{
    protected $table = 'water_lead_data';

    protected $fillable = [
        'address', 'latitude', 'longitude', 'water_source', 'water_test_kit_type', 'water_filter_type', 'water_usage', 'g_place_api', 'copper_ppb', 'lead_ppb', 'date_of_test'
    ];

    protected $guarded = [
        'id', 'created_at', 'updated_at', 'user_id'
    ];

    public function user() {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }
}