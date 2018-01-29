qplot()
qplot(carat, price, data = diamonds)

## aesthetic mappings: how data are mappedto color, size
qplot(carat, price, data = diamonds, color = cut)

## geoms: geometric objects like points, lines, shapes
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))
  # The first refers to the data points and second to the trend lines
  # The gray areas indicate the 95% confidence intervals for the lines
## density plot
qplot(price, data = diamonds, geom = "density", color = cut)
## boxplot
qplot(carat, price, data = diamonds, geom = "boxplot", facets = . ~ cut)
ggplot(diamonds, aes(carat, price)) + geom_boxplot() + facet_grid(. ~ cut)
## linear model plot
qplot(carat, price, data = diamonds, color = cut) + geom_smooth(method = "lm")
## histograms
qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)

## facets: split out the groups into sep panels and make sep plots
## facets = x ~ y, plots the number of x rows and y cols 
qplot(carat, price, data = diamonds, facets = . ~ cut)  # The . indicates a single row and drv implies 3
qplot(hwy, data = mpg, facets = drv~., binwidth = 2)


g <- ggplot(data = mpg, aes(displ, hwy))
g + geom_point()
## aes()
g + geom_point(color = "steelblue")  # Constant values
g + geom_point(aes(color = drv))  # Data bariable
## facets()
g + geom_point() + geom_smooth(method = "lm") +facet_grid(. ~ drv)

## Modifying Labels
g + geom_point() + labs(title = "Swirl Rules!") + labs(x = "Displacement", y = "Hwy Mileage")
## Customizing the Smooth
g + geom_point(aes(color = drv), size = 2, alpha = 1/2) + geom_smooth(size = 3, linetype = 3, method ="lm", se = FALSE)
  # Semi-transparent colors (0 < alpha < 1)
  # se: standard errors(confidence intervals)

## For things that only make sense globally, use theme()
theme(legend.position = "none")

## Axis Limits
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50, 2] <- 100  # Outlier
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line() + coord_cartesian(ylim = c(-3, 3))

## Altogether
g <- ggplot(mpg, aes(x = displ, y = hwy, color = factor(year)))
g + geom_point() + facet_grid(drv ~ cyl, margins = TRUE) + geom_smooth(method = "lm", se = FALSE,
    size = 2, color = "black") + labs(x = "Displacement", y = "Highway Mileage", title = "Swirl Rules!")
  # The margins argument tells ggplot to display the marginal totals over each row and column

## cut the data at the deciles
g <- ggplot(data = diamonds, aes(depth, price))
cutpoints <- quantile(diamonds$carat, seq(0, 1, length = 4), na.rm = TRUE)
diamonds$car2 <- cut(diamonds$carat, cutpoints)
g <- ggplot(data = diamonds, aes(depth, price))
g + geom_point(alpha = 1/3) + facet_grid(cut ~ car2)
  # NA: diamonds with carat size .2 were excluded from the car2 field