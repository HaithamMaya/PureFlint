import requests
def get_token():
   params = {
       'client_id': "MIzxpP3QQ79ft7LX",
       'client_secret': "4aae2e24ea894ebb8070c89282469160",
       'grant_type': "client_credentials"
   }

   request = requests.get('https://www.arcgis.com/sharing/oauth2/token',
                          params=params)
   response = request.json()
   token = response["access_token"]
   return token

token = get_token()
print(token)
parameters = { 
   "features" : "[ {'geometry': { 'x' : 43.0062, 'y' : -83.7316 },  'attributes' : {}   }   ]",  
   "f" : "pjson",
   "token" : token
}
request = requests.post('http://services3.arcgis.com/QLALaFxTfb4MtXSB/ArcGIS/rest/services/Flint_Lead_and_Copper_Water_Exposure/FeatureServer/0/addFeatures',params = parameters)
print(request.json())