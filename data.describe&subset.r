str()  ## structure
head()
summary()

library(pastecs)
stat.desc(x, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)
 #所有值, 空值, 缺失值数量, 最小值, 最大值, 值域, 总和, 中位数, 平均数, 平均数的标准误
 #平均数p=95%的置信区间, 方差, 标准差, 变异系数
 #norm = TRUE 偏度和峰度(以及它们的显著程度，大于1则显著不为零) 
 #Shapiro-Wilk test of normality (normtest.W) and its associated probability (normtest.p)

by(data, INDICES, FUN)
 #INDICES是一个因子或因子组成的列表，定义了分组

table(A, B, ...) #N维
xtabs(~ A + B, data) #二维或以上

edit() #修改数据

subset(leadership, age >= 35 | age < 24, select = c(q1, q2, q3, q4))
#选择了所有age值大于等于35或age值小于24的行, 保留了变量q1到q4

scale(x, center = TRUE, scale = TRUE)
#为数据对象x按列进行中心化(center = TRUE)或标准化(center = TRUE, scale = TRUE)

## aggregate(x, by = list(...), FUN)
aggregate(mtcars, by = list(cyl, gear), FUN = mean, na.rm = TRUE)