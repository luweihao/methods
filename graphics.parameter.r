## par():Set or Query Graphical Parameters
## some parameters:
## pch: the plotting symbol (default is open circle)
## lty: the line type (default is solid line), can be dashed, dotted, etc
## lwd: the line width, specified as an integer multiple
## col, xlab, ylab
## bg: the background color
## mfrow / mfcol: (����)ͼƬ�ڷ����� per row, column
## mar: plot �������ұ�Ե�Ŀհ׳��ȣ�5.1 4.1 4.1 2.1

layout(matrix(c(1,1,2,3), 2, 2, byrow=TRUE))
#����ͼƬ�ڷ�λ��

## �ı���ɫ����ǳ
x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch = 19, col = rgb(0, .5, .5, .3))  # rgb(red, green, blue, alpha)
# Semi-transparent colors (0 < alpha < 1)