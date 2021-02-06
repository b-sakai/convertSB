filename <- commandArgs(trailingOnly=TRUE)[1]
names = scan(filename, character(), quote="")
print(length(names))
for (i in 1:(length(names)/2)) {
    glomName <- names[2*i-1]
    vfbName <- names[2*i]
    print(glomName)
    print(vfbName)
}
    