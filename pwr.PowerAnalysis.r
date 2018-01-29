library(pwr)

## t检验
pwr.t.test() #d = (mu1-mu2)/误差标准差sigma
pwr.t2n.test() #两组样本大小不同

## 单因素ANOVA
pwr.anova.test() #f = sqrt(sum(n_i*(mu_i-mu)^2)/N*组内误差方差sigma2)

## 相关性
pwr.r.test() #r=pho

## 线性模型
pwr.f2.test()

## 比例检验
pwr.2p.test(h = ES.h(p1, p2))
pwr.2p2n.test() #各组n不相同

## 卡方检验
pwr.chisq.test(w = ES.w2(P), df = (nrow(P)-1)*(ncol(P)-1)) #P是双因素列联表

prob <- matrix(c(.42, .03, .1, .28, .07, .1), nrow = 3)
pwr.chisq.test(w = ES.w2(prob), df = (nrow(prob)-1)*(ncol(prob)-1), sig.level = .05, power = .9)

detach("package:pwr", unload=TRUE)