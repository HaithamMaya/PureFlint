import sys
import mysql.connector
import requests

cnx = mysql.connector.connect(user="root", password="", host="localhost", database="pureflint")
cursor = cnx.cursor()

def get_token():
	params = {
		'client_id': "MIzxpP3QQ79ft7LX",
		'client_secret': "4aae2e24ea894ebb8070c89282469160",
		'grant_type': "client_credentials"
	}

	request = requests.get('https://www.arcgis.com/sharing/oauth2/token', params=params)
	response = request.json()
	token = response["access_token"]
	return token

#token = get_token()
#print(token)

cursor.execute("SELECT * FROM water_lead_data");
data = cursor.fetchall()

for row in data:
	print row


	parameters = { 
		"features" : "[ {'geometry': { 'x' : " + str(row[3]) + ", 'y' : " + str(row[4]) + " },  'attributes' : { 'address' : '" + str(row[1]) + "', 'date_of_record' : '" + str(row[13]) + "', 'lead_ppb' : '" + str(row[10]) + "', 'copper_ppb' : '" + str(row[9]) + "' }   }   ]",  
		"f" : "pjson",
		"token" : get_token()
	}

	request = requests.post('http://services3.arcgis.com/QLALaFxTfb4MtXSB/ArcGIS/rest/services/Flint_Lead_and_Copper_Water_Exposure/FeatureServer/0/addFeatures',params = parameters)
	print(request.json())
