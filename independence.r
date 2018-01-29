## 卡方独立性检验
chisq.test(x)
 #x为二维列联表

## Fisher精确检验
fisher.test(x)
 #x为任意行列数大于等于2的二维列联表

## Cochran-Mantel-Haenszel检验
mantelhaen.test()
 #原假设：两个名义变量在第三个变量的每一层中都是条件独立的

## coin包独立性置换检验
 #PermutationTest.coin.r