library(flycircuit)
library(nat.flybrains)
# set window size
windowSize=c(0, 0, 1200, 1200)
rgl::open3d(windowRect = windowSize)

#################################################
# get neurons from virtualFlybrain
#################################################
# get converted neuron list
# mbon06
ifilename = paste("../fcwbmbons/mbon06.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col='red')

# mbon07_1
ifilename = paste("../fcwbmbons/mbon07_1.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col='green')

# mbon07_2
ifilename = paste("../fcwbmbons/mbon07_2.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col='blue')

#################################################
# take snap shots
#################################################
# get region
regions = c("AL_R", "MB_CA_R", "MB_PED_R", "MB_VL_R", "MB_ML_R", "LH_R")
surfRegions = getRegionSurf(regions, FCWBNP.surf)

# plot neurons and region
plot3d(surfRegions, alpha=0.2)

# plot grid
grid3d(c('x', 'y', 'z'), n = 50)

# change view point and snap image
rgl::view3d(zoom=0.6)
rgl.snapshot(paste("./mbon_xy.png", sep=""))

rgl::view3d(phi = 90, zoom=0.6)
rgl.snapshot(paste("./mbon_xz.png", sep=""))

rgl::view3d(theta = 90, zoom=0.6)
rgl.snapshot(paste("./mbon_yz.png", sep=""))

rgl.close()