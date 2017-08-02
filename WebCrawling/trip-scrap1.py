url="https://www.tripadvisor.com.sg/Hotel_Review-g294265-d299199-Reviews-InterContinental_Singapore-Singapore.html"
import requests
from bs4 import BeautifulSoup
html = requests.get(url)
soup = BeautifulSoup(html.content,'html.parser')		# Converts to parse tree
container = soup.find("div", id="taplc_location_reviews_list_hotels_0")

date = container.find_all('span',class_="ratingDate relativeDate")
rev_head = container.find_all('span',class_='noQuotes')
scrn_nm = container.find_all('span',class_='expand_inline scrname')
usr_location = container.find_all('span',class_="expand_inline userLocation")		#remove comma
level = container.find_all('span',class_="badgetext")
comment = container.find_all('div',class_="prw_rup prw_reviews_text_summary_hsx")

dateL=[]
for dates in date:
	dateL.append(dates['title'])
	print(dates['title'])
print(len(dateL))

for head in rev_head: print(head.text)
for nm in scrn_nm: print(nm.text)
for lctn in usr_location: print(lctn.text)
#for badge in level: print(badge.text)
badge = level[::2]
for i in badge: print(i.text)		#badges
del level[::2]
for j in level: print(j.text)
for cmt in comment: print(cmt)
