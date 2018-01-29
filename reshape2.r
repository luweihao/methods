library(reshape2)

## mydata
## ID      Time       X1        X2
## 1       1          5         6
## 1       2          3         5
## 2       1          6         1
## 2       2          2         4
md <- melt(mydata, id = c("ID", "Time"))
## ID      Time       variable  value
## 1       1          X1        5
## ...
dcast(md, formula, fun.aggregate)
 #formula: rowvar1 + rowvar2 + (确定各行的内容) ~ colvar1 + colvar2 + (确定各列的内容)
 #