library(vcd)
## phiϵ��, ����ϵ��, Cramer's Vϵ��
assocstats()
## ������������Cohen's kappaֵ�Լ���Ȩ��kappaֵ
kappa()

## Pearson, Spearman, Kendall���
cor(x, y = NULL, use = "everything", method = c("pearson", "kendall", "spearman"))
cor.test()

##ƫ���
library(ggm)
pcor(u, S)
 #uǰ������ֵ��ʾҪ���������ֵ�ı����±�, ����Ϊ���������±�
 #SΪЭ������
