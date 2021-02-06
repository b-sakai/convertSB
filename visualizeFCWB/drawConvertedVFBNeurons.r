library(flycircuit)
library(nat.flybrains)
# set window size
windowSize=c(0, 0, 1200, 1200)
rgl::open3d(windowRect = windowSize)

#################################################
# get neurons from virtualFlybrain
#################################################
# get converted neuron list
cfilename <- "../getFCWBswcs/glomName.name"
cnames = scan(cfilename, character(), quote="")

for (i in 1:(length(cnames)/2)) {
    glomName <- cnames[2*i-1]
    vfbName <- cnames[2*i]
    ifilename = paste("../getFCWBswcs/fcwbswcs/", glomName, "_", vfbName, ".swc", sep="")
    print(ifilename)    
    fcn <- read.neurons(ifilename)
    plot3d(fcn, soma=TRUE, col='blue')    
}


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
rgl.snapshot(paste("./VFBuniglomPNs_xy.png", sep=""))

rgl::view3d(phi = 90, zoom=0.6)
rgl.snapshot(paste("./VFBuniglomPNs_xz.png", sep=""))

rgl::view3d(theta = 90, zoom=0.6)
rgl.snapshot(paste("./VFBuniglomPNs_yz.png", sep=""))

rgl.close()