library(vcd)
## phi系数, 列联系数, Cramer's V系数
assocstats()
## 计算混淆矩阵的Cohen's kappa值以及加权的kappa值
kappa()

## Pearson, Spearman, Kendall相关
cor(x, y = NULL, use = "everything", method = c("pearson", "kendall", "spearman"))
cor.test()

##偏相关
library(ggm)
pcor(u, S)
 #u前两个数值表示要计算相关数值的变量下标, 其余为条件变量下标
 #S为协方差阵
