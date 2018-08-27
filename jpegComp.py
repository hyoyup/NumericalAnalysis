# prog4.py
# Hyoyup Chung
# Numerical Analysis - JPEG Compression
from PIL import Image
import numpy as np
from numpy import array
import math

def getAlpha(k):
	if (k==0):
		return math.sqrt(1.0/8.0)
	else:
		return math.sqrt(2.0/8.0)

# DCT with masking
def transformMask(block):
	transformedBlock = [[0 for i in range(8)] for j in range(8)]
	for k in range(0,4):
		for j in range(0,4):
			if (k+j>3):  # masking done here
				continue
			a_kj = 0.0
			a_k = getAlpha(k)
			a_j = getAlpha(j)
			for x in range(0,8):
				for y in range(0,8):
					a_kj += (a_k*a_j*block[x][y] * math.cos(k*(x+0.5)*math.pi/8.0)
												 * math.cos(j*(y+0.5)*math.pi/8.0))
			transformedBlock[k][j] = a_kj
	return transformedBlock

# divides image file into blocks of 8 x 8
def getBlocks(file,w,h):
	blocks = []
	for blocknum in range(0,w*h/64):
		block = []
		rowInc = blocknum/(h/8)*8
		colInc = blocknum%(w/8)*8
		for row in range(rowInc,rowInc+8):
			newRow = []
			for col in range(colInc,colInc+8):
				newRow.append(file[row][col])
			block.append(newRow)
		blocks.append(block)
	return blocks

# main compression function
def jpeg_compress(file, w, h):
	if(w%8!=0 or h%8!=0):
		print "width or height size is not valid--"
		return
	blocks = getBlocks(file,w,h)
	compressed = []
	num = len(blocks)
	completeSoFar = 0.0
	for block in blocks:
		progress = (completeSoFar/num*100)
		if (progress%5 == 0):
			print "compression in progress....", progress,"percent complete"
		compressed.append(transformMask(block))
		completeSoFar += 1
	print "jpeg compression complete!\n"
	return compressed

# inverse DCT
def invTransformMask(block):
	invBlock = [[0 for i in range(8)] for j in range(8)]
	for x in range(0,8):
		for y in range(0,8):
			a_kj = 0.0
			for k in range(0,8):
				for j in range(0,8):
					a_k = getAlpha(k)
					a_j = getAlpha(j)
					a_kj += (a_k*a_j*block[k][j] * math.cos(k*(x+0.5)*math.pi/8.0)
												 * math.cos(j*(y+0.5)*math.pi/8.0))
			akj = [np.uint8(a_kj[0]),np.uint8(a_kj[1]),np.uint8(a_kj[2])]
			invBlock[x][y] = akj
	return invBlock

# converts blocks to image array form
def blocksToArray(blocks, width, height):
	rowInc = 0
	colInc = 0
	blocknum = 0
	arrayBlocks = np.zeros((height,width, 3), dtype=np.uint8)
	for block in blocks:
		rowInc = blocknum/(height/8)*8
		colInc = blocknum%(width/8)*8		
		for i in range(rowInc,rowInc+8):
			for j in range(colInc,colInc+8):
				arrayBlocks[i][j] = block[i-rowInc][j-colInc]
		blocknum += 1
	return np.asarray(arrayBlocks)

# main decompression function
def jpeg_decompress(blocks, width, height):
	decompressed = []
	num = len(blocks)
	completeSoFar = 0.0
	for block in blocks:
		progress = (completeSoFar/num*100)
		if (progress%5 == 0):
			print "decompression in progress....", progress,"percent complete"
		decompressed.append(invTransformMask(block))
		completeSoFar += 1
	print "jpeg decompression complete!\n"
	return blocksToArray(decompressed,width,height)

# MAIN
if __name__ == "__main__":
	# Input jpeg
	#imageName = 'originalImage.jpg'
	#imageName = 'BiggerImage.jpg'
	imageName = 'digipen.jpg'

	file = array(Image.open(imageName))
	width = len(file[0])
	height = len(file)
	print "jpeg-compression on file: ", imageName
	print "width:", width, " height:",height

	# COMPRESSION
	compressedBlocks = jpeg_compress(file,width,height)
	# DECOMPRESSION
	decompressed = jpeg_decompress(compressedBlocks,width,height)

	out = Image.fromarray(decompressed,'RGB')
	out.save('out.jpg')
	out.show()
