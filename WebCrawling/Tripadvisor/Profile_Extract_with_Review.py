#########################################################################################################
####			Script for extracting Reviews done by a user.										#####
####	Output File Name : trip-Sentosa_user_review.txt,		Pipe Separated(|)					#####
####	Output Format: 'username| UID| reviewCategory| where| rating| title| review ID| Content'	#####
####			Created by: Naitik Shukla		ON:8/9/2017		Version(1.0)						#####
#########################################################################################################

import requests
from bs4 import BeautifulSoup
import re

def extract_review(url_link):																						#Function to go into full review extract
	#print("inside extract review")
	gen_url_link = 'https://www.tripadvisor.com.sg'+str(url_link)														#Completeing URL
	html_rev = requests.get(gen_url_link)
	soup_rev = BeautifulSoup(html_rev.content,"html.parser")
	message = soup_rev.find('p',property="reviewBody").text.strip('\n')
	review_id = soup_rev.find('p',property="reviewBody")['id']
	return message,review_id

def extract_profile(link,uid):
	username ="billCarmel_NewYork"
	
	html = requests.get(url)
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
			rev[7] = str(full_review_text)
	
		g.write(str(rev[0])+'|'+str(rev[1])+'|'+str(rev[2])+'|'+str(rev[3])+'|'+str(rev[4])+'|'+str(rev[5])+'|'+str(rev[6])+'|'+str(rev[7])+'\n')	#+'|'+str(other)
	

if __name__ == "__main__":
	url="https://www.tripadvisor.com.sg/members-reviews/billCarmel_NewYork"		#Currently hardcoded url
	uid='80C16101FB4733C8E3747B5B47A08E4D'										#uid need to be provided from previous call
	
	g = open("trip-Sentosa_user_review.txt","w+")							
	header = 'username| UID| reviewCategory| where| rating| title| review ID| Content\n'
	g.write(header)
	
	
	try:
		extract_profile(url,uid)												#Call function to extract all details
	except:
		print("extract profile fails")
	
	g.close()
