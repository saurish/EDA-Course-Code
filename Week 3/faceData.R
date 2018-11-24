setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week3")

png(file = "faceData_face.png")
load("data/face.rda")
image(t(faceData)[, nrow(faceData):1])

png(file = "faceData_Variance_explained.png")
svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = "Singular vector", ylab = "Variance explained")

## create approximations
svd1 <- svd(scale(faceData))

## printing dimensions of U V D
print("Dim of U :- ")
print(dim(svd1$u))
print("Dim of V :- ")
print(dim(svd1$v))
print("Dim of D :- ")
print(dim(diag(svd1$d)))


## Note that %*% is matrix multiplication
# Here svd1$d[1] is a constant
approx1 <- svd1$u[, 1] %*% t(svd1$v[, 1]) * svd1$d[1]
# In these examples we need to make the diagonal matrix out of d
approx5 <- svd1$u[, 1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[, 1:5])
approx10 <- svd1$u[, 1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[, 1:10])

# plot approximations
png(file = "faceData_approximations_plotted.png")
par(mfrow = c(1, 4))
image(t(approx1)[, nrow(approx1):1], main = "(a)")
image(t(approx5)[, nrow(approx5):1], main = "(b)")
image(t(approx10)[, nrow(approx10):1], main = "(c)")
image(t(faceData)[, nrow(faceData):1], main = "(d)") ## Original data


graphics.off()
