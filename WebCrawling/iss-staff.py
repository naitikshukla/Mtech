import requests
from bs4 import BeautifulSoup

base_url = "https://www.iss.nus.edu.sg/about-us/iss-team/"
urls = ['centres-of-excellence','practice-chiefs','graduate-programme-chiefs','teaching-staff','administration-staff','adjunct-staff']
#urls = ['adjunct-staff']
urls_new = []

f = open("iss-staff-list.csv","w+")
header = 'Name, Title, Program, email\n'
f.write(header)

for url in urls:
	gen_url=base_url+url
	print("generated URL",gen_url)
	html = requests.get(gen_url)
	soup = BeautifulSoup(html.content,'html.parser')	# Converts to parse tree
	container = soup.find("div", id="ISS_Main_T467AEC33012_Col00")
	
	#names = container.findAll('h2')						#Find names with h2 heading
	titles= container.findAll('h3')						#Find titles with h3 heading
	#email=container.find_all({'my-email'})
	pages = container.findAll("i")
	
	titles2= titles[::2]								#Take alternate records from data as null lines were coming
	titles3=[]			
	for title in titles2:			
		t=title.text.replace(",", " ")					#To replace "," in data to space
		titles3.append(t)
	num = len(titles3)
	
	#test={}
	n=[]
	e=[]
	for i in container:
		#print(i.find('h2'))
		name="none"
		email="none"
		if(i.find('h2') != -1 and i.find('h2') is not None):
			name=i.find('h2')
			name=name.text
			#print(type(name))
			#print(name)
		if(i.find('my-email') != -1 and i.find('my-email') is not None):
			email=i.find('my-email')
			email=email['data-user']+'@'+email['data-domain']
			#print(email)
		#else: print("not found email")
		
		if(name != "none"):
			test[name.strip()]=[email.strip()]
			n.append(name.strip())
			e.append(email.strip())
	#print(test)
	for p in pages: 
		print("pages total",p.text.strip())
		if int(p.text.strip())>1:
			for i in range(int(p.text.strip())+1):
				if i==1 or i==0: continue
				urls_new.append(url+'/'+str(i))
	print("============================================")
	print(range(num))
	for i in range(num):
		#print(names[i].text.strip())					#Strip all extra white characters
		print("names:",n[i].strip())
		print("email:",e[i])
		print(titles3[i])
		#print(email[i]['data-user']+'@'+email[i]['data-domain'])
		f.write(n[i].strip()+','+titles3[i]+','+url+','+e[i]+'\n')
	print("--------------------------------------------")
	
	#print(container)
	#print(test)
if urls_new:
	for url in urls_new:
		gen_url=base_url+url
		print("new generated url",gen_url)
		html = requests.get(gen_url)
		soup=BeautifulSoup(html.content,'html.parser')
		container = soup.find("div",id="ISS_Main_T467AEC33012_Col00")
		
		titles=container.findAll('h3')
		titles2= titles[::2]				
		titles3=[]			
		for title in titles2:
			t=title.text.replace(",", " ")	
			titles3.append(t)
		num = len(titles3)
		
			#test={}
		n=[]
		e=[]
		for i in container:
			name="none"
			email="none"
			if(i.find('h2') != -1 and i.find('h2') is not None):
				name=i.find('h2')
				name=name.text
			if(i.find('my-email') != -1 and i.find('my-email') is not None):
				email=i.find('my-email')
				email=email['data-user']+'@'+email['data-domain']
			
			if(name != "none"):
				n.append(name)
				e.append(email)
		print("============================================")
		for i in range(num):
			print(n[i])
			print(titles3[i])
			print(e[i])
			f.write(n[i].strip()+','+titles3[i]+','+url+','+e[i]+'\n')
		print("--------------------------------------------")
f.close();
