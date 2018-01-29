x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))
dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)


## hclust()
hClustering <- hclust(distxy)
plot(hClustering)
plot(as.dendrogram(hc))  # The labels are missing and the leaves are all printed at the same level.


## kmeans()
kmeansObj <- kmeans(dataFrame, centers = 3)
  # x: the numeric matrix of data
  # centers: can be either a number of clusters or a set of initial centroids
  # iter.max: specifies the maximum number of iterations to go through
  # nstart: the number of random starts you want to try if you specify centers as a number
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd =3)


## heatmap
image(1:3, 1:4, matrix(1:12, nrow = 3))  #颜色比较，越亮越大

dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")

dataMatrix2 <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix2)[, nrow(dataMatrix2):1])
heatmap(dataMatrix2)  #相较image运行速度更慢，绘出cluster
