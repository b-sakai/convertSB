library(flycircuit)
library(nat.flybrains)
library(elmr)
# set window size
windowSize=c(0, 0, 1200, 1200)
rgl::open3d(windowRect = windowSize)

#################################################
# plot regions
#################################################
# get region
regions = c("AL_R", "MB_CA_R", "MB_PED_R", "MB_VL_R", "MB_ML_R", "LH_R")
surfRegions = getRegionSurf(regions, FCWBNP.surf)

# plot neurons and region
plot3d(surfRegions, alpha=0.2)


#################################################
# plot neurons from FAFB
#################################################
# get converted neuron list
pndata = read.table("./pninfo.csv", header=TRUE, sep=",")

#    prename <- paste(uorm, tract, transmitter, glom, idname, sep="_")
#    ofilename <- paste(prename, ".swc", sep="")
    fcn = read.neurons("fafbKCs/VFB_001000k0.swc")
    fcnv <- xform_brain(fcn, JFRC2, FCWB)
#    write.neurons(fcnv, file=ofilename, dir="fcwbswcs", Force=T)    
#    print(paste(i, idname, sep=" "))
    plot3d(fcnv, soma=TRUE)

#################################################
# take snap shots
#################################################

# plot grid
grid3d(c('x', 'y', 'z'), n = 50)

# change view point and snap image
rgl::view3d(zoom=0.6)
rgl.snapshot(paste("./fafbpns_xy.png", sep=""))

rgl::view3d(phi = 90, zoom=0.6)
rgl.snapshot(paste("./fafbpns_xz.png", sep=""))

rgl::view3d(theta = 90, zoom=0.6)
rgl.snapshot(paste("./fafbpns_yz.png", sep=""))

rgl.close()