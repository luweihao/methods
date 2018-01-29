                ## tidyr package ##
## gather():
## seperate():
## spread():

## students
##   grade male female
## 1     A    1      5
## 2     B    5      0
## 3     C    5      2
## 4     D    5      5
## 5     E    7      4
gather(students, sex, count, -grade)
##    grade    sex count
## 1      A   male     1
## 2      B   male     5
## 3      C   male     5
## 4      D   male     5
## 5      E   male     7
## 6      A female     5
## 7      B female     0
## 8      C female     2
## 9      D female     5
## 10     E female     4

## students2
##   grade male_1 female_1 male_2 female_2
## 1     A      3        4      3        4
## 2     B      6        4      3        5
## 3     C      7        4      3        8
## 4     D      4        0      8        1
## 5     E      1        1      2        7
students2 %>%
  gather(sex_class, count, -grade) %>%
  separate(col = sex_class, into = c("sex", "class")) %>%
  print

## students3
##     name    test class1 class2 class3 class4 class5
## 1  Sally midterm      A   <NA>      B   <NA>   <NA>
## 2  Sally   final      C   <NA>      C   <NA>   <NA>
## 3   Jeff midterm   <NA>      D   <NA>      A   <NA>
## 4   Jeff   final   <NA>      E   <NA>      C   <NA>
## 5  Roger midterm   <NA>      C   <NA>   <NA>      B
## 6  Roger   final   <NA>      A   <NA>   <NA>      A
## 7  Karen midterm   <NA>   <NA>      C      A   <NA>
## 8  Karen   final   <NA>   <NA>      C      A   <NA>
## 9  Brian midterm      B   <NA>   <NA>   <NA>      A
## 10 Brian   final      B   <NA>   <NA>   <NA>      C
students3 %>%
  gather(class, grade, class1:class5 , na.rm = TRUE) %>%
  print
##     name    test  class grade
## 1  Sally midterm class1     A
## 2  Sally   final class1     C
## 9  Brian midterm class1     B
## 10 Brian   final class1     B
## 13  Jeff midterm class2     D
## 14  Jeff   final class2     E
## 15 Roger midterm class2     C
## 16 Roger   final class2     A
## 21 Sally midterm class3     B
## 22 Sally   final class3     C
## 27 Karen midterm class3     C
## 28 Karen   final class3     C
## 33  Jeff midterm class4     A
## 34  Jeff   final class4     C
## 37 Karen midterm class4     A
## 38 Karen   final class4     A
## 45 Roger midterm class5     B
## 46 Roger   final class5     A
## 49 Brian midterm class5     A
## 50 Brian   final class5     C
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  print
##     name  class final midterm
## 1  Brian class1     B       B
## 2  Brian class5     C       A
## 3   Jeff class2     E       D
## 4   Jeff class4     C       A
## 5  Karen class3     C       C
## 6  Karen class4     A       A
## 7  Roger class2     A       C
## 8  Roger class5     A       B
## 9  Sally class1     C       A
## 10 Sally class3     C       B

## sat
## # A tibble: 6 x 10
##   score_range read_male read_fem read_total math_male math_fem math_total write_male write_fem write_total
##         <chr>     <int>    <int>      <int>     <int>    <int>      <int>      <int>     <int>       <int>
## 1     700-800     40151    38898      79049     74461    46040     120501      31574     39101       70675
## 2     600-690    121950   126084     248034    162564   133954     296518     100963    125368      226331
## 3     500-590    227141   259553     486694    233141   257678     490819     202326    247239      449565
## 4     400-490    242554   296793     539347    204670   288696     493366     262623    302933      565556
## 5     300-390    113568   133473     247041     82468   131025     213493     146106    144381      290487
## 6     200-290     30728    29154      59882     18788    26562      45350      32500     24933       57433
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex"))
## # A tibble: 36 x 4
##    score_range  part   sex  count
##  *       <chr> <chr> <chr>  <int>
##  1     700-800  read  male  40151
##  2     600-690  read  male 121950
##  3     500-590  read  male 227141
##  4     400-490  read  male 242554
##  5     300-390  read  male 113568
##  6     200-290  read  male  30728
##  7     700-800  read   fem  38898
##  8     600-690  read   fem 126084
##  9     500-590  read   fem 259553
## 10     400-490  read   fem 296793
## # ... with 26 more rows
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part, sex) %>%
  mutate(total = sum(count),
         prop = count / total
  ) %>% print
## # A tibble: 36 x 6
## # Groups:   part, sex [6]
##    score_range  part   sex  count  total       prop
##          <chr> <chr> <chr>  <int>  <int>      <dbl>
##  1     700-800  read  male  40151 776092 0.05173485
##  2     600-690  read  male 121950 776092 0.15713343
##  3     500-590  read  male 227141 776092 0.29267278
##  4     400-490  read  male 242554 776092 0.31253253
##  5     300-390  read  male 113568 776092 0.14633317
##  6     200-290  read  male  30728 776092 0.03959324
##  7     700-800  read   fem  38898 883955 0.04400450
##  8     600-690  read   fem 126084 883955 0.14263622
##  9     500-590  read   fem 259553 883955 0.29362694
## 10     400-490  read   fem 296793 883955 0.33575578
## # ... with 26 more rows