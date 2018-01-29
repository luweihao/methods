library(lmPerm)
#perm = c(
#  "Exact",��ȷ����, ��������С��������
#  "Prob",��������
#  "SPR",������ʱȼ���
#)

## �����Իع�
fit1 <- lmp(weight ~ height, data = women, perm = "Prob")
summary(fit1)
## ����ʽ�ع�
fit2 <- lmp(weight ~ height + I(height^2), data = women, perm = "Prob")
summary(fit2)
##��Ԫ���Իع�
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit3 <- lmp(Murder ~ Population + Illiteracy + Income + Frost, data = states, perm = "Prob")
summary(fit3)
##�н�����Ķ�Ԫ���Իع�
fit4 <- lmp(mpg ~ hp + wt + hp:wt, data = mtcars, perm = "Prob")
summary(fit4)

#seqs = FALSE(Ĭ��), Ψһƽ���ͷ�;
#     = TRUE, R����������������Ĭ�ϵ����ƽ����

##������ANOVA
library(multcomp)
fit1 <- aovp(response ~ trt, data = cholesterol, perm = "Prob")
anova(fit1)
detach("package:multcomp", unload=TRUE)
##������ANCOVA
fit2 <- aovp(weight ~ gesttime + dose, data = litter, perm = "Prob")
 #Э���� + ��������
anova(fit2)
##˫����ANOVA
fit3 <- aovp(len ~ supp*dose, data = ToothGrowth, perm = "Prob")
anova(fit3)

detach("package:lmPerm", unload=TRUE)
