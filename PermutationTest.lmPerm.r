library(lmPerm)
#perm = c(
#  "Exact",精确检验, 仅适用于小样本问题
#  "Prob",抽样检验
#  "SPR",贯序概率比检验
#)

## 简单线性回归
fit1 <- lmp(weight ~ height, data = women, perm = "Prob")
summary(fit1)
## 多项式回归
fit2 <- lmp(weight ~ height + I(height^2), data = women, perm = "Prob")
summary(fit2)
##多元线性回归
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit3 <- lmp(Murder ~ Population + Illiteracy + Income + Frost, data = states, perm = "Prob")
summary(fit3)
##有交互项的多元线性回归
fit4 <- lmp(mpg ~ hp + wt + hp:wt, data = mtcars, perm = "Prob")
summary(fit4)

#seqs = FALSE(默认), 唯一平方和法;
#     = TRUE, R参数化方差分析设计默认的序贯平方和

##单因素ANOVA
library(multcomp)
fit1 <- aovp(response ~ trt, data = cholesterol, perm = "Prob")
anova(fit1)
detach("package:multcomp", unload=TRUE)
##单因素ANCOVA
fit2 <- aovp(weight ~ gesttime + dose, data = litter, perm = "Prob")
 #协变量 + 分组因子
anova(fit2)
##双因素ANOVA
fit3 <- aovp(len ~ supp*dose, data = ToothGrowth, perm = "Prob")
anova(fit3)

detach("package:lmPerm", unload=TRUE)
