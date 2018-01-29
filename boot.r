library(boot)
bootobject <- boot(data, statistic, R, ...)
 #statistic: 生成k个统计量的函数
 #R: 自助抽样次数
boot.ci(bootobject, conf = 0.95, type)
 #conf: 置信区间
 #type = c("norm","basic", "stud",
 #       "perc", 分位数展示样本均值
 #       "bca", 根据偏差对区间做简单调整(推荐)
 #       "all" 默认) 

##获取R平方值
rsq <- function(formula, data, indices){
  d <- data[indices,] #必须声明, 用来选择样本
  fit <- lm(formula, data = d)
  return(summary(fit)$r.square)
}
results1 <- boot(data = mtcars, statistic = rsq,
                 R = 1000, formula = mpg ~ wt + disp)
print(results1)
plot(results1)
boot.ci(results1, type = c("perc", "bca"))

##获取三个回归系数(截距项, 车重, 发动机)排量95%置信区间
bs <- function(formula, data, indices){
  d <- data[indices,] #必须声明, 用来选择样本
  fit <- lm(formula, data = d)
  return(coef(fit))
}
results2 <- boot(data = mtcars, statistic = bs,
                 R = 1000, formula = mpg ~ wt + disp)
print(results2, index = 1) #index指明所分析bootobject$t的列
plot(results2, index = 2)
boot.ci(results2, type = "bca", index = 3)
