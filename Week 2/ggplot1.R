library(ggplot2)

#qplot(displ, hwy, data=mpg, facets = drv~.)
qplot(log(eno), data = maacs)