setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week3")

set.seed(1234); 


## List of Devices - considered in reverse order
png(file = "KMeansClustering_Cluster.png")
png(file = "KMeansClustering_Data.png")


par(mar=c(0,0,0,0))


x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)

dev.cur()
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))


dataFrame = data.frame(x,y)
kmeansobj <- kmeans(dataFrame, centers = 3)
names(kmeansobj)
kmeansobj$cluster


par(mar=rep(0.2,4))

dev.set(dev.next())
plot(x,y,col=kmeansobj$cluster,pch=19,cex=2)
points(kmeansobj$centers,col=1:3,pch=3,cex=3,lwd=3)

graphics.off()

