library(car)
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)

qqPlot(fit, labels = row.names(mtcars), id.method = "identify", simulate = TRUE, main = "Q-Q Plot")
 #��̬�������
summary(powerTransform(states$Murder))
#Υ����̬����ʱ����̬������X^lambda, pval���������任

durbinWatsonTest(fit)
 #pֵ������˵����������ԣ������֮�����

crPlots(fit)
 #�ɷֲв�ͼ, ������Թ�ϵ
boxTidwell(Murder~Population+Illiteracy, data = states)
 #Υ�����Լ���ʱ, ͨ�����Ԥ����������������Ȼ�������������Թ�ϵ

ncvTest(fit)
 #pֵ������˵�����㷽����Լ���
spreadLevelPlot(fit)
 #�����췽����ʱ������Y^p�ݴα任

vif(fit)
 #vif>4���ڶ��ع���������

influencePlot(fit, id.method = "identify", main = "Influence Plot",
              sub = "Circle size is proportional to Cook's distance")
 #��Ⱥ��, �ܸ�ֵ, ǿӰ������Ϣ

detach("package:car", unload=TRUE)