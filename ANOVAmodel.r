table()
aggregate(y, by = list(...), FUN = mean)
 #�����˽�����

library(multcomp)

##������ANOVA
fit1 <- aov(response ~ trt, data = cholesterol)
summary(fit1)
##���ؾ�ֵ�Ƚ�
par(mar=c(5, 4, 6, 2))
tuk <- glht(fit1, linfct = mcp(trt = "Tukey"))
plot(cld(tuk, level = .05), col = "lightgrey")
 #����ͬ��ĸ����˵����ֵ���첻����

##������ANCOVA
fit2 <- aov(weight ~ gesttime + dose, data = litter)
 #Э���� + ��������
summary(fit2)
library(effects)
effect("dose", fit2)
 #ȥ��Э����ЧӦ������ֵ
detach("package:effects", unload=TRUE)
contrast <- rbind("no drug vs. drug" = c(3, -1, -1, -1))
summary(glht(fit2, linfct = mcp(dose = contrast)))
 #�Զ���ľ�ֵ���裺c(3, -1, -1, -1)�趨��һ�����������ľ�ֵ�Ƚ�

detach("package:multcomp", unload=TRUE)

##˫����ANOVA
attach(ToothGrowth)
dose <- factor(dose)
fit3 <- aov(len ~ supp*dose)
summary(fit3)
library(HH)
interaction2wt(len ~ supp*dose)
 #���ӻ����
detach(ToothGrowth)
detach("package:HH", unload=TRUE)

##�ظ������������
CO2$conc <- factor(CO2$conc)
w1b1 <- subset(CO2, Treatment == 'chilled')
fit4 <- aov(uptake ~ conc*Type + Error(Plant/(conc)), w1b1)
summary(fit4)
par(las=2)
par(mar = c(10, 4, 4, 2))
with(w1b1, interaction.plot(conc, Type, uptake,
     type = "b", col = c("red", "blue"), pch = c(16, 18),
     main = "Interaction Plot for Plant Type and Concentration"))

##�����ض�Ԫ�������
library(MASS)
attach(UScereal)
shelf <- factor(shelf)
y <- cbind(calories, fat, sugars)
fit5 <- manova(y ~ shelf)
 #����������ж�Ԫ����
summary(fit5)
TukeyHSD(aov(calories ~ shelf))
 #����һ��������ľ�ֵ����Ƚϣ�Pֵ�����в���
detach(UScereal)
detach("package:MASS", unload=TRUE)

##�Ƚ�/�ǲ���MANOVA������-Э�����ֵ���費����/������Ⱥ��
library(rrcov)
Wilks.test(y, shelf, method = "mcd")
 #y���ϵ�
library(vegan)
adonis(y ~ shelf)
detach("package:vegan", unload=TRUE)
detach("package:rrcov", unload=TRUE)

##�û������µķ������
 #PermutationTest.lmPerm.r