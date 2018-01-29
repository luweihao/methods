library(pwr)

## t����
pwr.t.test() #d = (mu1-mu2)/����׼��sigma
pwr.t2n.test() #����������С��ͬ

## ������ANOVA
pwr.anova.test() #f = sqrt(sum(n_i*(mu_i-mu)^2)/N*��������sigma2)

## �����
pwr.r.test() #r=pho

## ����ģ��
pwr.f2.test()

## ��������
pwr.2p.test(h = ES.h(p1, p2))
pwr.2p2n.test() #����n����ͬ

## ��������
pwr.chisq.test(w = ES.w2(P), df = (nrow(P)-1)*(ncol(P)-1)) #P��˫����������

prob <- matrix(c(.42, .03, .1, .28, .07, .1), nrow = 3)
pwr.chisq.test(w = ES.w2(prob), df = (nrow(prob)-1)*(ncol(prob)-1), sig.level = .05, power = .9)

detach("package:pwr", unload=TRUE)