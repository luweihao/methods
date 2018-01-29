mat<- matrix(c(1,2,3,4,5,6), nrow = 2, byrow = TRUE)
with(svd(mat),{
  matu <<- u
  matd <<- d
  matv <<- v
})
matu %*% diag(matd) %*% t(matv)