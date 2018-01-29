library(boot)
bootobject <- boot(data, statistic, R, ...)
 #statistic: ����k��ͳ�����ĺ���
 #R: ������������
boot.ci(bootobject, conf = 0.95, type)
 #conf: ��������
 #type = c("norm","basic", "stud",
 #       "perc", ��λ��չʾ������ֵ
 #       "bca", ����ƫ����������򵥵���(�Ƽ�)
 #       "all" Ĭ��) 

##��ȡRƽ��ֵ
rsq <- function(formula, data, indices){
  d <- data[indices,] #��������, ����ѡ������
  fit <- lm(formula, data = d)
  return(summary(fit)$r.square)
}
results1 <- boot(data = mtcars, statistic = rsq,
                 R = 1000, formula = mpg ~ wt + disp)
print(results1)
plot(results1)
boot.ci(results1, type = c("perc", "bca"))

##��ȡ�����ع�ϵ��(�ؾ���, ����, ������)����95%��������
bs <- function(formula, data, indices){
  d <- data[indices,] #��������, ����ѡ������
  fit <- lm(formula, data = d)
  return(coef(fit))
}
results2 <- boot(data = mtcars, statistic = bs,
                 R = 1000, formula = mpg ~ wt + disp)
print(results2, index = 1) #indexָ��������bootobject$t����
plot(results2, index = 2)
boot.ci(results2, type = "bca", index = 3)
