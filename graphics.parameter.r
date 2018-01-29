## par():Set or Query Graphical Parameters
## some parameters:
## pch: the plotting symbol (default is open circle)
## lty: the line type (default is solid line), can be dashed, dotted, etc
## lwd: the line width, specified as an integer multiple
## col, xlab, ylab
## bg: the background color
## mfrow / mfcol: (多张)图片摆放数量 per row, column
## mar: plot 下左上右边缘的空白长度，5.1 4.1 4.1 2.1

layout(matrix(c(1,1,2,3), 2, 2, byrow=TRUE))
#多张图片摆放位置

## 改变颜色及深浅
x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch = 19, col = rgb(0, .5, .5, .3))  # rgb(red, green, blue, alpha)
# Semi-transparent colors (0 < alpha < 1)