## select(): return a subset of the columns of a data frame 列筛选
## filter(): extract a subset of rows from a data frame based on logical conditions 行筛选
## arrange(): reorder rows of a data frame 列排序
## rename(): rename variables in a data frame 列改名
## mutate(): add new variables / columns or transform existing variables 添加列
## transmute(): Only keep the new variables
## use sample_n() for a fixed number and sample_frac() for a fixed fraction.
## group_by():按类别分组
## summarise() / summarize(): generate summary statistics of different variables in the data frame,
 # possibly within strata 分组总结
## bind_rows() / bind_cols(): 连接行列

data("storms")

select(storms, ...)
## Useful select functions
## :, c()
## starts_with(), ends_with(), contains()
## To drop variables, use -

filter(storms, ...)
## Useful filter functions
## ==, >, >= etc
## &, |, !, xor()
## is.na()
## between(), near()

storms1 <- arrange(storms, long, desc(wind))
storms2 <- rename(storms, latitude = lat)
storms3 <- mutate(storms, latdetrend = lat-mean(lat, na.rm = TRUE))

storms4 <- select(storms, name:pressure)
storms4 <- mutate(storms4, windstrong = factor(wind > 50, labels = c("weak", "strong")))
wind <- group_by(storms4, windstrong)
summarize(wind, lat = mean(lat, na.rm = TRUE), month = median(month))

storms %>% 
  select(name:pressure) %>%
  mutate(windstrong = factor(wind > 50, labels = c("weak", "strong"))) %>%
  group_by(windstrong) %>%
  summarize(lat = mean(lat, na.rm = TRUE), month = median(month))

## passed
##    name class final
## 1 Brian     1     B
## 2 Roger     2     A
## 3 Roger     5     A
## 4 Karen     4     A
## failed
##    name class final
## 1 Brian     5     C
## 2 Sally     1     C
## 3 Sally     3     C
## 4  Jeff     2     E
## 5  Jeff     4     C
## 6 Karen     3     C
passed <- mutate(passed, status = "passed")
failed <- mutate(failed, status = "failed")
bind_rows(passed, failed)
