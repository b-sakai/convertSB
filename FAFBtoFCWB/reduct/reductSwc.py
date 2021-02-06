from swc import *
import glob
iswcfilenames = glob.glob("../fcwbswcs/*.swc")
print(iswcfilenames)
for iswcfilename in iswcfilenames:
    oname = iswcfilename.split('/')[-1]
    print(oname)
    icell = Swc(filename=iswcfilename)
    print("original num comp is", len(icell.data))
    icell.reduct1()
    print("after reduct1", len(icell.data))    
    icell.reduct2()
    print("after reduct2", len(icell.data))        
    oswcfilename = "../reductedfcwbswcs/" + oname
    icell.write(oswcfilename)
