glm(formula, family = family(link = "function"), data)

## Logistic 回归, Y服从二项分布
glm(Y ~ X1 + X2 + X3, family = binomial(link = "logit"), data = mydata)

## 泊松回归, Y服从泊松分布
glm(Y ~ X1 + X2 + X3, family = poisson(link = "log"), data = mydata)