states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
fit2 <- lm(Murder ~ Population + Illiteracy, data = states)

anova(fit2, fit1)
 #��Pֵ������������Խ�������ģ����ɾ��

AIC(fit1, fit2)
 #AICֵ��С��ģ��Ҫ����ѡ��

library(MASS)
stepAIC(fit1, direction = "backward")
 #�𲽻ع�ģ��

library(leaps)
leaps <- regsubsets(Murder ~ Population + Illiteracy + Income + Frost, data = states, nbest = 4)
 #nbestչʾn����ͬ�Ӽ���С�����ģ��
plot(leaps, scale = "adjr2") #adjr2: ����Rƽ��
library(car)
subsets(leaps, statistic = "cp", main = "Cp Plot for All Subsets Regression")
abline(1, 1, lty = 2, col = "red")
 #Խ�õ�ģ����ؾ����б�ʾ�Ϊ1��ֱ��Խ��