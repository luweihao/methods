## When you are at the R prompt (>):
## Typing skip() allows you to skip the current question;
## Typing play() lets you experiment with R on your own;
## UNTIL you type nxt() which will regain swirl's attention.
## Typing bye() causes swirl to exit. Your progress will be saved.

if(!file.exists("./data")){dir.create("./data")}
##创建文件夹
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv", method = "auto")
restData <- read.csv("./data/restaurants.csv")

table(restData$zipCode %in% c("21212", "21213"))
##显示个数
restData[restData$zipCode %in% c("21212", "21213"),]
##详细列表
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")  #add a logic col
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)  #add a logic col
UKcomp <- subset(Forbes2000, country == "United Kingdom")  #pick up satisfied only
## The way you tell R that you want to select some particular elements
## (i.e. a 'subset') from a vector is by placing an'index vector' 
## in square brackets immediately following the name of the vector.
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g = 4)
table(restData$zipGroups)
## creating categorical variables

data(UCBAdmissions)
Df=as.data.frame(UCBAdmissions)
xtabs(Freq ~ Gender + Admit, data = Df)
##        Admit
## Gender   Admitted Rejected
## Male       1198     1493
## Female      557     1278

data(warpbreaks)
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~ ., data = warpbreaks)
xt
ftable(xt)
