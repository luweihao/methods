## plot(): make a scatterplot
with(data, plot(x, y, ...), col = label) #diff group for diff color
## lines(), points()
## legend()
## text(): Add Text to a Plot given by x and y
text(x = -2, y = -2, labels = "Label")
## mtext("Ozone and Weather in New York City", outer = TRUE)
## title(): add annotations to x, y axis labels, title, subtitle, placed in outer margin or not
title(main = NULL, sub = NULL, xlab = NULL, ylab = NULL, outer = FALSE)
## abline(): Add Straight Lines to a Plot
## identify(): Identify Points in a Scatter Plot

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n")) #"n" for no plotting
table(airquality$Month)
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue", pch = 17))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red", pch = 8))
legend("topright", pch = c(17, 8), col = c("blue", "red"), legend = c("May", "notMay"))

with(mtcars, {
  plot(wt, mpg, main = "Ozone and Wind in New York City", pch = 20);
  abline(lm(mpg~wt), col = "red", lwd =2, lty = 1); #回归直线
  lines(lowess(wt, mpg), col = "blue", lwd =2, lty = 2) #lowess平滑曲线
})

with(mtcars, {
  plot(wt, mpg, main = "Ozone and Wind in New York City", pch = 20);
  abline(lm(mpg~wt), col = "red", lwd =2, lty = 1); #回归直线
  M.loess <- loess(mpg~wt)
  fit <- fitted(M.loess) #得到拟合值
  ord1 <- order(wt)
  lines(wt[ord1], fit[ord1], col = "blue", lwd =2, lty = 2) #loess平滑曲线
})

## 经验分布
w = c(75.0, 64.0, 47.4, 66.9, 62.2, 62.2, 58.7, 63.5, 66.6, 64.0, 57.0, 69.0, 56.9, 50.0, 72.0)
plot(ecdf(w),verticals = TRUE, do.p = FALSE, col="blue", lwd=2)
x=44:78
lines(x, pnorm(x, mean(w), sd(w)), col="red", lwd=2)

mpg=mtcars$mpg
plot(ecdf(mpg), verticals = TRUE, do.p = FALSE, col="blue", lwd=2)
xfit=seq(min(mpg), max(mpg), length=40)
yfit=pnorm(xfit, mean(xfit), sd(xfit))
lines(xfit, yfit, col="red", lwd=2)

##置信区间
xx <- faithful$eruptions
fit1 <- density(xx)
fit2 <- replicate(100, {
  x <- sample(xx,replace=TRUE);
  density(x, from=min(fit1$x), to=max(fit1$x))$y
}) #进行bootstrap
fit3 <- apply(fit2, 1, quantile,c(0.025,0.975))
plot(fit1, ylim=range(fit3))
polygon(c(fit1$x,rev(fit1$x)),
        c(fit3[1,], rev(fit3[2,])),
        col="grey", border=F)
#画出置信区间
lines(fit1)

## Q-Q Plot
qqnorm(mpg)
qqline(mpg)

## 箱线图
library(datasets)
boxplot(subset(airquality, Wind >=10)$Ozone, ylab = "Ozone(ppb), Wind>=10")
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone(ppb)")

X=iris[,1:4]
G=gl(3,50)
jpeg("iris.jpeg", height=600, width=600, quality = 1000)
par(mfrow=c(2, 2))
for(i in 1:4){
  xg <- split(X[,i], G)
  boxplot(xg, col = "lavender")
}
dev.off()

## When looking at a single variable, hist() are a useful tool.
hist(airquality$Ozone)
 #freq = FALSE 根据概率密度而不是频数绘制图形
 #breaks 控制组的数量
## rug():Add a Rug to a Plot
rug(airquality$Ozone)

detach("package:datasets", unload=TRUE)

## 条形图： barplot()
 # horiz = TRUE 生成一幅水平条形图
 # beside = TRUE 矩阵中的每一列都表示一个分组

## 点图
mtcars2=mtcars[order(mtcars$mpg),]
mtcars2$cyl=factor(mtcars2$cyl)
mtcars2$color[mtcars2$cyl==4]="red"
mtcars2$color[mtcars2$cyl==6]="blue"
mtcars2$color[mtcars2$cyl==8]="darkgreen"

dotchart(mtcars2$mpg, labels=row.names(mtcars2), 
         groups = mtcars2$cyl, gcolor = "black",
         color=mtcars2$color, pch=19, 
         main="dotchart of mtcars data")

## 高密度散点图
smoothScatter() #核密度生成颜色密度
library(hexbin)
plot(hexbin(x, y, xbins = 50)) #xbins分割数
detach("package:hexbin", unload=TRUE)

## 马赛克图
library(vcd)
mosaic(~ Class + Sex + Age + Survived, data = Titanic,
       main = "Survival on the Titanic", shade = TRUE, legend = TRUE)
 #蓝色表明, 在假定其他因素与生存率无关的情况下, 生存率超过预期值
detach("package:vcd", unload=TRUE)

## image(绘制三维地形图)
image(volcano, col = terrain.colors(100), axes = FALSE)  #颜色100渐变, 无坐标
contour(volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = "peru")  #等高线
axis(1, at = seq(0, 1, by = .1))
axis(2, at = seq(0, 1, by = .1))
box()
title(main = "Maunga Whau Volcano", font.main = 4)

##将图形导出图片
jpeg("mpg.jpeg", height=600, width=600, quality = 100)
plot(mpg, mtcars)
dev.off()