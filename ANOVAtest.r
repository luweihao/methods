library(car)
library(multcomp)

##������ANOVA
qqPlot(lm(response ~ trt, data = cholesterol),
       simulate = TRUE, main = "Q-Q Plot", labels = FALSE)
 #������̬�Լ���
bartlett.test(response ~ trt, data = cholesterol)
 #���鷽������,Pֵ������ͨ��
outlierTest(aov(response ~ trt, data = cholesterol))
 #�����Ⱥ��

detach("package:car", unload=TRUE)


##������ANCOVA
 #��̬�Ժ�ͬ�����Լ��ͬ��
summary(aov(weight ~ gesttime*dose, data = litter))
 #�����������ع�б�ʵ�ͬ���Գ���
library(HH)
ancova(weight ~ gesttime + dose, data = litter)
 #���ӻ���ϵͼ
ancova(weight ~ gesttime*dose, data = litter)
#�ع�б��ͬ���Լ��

detach("package:HH", unload=TRUE)
detach("package:multcomp", unload=TRUE)


##������MANOVA
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
 #�����Ԫ��̬��
outliers <- aq.plot(y)
(1:65)[outliers$outliers]
 #�����Ԫ��Ⱥ��

detach(UScereal)
detach("package:mvoutlier", unload=TRUE)
detach("package:MASS", unload=TRUE)