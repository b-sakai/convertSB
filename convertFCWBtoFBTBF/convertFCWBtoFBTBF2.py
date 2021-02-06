from mat import *
from swc import *
print(rsmat)
print(tmat)

import glob
iswcfilenames = glob.glob("/home/buntaro/ioEstimation/Result/MED/classifiedResultSWC/m*.swc")
print(iswcfilenames)
for n, iswcfilename in enumerate(iswcfilenames):
    icell = Swc(iswcfilename)
    oname = iswcfilename.split('/')[-1]
    oswcfile = open("/home/buntaro/ioEstimation/Result/MED/classifiedmPNs/" + oname,  mode='w')
    for i, comp in icell.data.items():
        pos = np.matrix(comp['pos']).T
        pos = np.matrix([[comp['pos'][0]],\
                         [comp['pos'][1]],\
                         [comp['pos'][2]],\
                         [1.0]])
        trsmat_inv = trsmat**-1
        trspos = trsmat_inv * pos # TRS_inv * pos
        cpos = [trspos[0,0], trspos[1,0], trspos[2,0]] # converted position
        outlist = [i, comp['type'], cpos[0], cpos[1], cpos[2],\
                   comp['radius'], comp['parent']]
        outline = ' '.join(map(str, outlist))
        #print(outline)
        oswcfile.write(outline + '\n')
    print(n, oname)
    oswcfile.close()

    

                  


