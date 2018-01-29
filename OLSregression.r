lm(formula, data)
 #.  :��ʾ�����������������б���
 #-1 :ɾ���ؾ���
 #I():�������еĽǶ������������е�Ԫ��
## �����Իع�
fit1 <- lm(weight ~ height, data = women)
## ����ʽ�ع�
fit2 <- lm(weight ~ height + I(height^2), data = women)
##��Ԫ���Իع�
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit3 <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
##�н�����Ķ�Ԫ���Իع�
fit4 <- lm(mpg ~ hp + wt + hp:wt, data = mtcars)

##������ģ��: nls()

##����ϵ�����������
confint(fit4, level = 0.95)

##��׼�ع����
par(mfrow=c(2, 2))
plot(fit4)
 #���, 45��ֱ��, ���, Cook����
par(mfrow=c(1, 1))

##car���ع����
 #car.regression.r

##gvlma�� ����ģ�ͼ����ۺ���֤
library(gvlma)
summary(gvlma(fit3))

##�û�����
 #PermutationTest.lmPerm.r