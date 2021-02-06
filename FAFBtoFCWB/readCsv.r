pndata = read.table("./pninfo.csv", header=TRUE, sep=",")
print(length(pndata[,1]))
for (i in 1:length(pndata[,1])) {
    idname = pndata[i, 1]
    celltype = pndata[i, 2]
    transmitter = pndata[i, 7] 
    tract = pndata[i, 8]    
    glom = pndata[i, 9]
    uorm = pndata[i, 15]
    prename <- paste(uorm, tract, transmitter, glom, idname, sep="_")
    ofilename <- paste(prename, ".swc", sep="")
    print(i)
    print(ofilename)    
    #write.neurons(fcnv, file=ofilename, dir="fcwbswcs", Force=T)    
}