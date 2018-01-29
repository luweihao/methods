## Each probability distribution in R has an r*** function (for "random"), 
## a d*** function (for "density"), a p*** (for "probability"), 
## and q*** (for "quantile").
quantile(x, probs = 0.99) #0.99∑÷Œªµ„

 # Distribution              R Name                Additional Arguments
## beta                      beta                  shape1, shape2, ncp
## binomial                  binom                 size, prob
## Cauchy                    cauchy                location, scale
## chi-squared               chisq                 df, ncp
## exponential               exp                   rate
## F                         f                     df1, df1, ncp
## gamma                     gamma                 shape, scale
## geometric                 geom                  prob
## hypergeometric            hyper                 m, n, k
## log-normal                lnorm                 meanlog, sdlog
## logistic                  logis                 location, scale
## negative binomial         nbinom                size, prob
## normal                    norm                  mean, sd
## Poisson                   pois                  lambda
## Student°Øs t               t                     df, ncp
## uniform                   unif                  min, max
## Weibull                   weibull               shape, scale
## Wilcoxon                  wilcox                m, n