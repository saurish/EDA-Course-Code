setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week3")

## Initially data is completely random, that is no pattern

set.seed(12345)
dataMatrix <- matrix(rnorm(400), nrow = 40)
png(file = "dataPattern_matrix_with_random_pattern.png")
par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])


## data is clustered using 'heatmap' API, still no pattern
png(file = "dataPattern_matrix_with_random_pattern_heatmap.png")
par(mar = rep(0.2, 4))
heatmap(dataMatrix)

## let's add some pattern
set.seed(678910)
for (i in 1:40) {
  # flip a coin
  coinFlip <- rbinom(1, size = 1, prob = 0.5)
  # if coin is heads add a common pattern to that row
  if (coinFlip) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
  }
}

## let's print the data and see the pattern
png(file = "dataPattern_matrix_with_pattern.png")
par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])


png(file = "dataPattern_matrix_with_pattern_heatmap.png")
par(mar = rep(0.2, 4))
heatmap(dataMatrix)

## pattern's in rows and columns

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
png(file = "dataPattern_matrix_with_pattern_in_rows_and_columns.png")
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, , xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)




## Singular Value Decomposition X = UDV T
## U --> 


svd1 <- svd(scale(dataMatrixOrdered))
png(file = "dataPattern_matrix_with_pattern_svd.png")
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[, 1], 40:1, , xlab = "Row", ylab = "First left singular vector",
     pch = 19)
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector", pch = 19)


## variance_explained
png(file = "dataPattern_matrix_with_pattern_variance_explained.png")
par(mfrow = c(1, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained",
     pch = 19)

## Relationship of SVD with Principal components

svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)
png(file = "dataPattern_matrix_with_pattern_svd_and_Principal_comp_relations.png")
plot(pca1$rotation[, 1], svd1$v[, 1], pch = 19, xlab = "Principal Component 1",
     ylab = "Right Singular Vector 1")
abline(c(0, 1))


# turning all devices off
graphics.off()
