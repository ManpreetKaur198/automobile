
library(xlsx)

gd <- read.csv(choose.files(), header= TRUE)
gd
plot(mpg~cylinders , gd)
with(gd,text(mpg~cylinders, labels = horsepower, pos = 1, cex = 0.8))
plot(displacement~horsepower, gd)

#to remove columns
data2 <- gd[ , -c(2,6)]
data2
data3 <- gd[ ,-c(1,4)]
data3
 
#for mean
mean_data <- apply(data2,2, mean)
mean_data

#for stndrd deviation

std <- apply(data2,2,sd)
std

distance <- dist(data2)
distance

print(distance,digit=9)

library(dendroextras)
library(mclust)

#to make clusters

hc <- hclust(distance, "ave")
plot(hc, labels = gd$displacement)

clust1 <- color_clusters(hclust(distance), 5 )
plot(clust1)



