library(flycircuit)
library(nat.flybrains)
# set window size
windowSize=c(0, 0, 1200, 1200)
rgl::open3d(windowRect = windowSize)

#################################################
# draw uPNs
#################################################
# get converted neuron list
cfilename <- "../getFCWBswcs/glomName.name"
cnames = scan(cfilename, character(), quote="")
# cnames = head(cnames)

for (i in 1:(length(cnames)/2)) {
    glomName <- cnames[2*i-1]
    vfbName <- cnames[2*i]
    ifilename = paste("../getFCWBswcs/fcwbswcs/", glomName, "_", vfbName, ".swc", sep="")
    print(ifilename)    
    fcn <- read.neurons(ifilename)
    plot3d(fcn, soma=TRUE, col=rgb(183/255, 0/255, 3/255))    
}

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
# draw MBONs
#################################################
# get converted neuron list
# mbon06
ifilename = paste("../fcwbmbons/mbon06.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col="#954fa9")

# mbon07_1
ifilename = paste("../fcwbmbons/mbon07_1.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col="#954fa9")

# mbon07_2
ifilename = paste("../fcwbmbons/mbon07_2.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col="#954fa9")

#################################################
# draw DANs
#################################################
# get converted neuron list
# pam09
ifilename = paste("../fcwbpams/pam09.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col=rgb(213/255, 98/255, 41/255))

# pam10
ifilename = paste("../fcwbpams/pam10.swc", sep="")
print(ifilename)    
fcn <- read.neurons(ifilename)
plot3d(fcn, soma=TRUE, col=rgb(213/255, 98/255, 41/255))

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
rgl.snapshot(paste("./allType_xy.png", sep=""))

rgl::view3d(theta=180, phi = 90, zoom=0.6)
rgl.snapshot(paste("./allType_xz.png", sep=""))

rgl::view3d(theta = 90, zoom=0.6)
rgl.snapshot(paste("./allType_yz.png", sep=""))

rgl.close()