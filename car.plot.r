library(car)

scatterplot(weight ~ height, data = women,
            spread = FALSE, smoother.args = list(lty=2), pch = 19,
            main = "Women Age 30-39",
            xlab = "Height (inches)",
            ylab = "Weight (lbs.)")

##…¢µ„Õºæÿ’Û
scatterplotMatrix(~ mpg + disp + drat + wt, data = mtcars,
                  spread = FALSE, smoother.args = list(lty=2),
                  main = "Scatter Plot Matrix via car package")

detach("package:car", unload=TRUE)