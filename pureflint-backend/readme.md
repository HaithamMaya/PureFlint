## PureFlint Backend

#### Heartbeat:
[GET] /api/v0.1/heartbeat

#### User:
##### [POST] /api/v0.1/user/exists

Parameters:
- email (required: email format)

```javascript
{
  "status": "OK",
  "response": "User found."
}
```

##### [POST] /api/v0.1/user/login

Parameters:
- email (required: email format)
- password (min: 8 char, max: 16 char)

```javascript
{
  "status": "OK",
  "response": "User successfully found.",
  "user": {
    "id": 1,
    "name": "Jay Ravaliya",
    "email": "jr123@gmail.com",
    "role_id": "1",
    "created_at": "2016-02-20 06:04:40",
    "updated_at": "2016-02-20 07:03:43"
  },
  "token": "<USERTOKEN>"
}
```

##### [POST] /api/v0.1/user/register

Parameters:
- name
- email (required: email format)
- password (min: 8 char, max: 16 char)
- role_id (integer)
 - 1: Public
 - 2: Reporter
 - 3: Admin

```javascript
{
  "status": "OK",
  "response": "User registered successfully!",
  "user": {
    "name": "Jay Ravaliya",
    "email": "jr123@gmail.com",
    "role_id": "1",
    "updated_at": "2016-02-20 07:04:36",
    "created_at": "2016-02-20 07:04:36",
    "id": 1
  },
  "token": "<USERTOKEN>"
}
```

##### [POST] /api/v0.1/water/create

Parameters:
- [required] address
- [optional] water_source
- [optional] water_test_kit_type
- [optional] water_filter_type
- [optional] water_usage
- [optional] copper_ppb [integer]
- [optional] lead_ppb [integer]
- [optional] date_of_test [datetime (YYYY-MM-DD HH:MM:SS)]

```javascript
{
  "status": "OK",
  "response": "Data has been added.",
  "user": {
    "id": 1,
    "name": "JR",
    "email": "jr123@gmail.com",
    "role_id": 1,
    "created_at": "2016-02-20 20:40:41",
    "updated_at": "2016-02-20 20:40:41",
    "water_lead": [
      {
        "id": 1,
        "address": "27 Hinchman Ave, Wayne, NJ 07470, USA",
        "zip_code": "07470",
        "latitude": 40.9507,
        "longitude": -74.2243,
        "water_source": "my source!",
        "water_test_kit_type": null,
        "water_filter_type": null,
        "water_usage": null,
        "copper_ppb": 0,
        "lead_ppb": 10,
        "g_place_id": "ChIJEQTUyYYCw4kRooaFgTfWEq4",
        "user_id": 1,
        "date_of_test": "2016-02-20 15:43:51",
        "created_at": "2016-02-20 15:43:51",
        "updated_at": "2016-02-20 15:43:51"
      },
      {
        "id": 3,
        "address": "27 Hinchman Ave, Wayne, NJ 07470, USA",
        "zip_code": "07470",
        "latitude": 40.9507,
        "longitude": -74.2243,
        "water_source": "my source!",
        "water_test_kit_type": null,
        "water_filter_type": null,
        "water_usage": null,
        "copper_ppb": 0,
        "lead_ppb": 10,
        "g_place_id": "ChIJEQTUyYYCw4kRooaFgTfWEq4",
        "user_id": 1,
        "date_of_test": "2016-02-20 15:45:38",
        "created_at": "2016-02-20 15:45:38",
        "updated_at": "2016-02-20 15:45:38"
      }
    ]
  },
  "data": {
    "address": "27 Hinchman Ave, Wayne, NJ 07470, USA",
    "water_source": "my source!",
    "lead_ppb": "10",
    "latitude": 40.950656,
    "longitude": -74.224331,
    "g_place_id": "ChIJEQTUyYYCw4kRooaFgTfWEq4",
    "zip_code": "07470",
    "user_id": 1,
    "updated_at": "2016-02-20 15:45:38",
    "created_at": "2016-02-20 15:45:38",
    "id": 3
  },
  "google_result": {
    "results": [
      {
        "address_components": [
          {
            "long_name": "27",
            "short_name": "27",
            "types": [
              "street_number"
            ]
          },
          {
            "long_name": "Hinchman Avenue",
            "short_name": "Hinchman Ave",
            "types": [
              "route"
            ]
          },
          {
            "long_name": "Wayne",
            "short_name": "Wayne",
            "types": [
              "locality",
              "political"
            ]
          },
          {
            "long_name": "Passaic County",
            "short_name": "Passaic County",
            "types": [
              "administrative_area_level_2",
              "political"
            ]
          },
          {
            "long_name": "New Jersey",
            "short_name": "NJ",
            "types": [
              "administrative_area_level_1",
              "political"
            ]
          },
          {
            "long_name": "United States",
            "short_name": "US",
            "types": [
              "country",
              "political"
            ]
          },
          {
            "long_name": "07470",
            "short_name": "07470",
            "types": [
              "postal_code"
            ]
          }
        ],
        "formatted_address": "27 Hinchman Ave, Wayne, NJ 07470, USA",
        "geometry": {
          "location": {
            "lat": 40.950656,
            "lng": -74.224331
          },
          "location_type": "ROOFTOP",
          "viewport": {
            "northeast": {
              "lat": 40.952004980291,
              "lng": -74.222982019708
            },
            "southwest": {
              "lat": 40.949307019708,
              "lng": -74.225679980291
            }
          }
        },
        "place_id": "ChIJEQTUyYYCw4kRooaFgTfWEq4",
        "types": [
          "street_address"
        ]
      }
    ],
    "status": "OK"
  }
}
```

##### [GET] /api/v0.1/water/samples/list
```javascript
{
  "status": "OK",
  "response": [
    {
      "id": 1,
      "address": "1930 Colchester Rd, Flint, MI 48503, USA",
      "zip_code": "48503",
      "latitude": "42.9941",
      "longitude": "-83.7238",
      "water_source": null,
      "water_test_kit_type": null,
      "water_filter_type": null,
      "water_usage": null,
      "copper_ppb": "0",
      "lead_ppb": "0",
      "g_place_id": "ChIJ44izwHx4I4gRxDE2_WasxTw",
      "user_id": "1",
      "date_of_test": "2015-09-25 11:07:30",
      "created_at": "2016-02-20 17:04:06",
      "updated_at": "2016-02-20 17:04:06",
      "user": {
        "id": 1,
        "name": "blah2",
        "email": "blah234445@gmail.com",
        "role_id": "1",
        "created_at": "2016-02-20 06:04:40",
        "updated_at": "2016-02-20 07:03:43"
      }
    },
    {
      "id": 2,
      "address": "Flint, MI 48503, USA",
      "zip_code": "48503",
      "latitude": "43.0146",
      "longitude": "-83.6721",
      "water_source": null,
      "water_test_kit_type": null,
      "water_filter_type": null,
      "water_usage": null,
      "copper_ppb": "0",
      "lead_ppb": "0",
      "g_place_id": "ChIJz6AiBBCCI4gRfkOCDX0_z4s",
      "user_id": "1",
      "date_of_test": "2015-09-29 14:35:09",
      "created_at": "2016-02-20 17:04:06",
      "updated_at": "2016-02-20 17:04:06",
      "user": {
        "id": 1,
        "name": "blah2",
        "email": "blah234445@gmail.com",
        "role_id": "1",
        "created_at": "2016-02-20 06:04:40",
        "updated_at": "2016-02-20 07:03:43"
      }
    }
  ]
}
```

##### [GET] /api/v0.1/water/samples/list/{id}

Parameters:
- id: primary key OR Google Places ID

```javascript
{
  "status": "OK",
  "response": [
    {
      "id": 1,
      "address": "1930 Colchester Rd, Flint, MI 48503, USA",
      "zip_code": "48503",
      "latitude": "42.9941",
      "longitude": "-83.7238",
      "water_source": null,
      "water_test_kit_type": null,
      "water_filter_type": null,
      "water_usage": null,
      "copper_ppb": "0",
      "lead_ppb": "0",
      "g_place_id": "ChIJ44izwHx4I4gRxDE2_WasxTw",
      "user_id": "1",
      "date_of_test": "2015-09-25 11:07:30",
      "created_at": "2016-02-20 17:04:06",
      "updated_at": "2016-02-20 17:04:06",
      "user": {
        "id": 1,
        "name": "blah2",
        "email": "blah234445@gmail.com",
        "role_id": "1",
        "created_at": "2016-02-20 06:04:40",
        "updated_at": "2016-02-20 07:03:43"
      }
    }
  ]
}
```