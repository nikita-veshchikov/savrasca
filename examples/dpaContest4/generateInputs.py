#!python
import sys
import random

"""
this file generates one input of 16 plaintexts and one input of 4 random bits (for the mask)
for the DPA Contest v4 input
"""

rndSeed = 0 # default random seed
if (len(sys.argv)>1 ):
	rndSeed = int(sys.argv[1]) # choose random seed from command line

file = open("inputs.csv", 'a')	# the file that will contain plaintexts and rnd inputs
random.seed(rndSeed) # set random seed

# plaintext
for j in range(16):
	byte = random.randint(0,255)
	print(chr(byte))
	file.write("%d;"% (byte))

print() # endline

# maskoffset
byte_offset = random.randint(0,15)
print(chr(byte_offset))
file.write( "%d;"% (byte_offset) )
file.write("\n")

file.close()
