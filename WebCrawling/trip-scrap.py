#https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-Reviews-or860-InterContinental_Singapore-Singapore.html	page1
#https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-Reviews-or5-InterContinental_Singapore-Singapore.html		page2
#https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-Reviews-or10-InterContinental_Singapore-Singapore.html		page3

import requests
from bs4 import BeautifulSoup

url1="https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-"
url2="Reviews-InterContinental_Singapore-Singapore.html"
gen_url = url1+url2
url_list=[]

html = requests.get(gen_url)
soup = BeautifulSoup(html.content,'html.parser')		# Converts to parse tree
container = soup.find("div", id="taplc_location_reviews_list_hotels_0")

tot_page = container.find_all("span",class_="pageNum last taLnk ")		#Search with class where final page number is present
fin = 0
for page in tot_page:
	fin=int(page.text)									#Store value of final page into fin variable

if fin!=0:												#If more than 1 pages review present
	for f in range(fin):
		if f==0: continue
		url_list.append('or'+str(f*5)+'-')				# Create a list of string need to be added in URL
	#print(url_list)
	
	for url_mid in url_list:
		gen_url=url1+url_mid+url2						#Create all URL's for review
		print(gen_url)
else:
	url_list.append(url1+url2)							#If only 1 page review is there then home page will do work
