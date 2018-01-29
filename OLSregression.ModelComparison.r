states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
fit2 <- lm(Murder ~ Population + Illiteracy, data = states)

anova(fit2, fit1)
 #若P值不显著，则可以将变量从模型中删除

AIC(fit1, fit2)
 #AIC值较小的模型要优先选择

library(MASS)
stepAIC(fit1, direction = "backward")
 #逐步回归模型

library(leaps)
leaps <- regsubsets(Murder ~ Population + Illiteracy + Income + Frost, data = states, nbest = 4)
 #nbest展示n个不同子集大小的最佳模型
plot(leaps, scale = "adjr2") #adjr2: 调整R平方
library(car)
subsets(leaps, statistic = "cp", main = "Cp Plot for All Subsets Regression")
abline(1, 1, lty = 2, col = "red")
 #越好的模型离截距项和斜率均为1的直线越近