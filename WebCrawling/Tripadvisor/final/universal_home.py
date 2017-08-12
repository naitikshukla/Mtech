# -*- coding: utf-8 -*-
###################################################################################################################
####			Script for extracting Reviews on Home page of Universal Studios														          #####
####	Output File Name : trip-universal.txt,					Pipe Separated(|)													              #####
####	Output Format: 'Name | Location | Date | Review Title | Ratings | UID | Review Text'										#####
####			Created by: Naitik Shukla		ON:8/12/2017		Version(1.1)													                  #####
###################################################################################################################

import requests
from bs4 import BeautifulSoup
import re

def getReview(rev_link,id):
	base="https://www.tripadvisor.com.sg"
	full_review_url=base+rev_link
	print("Now processing review URL:",full_review_url)
	html = requests.get(full_review_url)
	soup = BeautifulSoup(html.content,'html.parser')
	container = soup.find("p", id="review_"+str(id))
	#print(len(container))
	text = container.text.replace(',','/001').strip()
	return text
	
	
url1="https://www.tripadvisor.com.sg/Attraction_Review-g294264-d2439664-Reviews-"
url2="Universal_Studios_Singapore-Sentosa_Island.html#REVIEWS"
gen_url = url1+url2
url_list=[]
gen_url_list=[]

f = open("trip-universal.txt","wb+")
header = u'Name | Location | Date | Review Title | Ratings | UID | Review Text\n'
f.write(header.encode('utf8'))

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
	#print(url_list)
		else: url_list.append('or'+str(fi*10)+'-')				# Create a list of string need to be added in URL
	
	for url_mid in url_list:
		gen_url=url1+url_mid+url2						#Create all URL's for review
		gen_url_list.append(gen_url)
		#print(gen_url)
else:
	gen_url_list.append(url1+url2)							#If only 1 page review is there then home page will do work

#for i in gen_url_list: print(i)

for url in gen_url_list[:4:]:
	print("processing url: ",url,"\n")
	html = requests.get(url)
	soup = BeautifulSoup(html.content,'html.parser')		# Converts to parse tree
	container = soup.find("div", id="taplc_location_reviews_list_0")			#Find bigger container holding all reviews
	review_cont = container.find_all("div",class_="review-container")		#Find individual container having reviews on page
	#print(len(review_cont))
	
	# Name | Location | Date | Review Title | Ratings  
	for review in review_cont:
		review_list=['None']*6
		if review.find("span",class_='expand_inline scrname'): review_list[0]=review.find("span",class_='expand_inline scrname').text
		if review.find('span',class_="expand_inline userLocation"): review_list[1]=review.find("span",class_='expand_inline userLocation').text.replace(',','-')
		if review.find('span',class_="ratingDate relativeDate"): review_list[2]=review.find('span',class_="ratingDate relativeDate")['title']
		if review.find('span',class_="noQuotes"): review_list[3]=review.find('span',class_="noQuotes").text.replace(',',' ')
		
		if review.find('span',class_=re.compile('bubble_50')): review_list[4] = '5'
		elif review.find('span',class_=re.compile('bubble_40')): review_list[4] = '4'
		elif review.find('span',class_=re.compile('bubble_30')): review_list[4] = '3'
		elif review.find('span',class_=re.compile('bubble_20')): review_list[4] = '2'
		elif review.find('span',class_=re.compile('bubble_10')): review_list[4] = '1'
		#for p in review_list:print(p)
		
		member = review.find('div',class_="memberOverlayLink")		# For UID
		empty,uid,src=re.split('UID_|-|-SRC_',member['id'])
		review_list[5] = uid
		
		Review_link = review.find("a",href=re.compile('ShowUserReviews'))['href']		#Getting link for complete review from title
		Review_id = review.find("a",href=re.compile('ShowUserReviews'))['id']			#rn511397830
		Review_id=int(re.search(r'\d+', Review_id).group())							#511397830		-	extracting only numbers
		#print(Review_id)
		review_text = getReview(Review_link,Review_id)
		#print(review_text)
		f.write(review_list[0]+'|'+review_list[1]+'|'+review_list[2]+'|'+review_list[3]+'|'+review_list[4]+'|'+review_list[5]+'|'+review_text+'\n'.encode('utf8'))
		
f.close()
