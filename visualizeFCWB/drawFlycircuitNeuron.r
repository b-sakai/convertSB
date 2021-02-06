library(flycircuit)
library(nat.flybrains)
# set window size
windowSize=c(0, 0, 1200, 1200)
rgl::open3d(windowRect = windowSize)


#################################################
# draw LNs
#################################################
# get name vector from input file
names = scan("/home/buntaro/Dropbox/extractedNeuronName/ln/ln_gaba.name", character(), quote="")
fcn <- fc_read_neurons(names)
print(length(names))
plot3d(fcn, soma=TRUE, col=rgb(98/255, 151/255, 132/255))

#################################################
# draw KCs
#################################################
# get name vector from input file
names = scan("/home/buntaro/Dropbox/extractedNeuronName/kc/kc_all.name", character(), quote="")
fcn <- fc_read_neurons(names, n=30)
print(length(names))
plot3d(fcn, soma=TRUE, col=rgb(180/255, 0/255, 105/255))


#################################################
# draw APL
#################################################
names = scan("/home/buntaro/Dropbox/extractedNeuronName/mbln/apl.name", character(), quote="")
fcn <- fc_read_neurons(names)
print(length(names))
plot3d(fcn, soma=TRUE, col=rgb(136/255, 165/255, 141/255))

#################################################
# draw DPM
#################################################
names = scan("/home/buntaro/Dropbox/extractedNeuronName/mbln/dpm.name", character(), quote="")
fcn <- fc_read_neurons(names)
print(length(names))
plot3d(fcn, soma=TRUE, col=rgb(146/255, 165/255, 136/255))


#################################################
# take snap shots
#################################################
# get region
regions = c("AL_R", "MB_CA_R", "MB_PED_R", "MB_VL_R", "MB_ML_R")
surfRegions = getRegionSurf(regions, FCWBNP.surf)

# plot neurons and region
plot3d(surfRegions, alpha=0.1)

# change view point and snap image
rgl::view3d(theta=180, zoom=0.6)
rgl.snapshot(paste("./flycircuit_xy.png", sep=""))

rgl::view3d(theta=180, phi = 90, zoom=0.6)
rgl.snapshot(paste("./flycircuit_xz.png", sep=""))

rgl::view3d(theta = 90, zoom=0.6)
rgl.snapshot(paste("./flycircuit_yz.png", sep=""))

rgl.close()