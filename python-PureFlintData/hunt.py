import requests
url = "https://mhacks-hunt-spring-2016.herokuapp.com/hotel"
params = {"token":"KzE0MTk2OTk5ODI1"}
headers = {'content-type': 'application/json'}
r = requests.post(url, json=params, headers=headers)
print(r.json())
code = r.status_code
while code == 200:
    url = r.json()["url"]+"?token="
    token = r.json()["token"]
    url = url + token
    r = requests.get(url)
    code = r.status_code
    print(r.json())
    