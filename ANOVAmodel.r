table()
aggregate(y, by = list(...), FUN = mean)
 #大致了解数据

library(multcomp)

##单因素ANOVA
fit1 <- aov(response ~ trt, data = cholesterol)
summary(fit1)
##多重均值比较
par(mar=c(5, 4, 6, 2))
tuk <- glht(fit1, linfct = mcp(trt = "Tukey"))
plot(cld(tuk, level = .05), col = "lightgrey")
 #有相同字母的组说明均值差异不显著

##单因素ANCOVA
fit2 <- aov(weight ~ gesttime + dose, data = litter)
 #协变量 + 分组因子
summary(fit2)
library(effects)
effect("dose", fit2)
 #去除协变量效应后的组均值
detach("package:effects", unload=TRUE)
contrast <- rbind("no drug vs. drug" = c(3, -1, -1, -1))
summary(glht(fit2, linfct = mcp(dose = contrast)))
 #自定义的均值假设：c(3, -1, -1, -1)设定第一组和其他三组的均值比较

detach("package:multcomp", unload=TRUE)

##双因素ANOVA
attach(ToothGrowth)
dose <- factor(dose)
fit3 <- aov(len ~ supp*dose)
summary(fit3)
library(HH)
interaction2wt(len ~ supp*dose)
 #可视化结果
detach(ToothGrowth)
detach("package:HH", unload=TRUE)

##重复测量方差分析
CO2$conc <- factor(CO2$conc)
w1b1 <- subset(CO2, Treatment == 'chilled')
fit4 <- aov(uptake ~ conc*Type + Error(Plant/(conc)), w1b1)
summary(fit4)
par(las=2)
par(mar = c(10, 4, 4, 2))
with(w1b1, interaction.plot(conc, Type, uptake,
     type = "b", col = c("red", "blue"), pch = c(16, 18),
     main = "Interaction Plot for Plant Type and Concentration"))

##单因素多元方差分析
library(MASS)
attach(UScereal)
shelf <- factor(shelf)
y <- cbind(calories, fat, sugars)
fit5 <- manova(y ~ shelf)
 #对组间差异进行多元检验
summary(fit5)
TukeyHSD(aov(calories ~ shelf))
 #其中一个因变量的均值差异比较，P值显著有差异
detach(UScereal)
detach("package:MASS", unload=TRUE)

##稳健/非参数MANOVA：方差-协方差均值假设不满足/存在离群点
library(rrcov)
Wilks.test(y, shelf, method = "mcd")
 #y由上得
library(vegan)
adonis(y ~ shelf)
detach("package:vegan", unload=TRUE)
detach("package:rrcov", unload=TRUE)

##置换检验下的方差分析
 #PermutationTest.lmPerm.r