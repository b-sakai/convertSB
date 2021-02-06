# filename <- commandArgs(trailingOnly=TRUE)[1]
filename <- "uniglom.name"
names = scan(filename, character(), quote="")
print(length(names))
for (i in 1:(length(names))) {
    print(names[i])
}
    