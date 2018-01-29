library(car)
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)

qqPlot(fit, labels = row.names(mtcars), id.method = "identify", simulate = TRUE, main = "Q-Q Plot")
 #正态假设检验
summary(powerTransform(states$Murder))
#违反正态假设时，正态化变量X^lambda, pval显著才做变换

durbinWatsonTest(fit)
 #p值不显著说明无自相关性，误差项之间独立

crPlots(fit)
 #成分残差图, 检测线性关系
boxTidwell(Murder~Population+Illiteracy, data = states)
 #违反线性假设时, 通过获得预测变量幂数的最大似然估计来改善线性关系

ncvTest(fit)
 #p值不显著说明满足方差不变性假设
spreadLevelPlot(fit)
 #存在异方差性时，建议Y^p幂次变换

vif(fit)
 #vif>4存在多重共线性问题

influencePlot(fit, id.method = "identify", main = "Influence Plot",
              sub = "Circle size is proportional to Cook's distance")
 #离群点, 杠杆值, 强影响点的信息

detach("package:car", unload=TRUE)