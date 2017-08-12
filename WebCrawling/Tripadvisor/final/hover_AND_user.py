# -*- coding: utf-8 -*-
#######################################################################################################################################
####			Script for extracting detail of user commented when did hover also all their comments(recent 50)                        #####
####	Output File Name : profile-hover1.txt,trip-Sentosa_user_review1.txt					Pipe Separated(|)			                          #####
####	Output Format: 'Badge| Since| From| Contributions| Cities Visited| Helpful| Photos| Travelstyle|UID| Username| profile URL'	#####
####             AND 'username| UID| reviewCategory| where| rating| title| review ID| Content'                                    #####
####			Created by: Naitik Shukla		ON:8/9/2017		Version(1.3)														                                      #####
#######################################################################################################################################

import re
import requests
from bs4 import BeautifulSoup
import time

def hover_profile(f,member,g):
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
			if tr_style_len == 0: f.write(u'None'.encode('utf8'))				# If no 7th entry(Style) write None
			else:
				style=''
				for j in range(tr_style_len):
					if j == tr_style_len -1: style=style+str(Travelstyle[j])	# For final entry no comma on last
					else: style=style+str(Travelstyle[j])+','					# For all other comma after values append
				f.write(style.encode('utf8'))													# Write the 7th column for styles
		else: dta1=str(lis[i])+'|' ; f.write(dta1.encode('utf8'))											# Write all other 0 to 6 columns
	
	dta2='|'+str(uid)+'|'+str(username)+'|'
	f.write(dta2.encode('utf8'))							#Write UserId and Username on first 2 columns
	dta3=str(new_url)+'\n'
	f.write(dta3.encode('utf8'))												# Write Link for user profile
	
	#extract_profile(g,complete_new_URL,uid,username)
	#'''
	try:
		extract_profile(g,complete_new_URL,uid,username)												#Call function to extract all details for user reviews
	except:
		print("extract profile fails")
	#'''
	
def extract_review(url_link):																						#Function to go into full review extract
	#print("inside extract review")
	gen_url_link = 'https://www.tripadvisor.com.sg'+str(url_link)														#Completeing URL
	html_rev = requests.get(gen_url_link)
	soup_rev = BeautifulSoup(html_rev.content,"html.parser")
	if soup_rev.find('p',property="reviewBody"):
		message = soup_rev.find('p',property="reviewBody").text.strip('\n')
		review_id = soup_rev.find('p',property="reviewBody")['id']
	else: message='None';review_id='None'
	
	return message,review_id

def extract_profile(g,link,uid,username):
	#username ="billCarmel_NewYork"
	
	html = requests.get(link)
	soup = BeautifulSoup(html.content,"html.parser")
	
	rev = [None]*8																										#None List of 8 length
	other = []
	rev[0]= username																									#0 place in list for Username
	rev[1]= uid																											#1 place for UID received
	for info in soup.find_all('li',class_="cs-review"):
	
		if info.find('div', class_='cs-review-location'): rev[3]= info.find('div', class_='cs-review-location').text	#Location
		
		if info.find('span', class_='ui_bubble_rating bubble_1'): rev[4]='1'						#					Conditions for Rating
		elif info.find('span', class_='ui_bubble_rating bubble_2'): rev[4]='2'
		elif info.find('span', class_='ui_bubble_rating bubble_3'): rev[4]='3'
		elif info.find('span', class_='ui_bubble_rating bubble_4'): rev[4]='4'
		elif info.find('span', class_='ui_bubble_rating bubble_5'): rev[4]='5'
		
		if info.find('div', class_='cs-type-hint sprite-feedRestaurant'): rev[2]="Restaurant"							#Category of Review
		elif info.find('div', class_='cs-type-hint sprite-feedAttraction'): rev[2]='Attractions'
		elif info.find('div', class_='cs-type-hint sprite-feedHotel'): rev[2]='Hotel'
	
		if info.find('a', class_='cs-review-title') : rev[5]= info.find('a', class_='cs-review-title').text.strip('\n')	#Review Title
		
		print("++++++++++++++++++++++")
		
		if info.find('a', class_='cs-review-title') :
			a = info.find('a', class_='cs-review-title')
			full_review_link =a['href']											# Getting full review link from <a> tag with "href" attribute
			full_review_text,review_id = extract_review(full_review_link)		#Call function to extract full review he provided
			rev[6] = str(review_id)
			rev[7] = str(full_review_text).replace("\n"," ")#.replace("\u015f"," ")
		dta=str(rev[0])+'|'+str(rev[1])+'|'+str(rev[2])+'|'+str(rev[3])+'|'+str(rev[4])+'|'+str(rev[5])+'|'+str(rev[6])+'|'+str(rev[7])+'\n'
		g.write(dta.encode('utf8'))	#+'|'+str(other)

def main(url):
	html = requests.get(url)
	soup = BeautifulSoup(html.content,"html.parser")
	
	# For hover File
	if (url =="https://www.tripadvisor.com.sg/Attraction_Review-g294264-d2439664-Reviews-Universal_Studios_Singapore-Sentosa_Island.html#REVIEWS"):
		f = open("profile-hover.txt","wb+")								# Create File for User Profile Details
		g = open("trip-Sentosa_user_review.txt","wb+")
		header_hover = u'Badge| Since| From| Contributions| Cities Visited| Helpful| Photos| Travelstyle|UID| Username| profile URL\n'
		header_user = u'username| UID| reviewCategory| where| rating| title| review ID| Content\n'
		f.write(header_hover.encode('utf8'))
		g.write(header_user.encode('utf8'))
	else:
		f = open("profile-hover1.txt","ab+")								# Create File for User Profile Details
		g = open("trip-Sentosa_user_review1.txt","ab+")					# For user reviews
	
	members = soup.find_all('div',class_="memberOverlayLink")		# Div when Hover over User Profile will be done
	members = members[::2]
	#print(members)
	
	
	for member in members:											# ALL users entry on Page
		#hover_profile(f,member,g)
		#'''
		try:
			hover_profile(f,member,g)									# Call function to write hover in file
		except:
			print("hover details extraction Failed, in new-scrap2.py")
		#'''
	f.close()														# Close connection for hover File
	g.close()														# Close connection for user review File
	

	
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
	
	#print('Range is :',range(fin))
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
	print("Total Pages: ",len(gen_url_list))
	for new_url in gen_url_list[1172:1173:]:
		print("Scraping current URL: ", new_url,"\n")
		#new_url = "https://www.tripadvisor.com.sg/Attraction_Review-g294264-d2439664-Reviews-Universal_Studios_Singapore-Sentosa_Island.html#REVIEWS"
		main(new_url)
		#time.sleep(2)
