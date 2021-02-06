import swc2vtk
import glob

iswcfilenames = glob.glob("./fbtbfswcs/*.swc")
for iswcfilename in iswcfilenames:
    oname = iswcfilename.split('/')[-1].split('.')[0]
    vtkgen = swc2vtk.VtkGenerator()
    vtkgen.set_draw_mode(3)
    vtkgen.add_swc(iswcfilename)
    vtkfilename = "./vtk/" + oname + ".vtk"
    vtkgen.write_vtk(vtkfilename)
