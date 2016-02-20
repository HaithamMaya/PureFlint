## PureFlint Backend

#### Heartbeat:
[GET] /api/v0.1/heartbeat

#### User:
[POST] /api/v0.1/user/exists

Parameters:
- email (required: email format)

```javascript
{
  "status": "OK",
  "response": "User found."
}
```

[POST] /api/v0.1/user/login

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

[POST] /api/v0.1/user/register

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
