ceiling()
floor()
round(x, digits = n)
options(digits = 2) #�޶������С��������ֵ�λ��

seq(a,b,by=step_c / length=number_d)
rep(c(0,1,2),times=a / each=b)

xor(TRUE, TRUE) = FALSE.
## If one argument evaluates to TRUE and one argument evaluates to FALSE,
## then this function will return TRUE, otherwise it will return FALSE.

factor()
 #labels = ����
 #levels = ����

with()

#mydata$V1��mydata[, 1]����������mydata["V1"]�����ݿ�

##��ע������Lst[[1]]��Lst[1]��'[[...]]'��ѡ�񵥸�Ԫ��ʱʹ�õĲ���
 #������'[...]'��һ��һ����±����������ˣ�ǰ�ߴ����б�Lst�еĵ�һ��
 #���󣬶�������б�����������������Ʋ�����������ָ���Ķ����������
 #�б�Lst�����б��������б�ĵ�һ�������б���������������Ҳ����
 #����ָ���Ķ����

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