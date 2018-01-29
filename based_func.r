ceiling()
floor()
round(x, digits = n)
options(digits = 2) #限定了输出小数点后数字的位数

seq(a,b,by=step_c / length=number_d)
rep(c(0,1,2),times=a / each=b)

xor(TRUE, TRUE) = FALSE.
## If one argument evaluates to TRUE and one argument evaluates to FALSE,
## then this function will return TRUE, otherwise it will return FALSE.

factor()
 #labels = 名称
 #levels = 排序

with()

#mydata$V1和mydata[, 1]是向量，而mydata["V1"]是数据框。

##请注意区分Lst[[1]]和Lst[1]，'[[...]]'是选择单个元素时使用的操作
 #符，而'[...]'是一个一般的下标操作符。因此，前者代表列表Lst中的第一个
 #对象，而且如果列表已命名，对象的名称并不包含在所指定的对象里；后者是
 #列表Lst的子列表，仅包含列表的第一项。而如果列表已命名，其名称也包含
 #到所指定的对象里。

cut()
aaa <- c(1,2,3,4,5,2,3,4,5,6,7)
labs <- levels(cut(aaa, 3))
cbind(lower = as.numeric( sub("\\((.+),.*", "\\1", labs) ),
      upper = as.numeric( sub("[^,]*,([^]]*)\\]", "\\1", labs) ))


name=strsplit("a a|b b|c c", "|", fixed = TRUE)[[1]]
name
make.names(name)


## txt
read.table()
write.table()
## csv
read.csv(file = "<filename>", row.names = 1)
write.csv()