library(car)
library(multcomp)

##单因素ANOVA
qqPlot(lm(response ~ trt, data = cholesterol),
       simulate = TRUE, main = "Q-Q Plot", labels = FALSE)
 #检验正态性假设
bartlett.test(response ~ trt, data = cholesterol)
 #检验方差齐性,P值不显著通过
outlierTest(aov(response ~ trt, data = cholesterol))
 #检测离群点

detach("package:car", unload=TRUE)


##单因素ANCOVA
 #正态性和同方差性检测同上
summary(aov(weight ~ gesttime*dose, data = litter))
 #交互项不明显则回归斜率的同质性成立
library(HH)
ancova(weight ~ gesttime + dose, data = litter)
 #可视化关系图
ancova(weight ~ gesttime*dose, data = litter)
#回归斜率同质性检测

detach("package:HH", unload=TRUE)
detach("package:multcomp", unload=TRUE)


##单因素MANOVA
library(MASS)
library(mvoutlier)
attach(UScereal)
y <- cbind(calories, fat, sugars)

d <- mahalanobis(y, colMeans(y), cov(y))
coord <- qqplot(qchisq(ppoints(nrow(y)), df = ncol(y)),
                d, main = "Q-Q Plot Assessing Multivariate Normality",
                ylab = "Mahalanobis D2")
abline(a=0, b=1)
identify(coord$x, coord$y, labels = row.names(UScereal))
 #检验多元正态性
outliers <- aq.plot(y)
(1:65)[outliers$outliers]
 #检验多元离群点

detach(UScereal)
detach("package:mvoutlier", unload=TRUE)
detach("package:MASS", unload=TRUE)