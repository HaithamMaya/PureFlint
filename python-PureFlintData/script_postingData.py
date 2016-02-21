import requests
import csv
from time import sleep

url = 'http://54.201.150.217/api/v0.1/water/create'
with open('flint_water_data.csv') as csvfile:
     c = csv.writer(open("output.csv", "wb"))
     reader = csv.DictReader(csvfile)
     for row in reader:
         date = row['test_date']
         address = row['address_full']  
         lead = row['lead_ppb']
         copper = row['copper_ppb']
         r = requests.post(url, data = {
             'token':'31b05b68739e8b6688bed7b2a4684645',
             'date_of_test':date,
             'address':address,
             'lead_ppb':lead, 
             'copper_ppb':copper})
        #  sleep(0.1)
         print(r.json())
         if r.status_code == 200:
            c.writerow([date, address, lead, copper, "true"])             
         else:
            c.writerow([date, address, lead, copper, "false"])        