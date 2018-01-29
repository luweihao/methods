All.cyl <- unique(mtcars$cyl)
for(i in 1:length(All.cyl)){
  cyl.i <- All.cyl[i]
  cars.i <- mtcars[mtcars$cyl == cyl.i,]
  Filename <- paste(cyl.i, ".jpg", sep = "")
  jpeg(Filename)
  plot(mtcars$disp, mtcars$mpg,
       xlab = "displacement",
       ylab = "Mile per Gallon",
       main = cyl.i)
  dev.off()
}
