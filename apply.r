apply(X, MARGIN, FUN, ...)

## The lapply() function takes a list as input, applies a function 
## to each element of the list, then returns a list of
## the same length as the original one.
lapply(X, FUN, ...)
## ... optional arguments to FUN.

sapply(X, FUN, ...)
## 合并为向量或矩阵

## list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep, 1:4, 4:1)
## mapply() return a list

## tapply函数根据第二个变的不同水平对第一个变量进行运算
x <- c(rnorm(10), runif(10), rnorm(10))
f <- gl(3,10)
f
## 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
## Levels: 1 2 3
tapply(x, f, mean)
## 1          2          3 
## 0.17380982 0.62691894 0.05445667 

mprofits <- tapply(Forbes2000$profits, Forbes2000$category, median, na.rm = TRUE)
## median(Forbes2000$profits)
## [1] NA

vapply()
i39 <- sapply(3:9, seq)
i39
vapply(i39, fivenum,
         +        c(Min. = 0, "1st Qu." = 0, Median = 0, "3rd Qu." = 0, Max. = 0))