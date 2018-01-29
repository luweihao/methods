lm(formula, data)
 #.  :表示包含除因变量外的所有变量
 #-1 :删除截距项
 #I():从算数中的角度来解释括号中的元素
## 简单线性回归
fit1 <- lm(weight ~ height, data = women)
## 多项式回归
fit2 <- lm(weight ~ height + I(height^2), data = women)
##多元线性回归
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit3 <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
##有交互项的多元线性回归
fit4 <- lm(mpg ~ hp + wt + hp:wt, data = mtcars)

##非线性模型: nls()

##各项系数的区间估计
confint(fit4, level = 0.95)

##标准回归诊断
par(mfrow=c(2, 2))
plot(fit4)
 #随机, 45度直线, 随机, Cook距离
par(mfrow=c(1, 1))

##car包回归诊断
 #car.regression.r

##gvlma包 线性模型假设综合验证
library(gvlma)
summary(gvlma(fit3))

##置换检验
 #PermutationTest.lmPerm.r