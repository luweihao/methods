## xyplot(y ~ x | f * g, data): this is the main function for creating scatterplots
## The f and g represent the optional conditioning variables. The * represents interaction between them.
## The f defines the columns of the plot
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)
xyplot(Ozone~Wind, data = airquality, col = "red", pch = 8, main = "Big Apple Data")

airquality2 <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality2, layout = c(5, 1))
xyplot(Ozone ~ Wind | as.factor(Month), data = airquality, layout = c(5, 1), panel = function(x = Wind, y = Ozone, ...){
  panel.xyplot(x, y, ...)  ## First call the default panel function for 'xyplot'
  panel.abline(h = median(y, na.rm = TRUE), lty = 2)  ## Add a horizontal line at the median
  panel.lmline(x, y, col = 2)  ## Overlay a simple linear regression line
})

## the strip argument labels each panel
xyplot(displ ~ hwy | class * drv, data = mpg, strip = FALSE, pch = 20)

## bwplot: box and whiskers plots("boxplots")

## histogram: histograms

## stripplot: like a boxplot but with actual points

## dotplot: plot dots on "violin strings"

## splom: scatterplot matrix; like pairs in base plotting system

## levelplot / contourplot : for plotting "image" data

## barchart: 


