library(coin)
## 格式: function_name(formula, data, distribution = )
 #distribution = c(
 #  "exact",精确分布, 仅可用于两样本问题
 #  "asymptotic",渐进分布
 #  "approxiamate(B=重复次数)",蒙特卡洛重抽样
 #)
 
 # y, x 数值变量; A, B 分类因子; C 类别型区组变量; D, E 有序因子; y1, y2 相匹配的数值变量

##两样本和K样本置换检验
  oneway_test(y ~ A)
##Wilcoxon-Mann-Whitney秩和检验
  wilcox_test(y ~ A)
##列联表独立性置换检验
 #Pearson卡方检验, Cochran-Mantel-Haenszel检验, 线性关联检验
  chisq_test(A ~ B) #检验两类别型变量的独立性
  cmh_test(A ~ B | C) #根据第三个类别型变量进行分层, 检验两类别型变量的独立性
  lbl_test(D ~ E) #检验两个有序型变量是否存在线性趋势
##两数值变量的独立性置换检验
 #Spearman检验
  spearman_test(y ~ x)
##两样本和K样本相关性检验
 #Wilcoxon符号秩检验, Friedman检验
  wilcoxsign_test(y1 ~ y2) #两配对组
  friedman_test(y ~ A | C) #多于两配对组
  
library(MASS)
wilcoxsign_test(U1 ~ U2, data = UScrime, distribution = "exact")

detach("package:MASS", unload=TRUE)
detach("package:coin", unload=TRUE)