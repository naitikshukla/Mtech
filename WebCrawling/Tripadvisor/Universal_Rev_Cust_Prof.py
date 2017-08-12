#########################################################################################################################################
####			Script for extracting detail of user commented when did hover														#####
####	Output File Name : profile-hover.txt,					Pipe Separated(|)													#####
####	Output Format: 'Badge| Since| From| Contributions| Cities Visited| Helpful| Photos| Travelstyle|UID| Username| profile URL'	#####
####			Created by: Naitik Shukla		ON:8/9/2017		Version(1.3)														#####
#########################################################################################################################################


#https://www.tripadvisor.com.sg/MemberOverlay?Mode=owa&uid=B4EAFD9106B553928BFAEA7A2741CC03&c=&src=509186379&fus=false&partner=false&LsoId=&metaReferer=Attraction_Review
#<div id="UID_B4EAFD9106B553928BFAEA7A2741CC03-SRC_509186379" class="memberOverlayLink" onmouseover="widgetEvCall('handlers.initMemberOverlay', event, this);" data-anchorwidth="90"><div class="avatar profile_B4EAFD9106B553928BFAEA7A2741CC03"><div class="avatarWrapper"><a><div class="prw_rup prw_common_centered_image avatarImage" data-prwidget-name="common_centered_image" data-prwidget-init=""><span class="imgWrap  fixedAspect " style="max-width:80px;padding-bottom:100.000%;"><img src="https://media-cdn.tripadvisor.com/media/photo-l/01/2e/70/62/avatar040.jpg" id="lazyload_-693151713_11" class="centeredImg" style="" width="100%" data-mediaid="19820642"></span></div></a></div></div><div class="username mo"><span class="expand_inline scrname" onclick="ta.trackEventOnPage('Reviews', 'show_reviewer_info_window', 'user_name_name_click')">trevelyon</span></div><div class="location"><span class="expand_inline userLocation">oakland</span></div></div>
   
import re
import requests
from bs4 import BeautifulSoup
import time

def hover_profile(f,member):
	empty,uid,src=re.split('UID_|-|-SRC_',member['id'])			# id="UID_B4EAFD9106B553928BFAEA7A2741CC03-SRC_509186379" Extract using regular expression
	username = member.find('div',class_="username").text.strip()# Extract User name with Class_='username' in DIV tag
	print("*****",username,"*",uid,'*',src)						#***** JattConnoisseur * 22312C87847118B73FE810142E0A11F9 * SRC_509228234
	
	response=requests.get("https://www.tripadvisor.com.sg/MemberOverlay",params={"uid":uid})	#Request for hover url and html page	#https://www.tripadvisor.com.sg/MemberOverlay?Mode=owa&uid=B4EAFD9106B553928BFAEA7A2741CC03
	overlay=BeautifulSoup(response.content,"html.parser")
	
	new_url= overlay.find('a')['href']							# Link for complete Profile
	complete_new_URL = "https://www.tripadvisor.com.sg"+str(new_url)
	print(complete_new_URL)
	username=overlay.find('h3').text							# Username on hover page
	
	lis=[None]*7												#Create blank list with 7 None Entries(For Class="countsReviewEnhancement")
	Travelstyle=[]												#Blank List for Travel Style
	
	if overlay.find("div",{'class':'badgeinfo'}):				# For Level of User(badge)
		badge=overlay.find('div',class_="badgeinfo").text
		#print(badge)											#Level 4 Contributor
		lis[0]=badge.strip()
	
	Desc = overlay.find_all('span',class_="badgeTextReviewEnhancements")
	Desc_len = len(Desc)
	
	
	for info in overlay.find_all('li'):
		if 'member since' in info.text: 
			#print(info.text.strip('\n'))
			lis[1]=info.text.strip('\n')						#TripAdvisor member since 2008
		elif ('From' in info.text) or ('from' in info.text):
			#print(info.text.strip('\n'))
			lis[2]=info.text.strip('\n')						#From oakland
		elif ('Contributions' in info.text):
			#print(info.text.strip('\n'))
			lis[3]=info.text.strip('\n')						#74 Contributions
		elif ('Cities' in info.text):
			#print(info.text.strip('\n'))
			lis[4]=info.text.strip('\n')						#115 Cities visited
		elif ('Helpful' in info.text):
			#print(info.text.strip('\n'))
			lis[5]=info.text.strip('\n')						#35 Helpful votes
		elif ('Photos' in info.text):
			#print(info.text.strip('\n'))
			lis[6]=info.text.strip('\n')						#34 Photos
		else: Travelstyle.append(info.text.replace("\n",""))						#Urban Explorer,History Buff,Nightlife Seeker
	lis.append(Travelstyle)										# Append style on end of list (location 7)
	tr_style_len = len(Travelstyle)
	
	for i in range(len(lis)):									# 0 to 7
		if i == 7:												# Last Entry(for style) extract each element from subList(Travelstyle) and make it as string with comma separated Values
			if tr_style_len == 0: f.write('None')				# If no 7th entry(Style) write None
			else:
				style=''
				for j in range(tr_style_len):
					if j == tr_style_len -1: style=style+str(Travelstyle[j])	# For final entry no comma on last
					else: style=style+str(Travelstyle[j])+','					# For all other comma after values append
				f.write(style)													# Write the 7th column for styles
		else: f.write(str(lis[i])+'|')											# Write all other 0 to 6 columns
	
	f.write('|'+str(uid)+'|'+str(username)+'|')							#Write UserId and Username on first 2 columns
	f.write(str(new_url)+'\n')												# Write Link for user profile

def main(url):
	html = requests.get(url)
	soup = BeautifulSoup(html.content,"html.parser")
	
	# For hover File
	if (url =="https://www.tripadvisor.com.sg/Attraction_Review-g294264-d2439664-Reviews-Universal_Studios_Singapore-Sentosa_Island.html#REVIEWS"):
		f = open("profile-hover.txt","w+")								# Create File for User Profile Details
		header = 'Badge| Since| From| Contributions| Cities Visited| Helpful| Photos| Travelstyle|UID| Username| profile URL\n'
		f.write(header)
	else:
		f = open("profile-hover.txt","a+")								# Create File for User Profile Details

	members = soup.find_all('div',class_="memberOverlayLink")		# Div when Hover over User Profile will be done
	members = members[::2]
	#print(members)
	
	for member in members:											# ALL users entry on Page
		try:
			hover_profile(f,member)									# Call function to write hover in file
		except:
			print("hover details extraction Failed, in new-scrap2.py")
	f.close()														# Close connection for hover File
	

	
if __name__ == "__main__":
	url1="https://www.tripadvisor.com.sg/Attraction_Review-g294264-d2439664-Reviews-"
	url2="Universal_Studios_Singapore-Sentosa_Island.html#REVIEWS"
	gen_url = url1+url2
	url_list=[]
	gen_url_list=[]
	
	html = requests.get(gen_url)
	soup = BeautifulSoup(html.content,'html.parser')		# Converts to parse tree
	container = soup.find("div", id="taplc_location_reviews_list_0")
	
	fin = 0
	tot_page = container.find("span",class_="pageNum last taLnk ").text			#Search with class where final page number is present
	fin = int(tot_page)
	
	print('Range is :',range(fin))
	if fin!=0:												#If more than 1 pages review present
		for fi in range(fin):
			if fi==0 :continue
			elif fi==1: url_list.append('');continue
			else: url_list.append('or'+str(fi*10)+'-')				# Create a list of string need to be added in URL
		#print(url_list)
		
		for url_mid in url_list:
			gen_url=url1+url_mid+url2						#Create all URL's for review
			gen_url_list.append(gen_url)
			#print(gen_url)
	else:
		gen_url_list.append(url1+url2)							#If only 1 page review is there then home page will do work
	
	for new_url in gen_url_list[::]:
		print("Scraping current URL: ", new_url,"\n")
		#new_url = "https://www.tripadvisor.com.sg/Attraction_Review-g294264-d2439664-Reviews-Universal_Studios_Singapore-Sentosa_Island.html#REVIEWS"
		main(new_url)
		time.sleep(2)
