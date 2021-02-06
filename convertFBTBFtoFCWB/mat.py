rawdata = open("./fraw.txt").readline().split()
rawdata = [float(raw) for raw in rawdata]
print rawdata

import numpy as np
rotationScale = np.matrix([[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]])
transformation = np.matrix([[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0]])
trsmat = np.matrix([[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0]])
for i in range(4):
    for j in range(4):
        trsmat[i,j] = rawdata[4*j + i]
        if i != 3 and j != 3:
            rotationScale[i,j] = rawdata[4*j + i]
            print(rawdata[4*j + i])
            transformation[i,j] = float(i==j)
        else:
            transformation[i,j] = rawdata[4*j + i]

rsmat = rotationScale
tmat = transformation
print(rsmat)
print(tmat)
print(trsmat)
            
        
        
 
