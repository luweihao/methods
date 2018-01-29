str()  ## structure
head()
summary()

library(pastecs)
stat.desc(x, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)
 #����ֵ, ��ֵ, ȱʧֵ����, ��Сֵ, ���ֵ, ֵ��, �ܺ�, ��λ��, ƽ����, ƽ�����ı�׼��
 #ƽ����p=95%����������, ����, ��׼��, ����ϵ��
 #norm = TRUE ƫ�Ⱥͷ��(�Լ����ǵ������̶ȣ�����1��������Ϊ��) 
 #Shapiro-Wilk test of normality (normtest.W) and its associated probability (normtest.p)

by(data, INDICES, FUN)
 #INDICES��һ�����ӻ�������ɵ��б������˷���

table(A, B, ...) #Nά
xtabs(~ A + B, data) #��ά������

edit() #�޸�����

subset(leadership, age >= 35 | age < 24, select = c(q1, q2, q3, q4))
#ѡ��������ageֵ���ڵ���35��ageֵС��24����, �����˱���q1��q4

scale(x, center = TRUE, scale = TRUE)
#Ϊ���ݶ���x���н������Ļ�(center = TRUE)���׼��(center = TRUE, scale = TRUE)

## aggregate(x, by = list(...), FUN)
aggregate(mtcars, by = list(cyl, gear), FUN = mean, na.rm = TRUE)