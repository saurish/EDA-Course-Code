dataFrame <- data.frame(x=x, y=y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
print(dataMatrix)
heatmap(dataMatrix)