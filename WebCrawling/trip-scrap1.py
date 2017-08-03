url="https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-Reviews-or10-InterContinental_Singapore-Singapore.html"
import requests
from bs4 import BeautifulSoup
import re
html = requests.get(url)
soup = BeautifulSoup(html.content,'html.parser')		# Converts to parse tree
container = soup.find("div", id="taplc_location_reviews_list_hotels_0")

f = open("trip-InterContinental.csv","w+")
header = 'Screen Name, date, Location, #Likes, #Level, Title, Stars\n'
f.write(header)

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
	dateL.append(dates['title'])					#Get Dates from tags
	#print(dates['title'])
print(len(dateL))

location=[]
for lctn in usr_location:			
	t=lctn.text.replace(",", "-")					#To replace "," in data to "-"
	location.append(t)
	
cls1=[]
for cls in classs:
	if 'bubble_50' in cls['class']: cls1.append('5')		#To extract meaning from class
	elif 'bubble_40' in cls['class']: cls1.append('4')
	elif 'bubble_30' in cls['class']: cls1.append('3')
	elif 'bubble_20' in cls['class']: cls1.append('2')
	elif 'bubble_10' in cls['class']: cls1.append('1')
	else: cls1.append('0')

titl=[]
for tit in rev_head:
	ti = tit.text.replace(","," ")					#replace comma from title to space
	titl.append(ti)

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
		f.write(scrn_nm[i].text+','+dateL[i]+','+location[i]+','+level[i].text+','+badge[i].text+','+titl[i]+','+cls1[i]+'\n')
else: print("not equal on page:",url)


f.close()
