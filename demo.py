## must add error checking!!

import random

#------------------FUNCTIONS-------------------#

#displays the square with content
def displaySq(index1, index2):
	val = space[index1][index2];
	str = "|"+val+(" "*(6-len(val)))+"|"
	return str
	
#displays the square not in use
def displayInvalid(index1, index2):
	str = "|"+(" "*2)+"X"+(" "*3)+"|"
	return str

#displays matrix with entries
def displayMatrix(type = None):
	#check if any part is selected
	valid = []
	if(type == 1):
		rangeX = range(0,rows/2)
		rangeY = range(0,cols/2)
	elif(type == 2):
		rangeX = range(rows/2,rows)
		rangeY = range(0,cols/2)
	elif(type == 3):
		rangeX = range(0,rows/2)
		rangeY = range(cols/2,cols)
	elif(type == 4):
		rangeX = range(rows/2,rows)
		rangeY = range(cols/2,cols)
	elif(type != None):
		print("Wrong selection!")
		return
	else:
		rangeX = range(0,rows)
		rangeY = range(0,cols)
		
	#members of valid will be printed with their entries, rest as invalid
	for i in rangeX:
		for j in rangeY:
			valid.append((i,j))
	
	str = ""
	for i in range(rows):
		str += (" "+("-"*6)+" ")*cols
		str += "\n"
		for j in range(cols):
			if (i,j) in valid:
				str += displaySq(i,j)
			else:
				str += displayInvalid(i,j)
		str += "\n"
	
	str += (" "+("-"*6)+" ")*cols
	print(str);

# get values from users
def init(type):
	lRange = lightRanges[type]
	hRange = heightRanges[type]
	pRange = privacyRanges[type]
	
	hVal = input("Pick a value between "+str(hRange[0])+" and "+str(hRange[1])+" for light property	")		
	lVal = input("Pick a value between "+str(lRange[0])+" and "+str(lRange[1])+" for light property	")
	pVal = input("Pick a value between "+str(pRange[0])+" and "+str(pRange[1])+" for light property	")
	
	# error checking here!!
	
	results = search(hVal,lVal,pVal, entries)
	final = []
	ind1 = random.randint(0,len(results)-1)
	final.append(results.pop(ind1))
	
	ind2 = random.randint(0,len(results)-1)
	final.append(results.pop(ind2))
	
	ind3 = random.randint(0,len(results)-1)
	final.append(results.pop(ind3))
	
	ind4 = random.randint(0,len(results)-1)
	final.append(results.pop(ind4))
	
	return final
	
	

#find matching values from the database	
def search(h,l,p, dict):
	temp = []
	for e in dict:
		props = dict[e]
		if h == props[0] and l == props[1] and p == props[2]:
			temp.append(e)
			
	return temp
		
		
#---------------------MAIN!	------------------------------#
	
db = "sample_db"
size = 16
numFields = 4 		#fields in the text file| name, height, light, privacy

f = open(db, 'r')
entries = {}
for line in f:
	sLine = line.split(',',numFields-1)
	fields = []
	if(len(sLine)==numFields):
		for i in range(numFields):
			if(i<numFields-1):
				fields.append(int(sLine[i+1]))
			else:
				entries[sLine[0]] = fields
			
lightRanges = [(3,7), (2,5), (0,4), (8,10)]
heightRanges = [(1,9), (3,5), (6,8), (8,10)]
privacyRanges = [(0,5),(4,7),(4,7),(7,9)]


##-------------------------- PART 1-------------------------- ##
print("Looks like you have a 16 unit square space, how would you like to organize your squares? Press 1 for 4x4, 2 for 2x8")
choice = input()

#initialise numbers of columns and rows according to choice
if (choice == 1):
	cols = 4
	rows = 4
elif (choice == 2):
	cols = 8
	rows = 2	
else:
	print("Wrong input you idiot! Try again.")

#initialise the array	
space = [[0]*cols for i in range(rows)]
for i in range(rows):
	for j in range(cols):
		space[i][j]= " "*6

#display of empty lot		
displayMatrix();


##-------------------------- PART 2-------------------------- ##
loop = True
soFar = 0;
while(loop):
	print("Now please select which part you would like to initialize.\n For dining area press 1, for bla press 2, for bla2 press 3for solar energy press 4, to quit press 5")
	choice = input()

	# don't let them choose the same thing
	if(choice == 1):
		displayMatrix(1)
		squarez = init(0)
		rangeX = range(0,rows/2)
		rangeY = range(0,cols/2)
		soFar += 1
	elif(choice == 2):
		displayMatrix(2)
		squarez = init(1)
		rangeX = range(rows/2,rows)
		rangeY = range(0,cols/2)
		soFar += 1
	elif(choice == 3):
		displayMatrix(3)
		squarez = init(2)
		rangeX = range(0,rows/2)
		rangeY = range(cols/2,cols)
		soFar += 1
	elif(choice == 4):
		displayMatrix(4)
		squarez = init(3)
		rangeX = range(rows/2,rows)
		rangeY = range(cols/2,cols)
		soFar += 1
	elif(soFar == 4):
		loop = False
	elif(choice == 5):
		loop = False
	else:
		print("Wrong input!")
	
	ind = 0
	for i in rangeX:
		for j in rangeY:
			space[i][j] = squarez[ind]
			ind += 1
	
	displayMatrix();
		

	

	
