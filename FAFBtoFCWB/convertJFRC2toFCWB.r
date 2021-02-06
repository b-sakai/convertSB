library(flycircuit)
library(nat.flybrains)

filename <- commandArgs(trailingOnly=TRUE)[1]
names = scan(filename, character(), quote="")
print(length(names))

# convert each neruon
for (i in 1:(length(names)/2)) {
    glomName <- names[2*i-1]
    vfbName <- names[2*i]
    #fcn <- fc_read_neurons(name, TRUE)
    fcn = read.neurons(paste("jfrc2swcs/", vfbName, ".swc", sep=""))
    fcnv <- xform_brain(fcn, JFRC2, FCWB)
    ofilename <- paste(glomName,"_",  vfbName, ".swc", sep = "")    
    write.neurons(fcnv, file=ofilename, dir="fcwbswcs", Force=T)
    rm(fcn)
}

