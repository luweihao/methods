glm(formula, family = family(link = "function"), data)

## Logistic �ع�, Y���Ӷ���ֲ�
glm(Y ~ X1 + X2 + X3, family = binomial(link = "logit"), data = mydata)

## ���ɻع�, Y���Ӳ��ɷֲ�
glm(Y ~ X1 + X2 + X3, family = poisson(link = "log"), data = mydata)