## PureFlint Backend

#### Heartbeat:
[GET] /api/v0.1/heartbeat

#### User:
[POST] /api/v0.1/user/exists
Parameters:
- email (required: email format)

[POST] /api/v0.1/user/login
Parameters:
- email (required: email format)
- password (min: 8 char, max: 16 char)

[POST] /api/v0.1/user/register
Parameters:
- name
- email (required: email format)
- password (min: 8 char, max: 16 char)
- role_id (integer)
 - 1: Analyst
 - 2: Public
 - 3: Reporter


