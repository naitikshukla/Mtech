import requests
from bs4 import BeautifulSoup

base_url = "https://www.iss.nus.edu.sg/about-us/iss-team/"
urls = ['management','centres-of-excellence','practice-chiefs','graduate-programme-chiefs','teaching-staff','administration-staff','adjunct-staff']
urls_new = []

f = open("iss-staff-list.csv","w+")
header = 'Name, Title, Program\n'
f.write(header)

for url in urls:
	gen_url=base_url+url
	print("generated URL",gen_url)
	html = requests.get(gen_url)
	soup = BeautifulSoup(html.content,'html.parser')	# Converts to parse tree
	container = soup.find("div", id="ISS_Main_T467AEC33012_Col00")

'''	for link in soup.find_all('a'):				#To find all links in page
		print(link.get('href'))
'''
	names = container.findAll('h2')						#Find names with h2 heading
	titles= container.findAll('h3')						#Find titles with h3 heading
	email=container.find_all({'my-email'})
	
	titles2= titles[::2]								#Take alternate records from data as null lines were coming
	titles3=[]			
	for title in titles2:			
		t=title.text.replace(",", " ")					#To replace "," in data to space
		titles3.append(t)
	num = len(titles3)
	pages = container.findAll("i")
	for p in pages: 
		print("pages total",p.text.strip())
		if int(p.text.strip())>1:
			for i in range(int(p.text.strip())+1):
				if i==1 or i==0: continue
				urls_new.append(url+'/'+str(i))
	print("============================================")
	for i in range(num):
		print(names[i].text.strip())					#Strip all extra white characters
		print(titles3[i])
		print(email[i]['data-user']+'@'+email[i]['data-domain'])
		f.write(names[i].text.strip()+','+titles3[i]+','+url+','+email[i]['data-user']+'@'+email[i]['data-domain']+'\n')
	print("--------------------------------------------")
print(urls_new)
if urls_new:
	for url in urls_new:
		gen_url=base_url+url
		print("new generated url",gen_url)
		html = requests.get(gen_url)
		soup=BeautifulSoup(html.content,'html.parser')
		container = soup.find("div",id="ISS_Main_T467AEC33012_Col00")
		
		names=container.findAll('h2')
		titles=container.findAll('h3')
		titles2= titles[::2]				
		titles3=[]			
		for title in titles2:
			t=title.text.replace(",", " ")	
			titles3.append(t)
		num = len(titles3)
		print("============================================")
		for i in range(num):
			print(names[i].text.strip())					#Strip all extra white characters
			print(titles3[i])
			print(email[i]['data-user']+'@'+email[i]['data-domain'])
			f.write(names[i].text.strip()+','+titles3[i]+','+url+','+email[i]['data-user']+'@'+email[i]['data-domain']+'\n')
		print("--------------------------------------------")
f.close();
