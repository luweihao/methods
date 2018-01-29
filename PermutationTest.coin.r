library(coin)
## ��ʽ: function_name(formula, data, distribution = )
 #distribution = c(
 #  "exact",��ȷ�ֲ�, ������������������
 #  "asymptotic",�����ֲ�
 #  "approxiamate(B=�ظ�����)",���ؿ����س���
 #)
 
 # y, x ��ֵ����; A, B ��������; C ������������; D, E ��������; y1, y2 ��ƥ�����ֵ����

##��������K�����û�����
  oneway_test(y ~ A)
##Wilcoxon-Mann-Whitney�Ⱥͼ���
  wilcox_test(y ~ A)
##������������û�����
 #Pearson��������, Cochran-Mantel-Haenszel����, ���Թ�������
  chisq_test(A ~ B) #����������ͱ����Ķ�����
  cmh_test(A ~ B | C) #���ݵ���������ͱ������зֲ�, ����������ͱ����Ķ�����
  lbl_test(D ~ E) #�������������ͱ����Ƿ������������
##����ֵ�����Ķ������û�����
 #Spearman����
  spearman_test(y ~ x)
##��������K��������Լ���
 #Wilcoxon�����ȼ���, Friedman����
  wilcoxsign_test(y1 ~ y2) #�������
  friedman_test(y ~ A | C) #�����������
  
library(MASS)
wilcoxsign_test(U1 ~ U2, data = UScrime, distribution = "exact")

detach("package:MASS", unload=TRUE)
detach("package:coin", unload=TRUE)