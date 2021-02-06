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
pndata = read.table("../FAFBtoFCWB/pninfo.csv", header=TRUE, sep=",")

for (i in 1:length(pndata[,1])) {
#for (i in 1:6) {
    idname = pndata[i, 1]
    celltype = pndata[i, 2]
    transmitter = pndata[i, 7] 
    tract = pndata[i, 8]    
    glom = pndata[i, 9]
    uorm = pndata[i, 15]
    if (glom == "VM5d" && uorm == "uPN") {
        prename <- paste(uorm, tract, transmitter, glom, idname, sep="_")
	fcn = read.neurons(paste("../FAFBtoFCWB/fafbswcs/", idname, ".swc", sep=""))
	fcnv <- xform_brain(fcn, FAFB, FCWB)
	print(paste(i, idname, sep=" "))
	plot3d(fcnv, soma=TRUE)
    }
}

#################################################
# plot neurons from FAFB
#################################################
fcn = read.neurons("../convertFBTBFtoFCWB/flycircuitFcwbswcs/17620.swc")
plot3d(fcn, soma=TRUE, col='blue')
fcn = read.neurons("../convertFBTBFtoFCWB/flycircuitFcwbswcs/20457.swc")
plot3d(fcn, soma=TRUE, col='blue')
fcn = read.neurons("../convertFBTBFtoFCWB/flycircuitFcwbswcs/20894.swc")
plot3d(fcn, soma=TRUE, col='blue')
fcn = read.neurons("../convertFBTBFtoFCWB/flycircuitFcwbswcs/21498.swc")
plot3d(fcn, soma=TRUE, col='blue')
fcn = read.neurons("../convertFBTBFtoFCWB/flycircuitFcwbswcs/21811.swc")
plot3d(fcn, soma=TRUE, col='blue')
fcn = read.neurons("../convertFBTBFtoFCWB/flycircuitFcwbswcs/22759.swc")
plot3d(fcn, soma=TRUE, col='blue')
fcn = read.neurons("../convertFBTBFtoFCWB/flycircuitFcwbswcs/24742.swc")
plot3d(fcn, soma=TRUE, col='blue')

#################################################
# take snap shots
#################################################

# plot grid
grid3d(c('x', 'y', 'z'), n = 50)

# change view point and snap image
rgl::view3d(zoom=0.6)
rgl.snapshot(paste("./VM5dpns_xy.png", sep=""))

rgl::view3d(phi = 90, zoom=0.6)
rgl.snapshot(paste("./VM5dpns_xz.png", sep=""))

rgl::view3d(theta = 90, zoom=0.6)
rgl.snapshot(paste("./VM5dpns_yz.png", sep=""))

rgl.close()