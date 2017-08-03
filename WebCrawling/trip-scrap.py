#url="https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-Reviews-or10-InterContinental_Singapore-Singapore.html"
import requests
from bs4 import BeautifulSoup
import re

url1="https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-"
url2="Reviews-InterContinental_Singapore-Singapore.html"
gen_url = url1+url2
url_list=[]
gen_url_list=[]
f = open("trip-InterContinental.csv","w+")
header = 'Screen Name, date, Location, #Likes, #Level, Title, Stars\n'
f.write(header)

html = requests.get(gen_url)
soup = BeautifulSoup(html.content,'html.parser')		# Converts to parse tree
container = soup.find("div", id="taplc_location_reviews_list_hotels_0")

tot_page = container.find_all("span",class_="pageNum last taLnk ")		#Search with class where final page number is present
fin = 0
for page in tot_page:
	fin=int(page.text)									#Store value of final page into fin variable

if fin!=0:												#If more than 1 pages review present
	for fi in range(fin):
		if fi==0: url_list.append('');continue
		url_list.append('or'+str(fi*5)+'-')				# Create a list of string need to be added in URL
	#print(url_list)
	
	for url_mid in url_list:
		gen_url=url1+url_mid+url2						#Create all URL's for review
		gen_url_list.append(gen_url)
		#print(gen_url)
else:
	url_list.append(url1+url2)							#If only 1 page review is there then home page will do work

#print(gen_url_list[:10:])
for url in gen_url_list[:25:]:
	print("processing url: ",url)
	html = requests.get(url)
	soup = BeautifulSoup(html.content,'html.parser')		# Converts to parse tree
	container = soup.find("div", id="taplc_location_reviews_list_hotels_0")
	
	date = container.find_all('span',class_="ratingDate relativeDate")
	rev_head = container.find_all('span',class_='noQuotes')
	scrn_nm = container.find_all('span',class_='expand_inline scrname')
	usr_location = container.find_all('span',class_="expand_inline userLocation")
	level = container.find_all('span',class_="badgetext")
	comment = container.find_all('div',class_="prw_rup prw_reviews_text_summary_hsx")
	badge = level[::2]
	del level[::2]
	classs=container.find_all('span',class_=re.compile("ui_bubble_rating"))
	
	dateL=[]
	for dates in date:
		dateL.append(dates['title'])
		#print(dates['title'])
	#print(len(dateL))
	
	location=[]
	for lctn in usr_location:			
		t=lctn.text.replace(",", "-")					#To replace "," in data to space
		location.append(t)
	
	titl=[]
	for tit in rev_head:
		ti = tit.text.replace(","," ")
		titl.append(ti)
	cls1=[]
	for cls in classs:
		if 'bubble_50' in cls['class']: cls1.append('5')
		elif 'bubble_40' in cls['class']: cls1.append('4')
		elif 'bubble_30' in cls['class']: cls1.append('3')
		elif 'bubble_20' in cls['class']: cls1.append('2')
		elif 'bubble_10' in cls['class']: cls1.append('1')
		else: cls1.append('0')
	
	
	if len(dateL)==len(usr_location) and len(dateL)==len(cls1) and len(dateL)==len(level):
		for i in range(len(dateL)):
			#print("name:",scrn_nm[i].text)
			#print("date:",dateL[i])
			#print("Location:",location[i])
			#print("Likes:",level[i].text)
			#print("Level:",badge[i].text)
			#print("Title:",titl[i])
			#print("Star:",cls1[i])
			#print("----------------------------------------")
			f.write(scrn_nm[i].text+','+dateL[i]+','+location[i]+','+level[i].text+','+badge[i].text+','+titl[i]+','+str(cls1[i])+'\n')
	else: print("not equal on page:")
	if len(dateL)!=len(usr_location): print("location not present")
	elif len(dateL)!=len(cls1): print("no stars")
	elif len(dateL)!=len(level): print("Likes not present")
	else: continue
	print("-----------------------------------")
f.close()
