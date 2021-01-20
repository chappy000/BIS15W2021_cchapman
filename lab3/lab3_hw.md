---
title: "Lab 3 Homework"
author: "Claire Chapman"
date: "2021-01-19"
output:
  html_document:
    keep_md: yes
    theme: spacelab
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
getwd()
```

```
## [1] "D:/TA files/Winter2021 BIS15L/students_rep/BIS15W2021_cchapman/lab3"
```

## Mammals Sleep
1. For this assignment, we are going to use built-in data on mammal sleep patterns. From which publication are these data taken from? Since the data are built-in you can use the help function in R.

```r
?msleep
```

```
## starting httpd help server ... done
```
This data set was taken from V.M. Savage and G. B. West. A quantitative, theoretical framework for understanding mammalian sleep. Proceedings of the National Academy of Sciences

2. Store these data into a new data frame `sleep`.

```r
sleep <- msleep
```

3. What are the dimensions of this data frame (variables and observations)? How do you know? Please show the *code* that you used to determine this below.  83 observations of 11 variables

```r
dim(sleep)
```

```
## [1] 83 11
```

4. Are there any NAs in the data? How did you determine this? Please show your code. 
There are NAs wherever there is a "TRUE"

```r
anyNA(sleep)
```

```
## [1] TRUE
```

5. Show a list of the column names is this data frame.

```r
colnames(sleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```

6. How many herbivores are represented in the data?  

```r
herbivores <- subset(sleep, vore=="herbi")
herbivores
```

```
## # A tibble: 32 x 11
##    name  genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##    <chr> <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
##  1 Moun~ Aplo~ herbi Rode~ nt                  14.4       2.4      NA       9.6
##  2 Cow   Bos   herbi Arti~ domesticated         4         0.7       0.667  20  
##  3 Thre~ Brad~ herbi Pilo~ <NA>                14.4       2.2       0.767   9.6
##  4 Roe ~ Capr~ herbi Arti~ lc                   3        NA        NA      21  
##  5 Goat  Capri herbi Arti~ lc                   5.3       0.6      NA      18.7
##  6 Guin~ Cavis herbi Rode~ domesticated         9.4       0.8       0.217  14.6
##  7 Chin~ Chin~ herbi Rode~ domesticated        12.5       1.5       0.117  11.5
##  8 Tree~ Dend~ herbi Hyra~ lc                   5.3       0.5      NA      18.7
##  9 Asia~ Elep~ herbi Prob~ en                   3.9      NA        NA      20.1
## 10 Horse Equus herbi Peri~ domesticated         2.9       0.6       1      21.1
## # ... with 22 more rows, and 2 more variables: brainwt <dbl>, bodywt <dbl>
```

7. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.

```r
small <- subset(sleep, bodywt<= 1)
large <- subset(sleep, bodywt >= 200)
```

8. What is the mean weight for both the small and large mammals?

```r
mean(small$bodywt)
```

```
## [1] 0.2596667
```


```r
mean(large$bodywt)
```

```
## [1] 1747.071
```

9. Using a similar approach as above, do large or small animals sleep longer on average?
Small animals sleep longer on average than large animals

```r
avg_small_sleep <- mean(small$sleep_total)
avg_small_sleep
```

```
## [1] 12.65833
```


```r
avg_large_sleep <- mean(large$sleep_total)
avg_large_sleep
```

```
## [1] 3.3
```

```r
avg_small_sleep>avg_large_sleep
```

```
## [1] TRUE
```

10. Which animal is the sleepiest among the entire dataframe?

```r
max(sleep$sleep_total)
```

```
## [1] 19.9
```


```r
sleepiest <- subset(sleep, sleep$sleep_total == 19.9)
sleepiest
```

```
## # A tibble: 1 x 11
##   name  genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##   <chr> <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
## 1 Litt~ Myot~ inse~ Chir~ <NA>                19.9         2         0.2   4.1
## # ... with 2 more variables: brainwt <dbl>, bodywt <dbl>
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
