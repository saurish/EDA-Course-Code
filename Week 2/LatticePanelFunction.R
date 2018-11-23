set.seed(10)

x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f -f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group1", "Group2"))

## custom panel function

xyplot(y~x | f, panel = function(x, y, ...){
  panel.xyplot(x,y, ...)
  panel.abline(h=median(y), lty = 2)  ## adding median line 
  panel.lmline(x, y, col=2)           ## overlay a simple regression line
})