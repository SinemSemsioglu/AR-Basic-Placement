#generates text based pseudo database entries

import random

# G W R
# values between 1, 10

f = open("sample_db", 'w')

for i in range(50000):
	name = "G"+str(i)
	r1 = random.randint(0,10)
	r2 = random.randint(0,10)
	r3 = random.randint(0,10)
	f.write(name+","+str(r1)+","+str(r2)+","+str(r3)+"\n")
	
for i in range(50000):
	name = "W"+str(i)
	r1 = random.randint(0,10)
	r2 = random.randint(0,10)
	r3 = random.randint(0,10)
	f.write(name+","+str(r1)+","+str(r2)+","+str(r3)+"\n")
	
for i in range(50000):
	name = "R"+str(i)
	r1 = random.randint(0,10)
	r2 = random.randint(0,10)
	r3 = random.randint(0,10)
	f.write(name+","+str(r1)+","+str(r2)+","+str(r3)+"\n")