---
title: "Midterm 1"
author: "Claire Chapman"
date: "2021-01-26"
output:
  html_document:
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your code should be organized, clean, and run free from errors. Be sure to **add your name** to the author header above. You may use any resources to answer these questions (including each other), but you may not post questions to Open Stacks or external help sites. There are 12 total questions.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

This exam is due by **12:00p on Thursday, January 28**.  

## Load the tidyverse
If you plan to use any other libraries to complete this assignment then you should load them here.

```r
getwd()
```

```
## [1] "C:/Users/Claire Chapman/Desktop/BIS15W2021_cchapman/midterm 1"
```

```r
library(tidyverse)
```

## Questions
**1. (2 points) Briefly explain how R, RStudio, and GitHub work together to make work flows in data science transparent and repeatable. What is the advantage of using RMarkdown in this context?**  
R is a the program we are using, R Studio is a graphical user interface that we use to interact with and easily use R, and GitHub is an online platform where we can easily share our work from R Studio or receive work from others. RMarkdown is advantageous because it turns your code into a variety of documents, including an html file, that combines code and text in an easy-to read format.

**2. (2 points) What are the three types of `data structures` that we have discussed? Why are we using data frames for BIS 15L?**
We have discussed vectors, matrices, and data frames. We use data frames because they are a common way to organize vectors in R. They can contain data of many different classes and can be used with many useful packages like tidyverse.

In the midterm 1 folder there is a second folder called `data`. Inside the `data` folder, there is a .csv file called `ElephantsMF`. These data are from Phyllis Lee, Stirling University, and are related to Lee, P., et al. (2013), "Enduring consequences of early experiences: 40-year effects on survival and success among African elephants (Loxodonta africana)," Biology Letters, 9: 20130011. [kaggle](https://www.kaggle.com/mostafaelseidy/elephantsmf).  

**3. (2 points) Please load these data as a new object called `elephants`. Use the function(s) of your choice to get an idea of the structure of the data. Be sure to show the class of each variable.**

```r
elephants <- readr::read_csv("data/ElephantsMF.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   Age = col_double(),
##   Height = col_double(),
##   Sex = col_character()
## )
```

```r
glimpse(elephants)
```

```
## Rows: 288
## Columns: 3
## $ Age    <dbl> 1.40, 17.50, 12.75, 11.17, 12.67, 12.67, 12.25, 12.17, 28.17...
## $ Height <dbl> 120.00, 227.00, 235.00, 210.00, 220.00, 189.00, 225.00, 204....
## $ Sex    <chr> "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", ...
```


**4. (2 points) Change the names of the variables to lower case and change the class of the variable `sex` to a factor.**

```r
elephants <- select_all(elephants, tolower)
names(elephants)
```

```
## [1] "age"    "height" "sex"
```

```r
elephants$sex <- as.factor(elephants$sex)
is.factor(elephants$sex)
```

```
## [1] TRUE
```

**5. (2 points) How many male and female elephants are represented in the data?**

```r
elephants %>% 
  group_by(sex) %>% 
  summarise(n=n())
```

```
## # A tibble: 2 x 2
##   sex       n
## * <fct> <int>
## 1 F       150
## 2 M       138
```

**6. (2 points) What is the average age all elephants in the data?**

```r
elephants %>% 
  select(age) %>% 
  summarise(avg_age = mean(age, na.rm = T), n=n())
```

```
## # A tibble: 1 x 2
##   avg_age     n
##     <dbl> <int>
## 1    11.0   288
```

**7. (2 points) How does the average age and height of elephants compare by sex?**

```r
elephants %>% 
  group_by(sex) %>% 
  summarise(avg_age = mean(age, na.rm = T), avg_height = mean(height, na.rm = T), n = n())
```

```
## # A tibble: 2 x 4
##   sex   avg_age avg_height     n
## * <fct>   <dbl>      <dbl> <int>
## 1 F       12.8        190.   150
## 2 M        8.95       185.   138
```

**8. (2 points) How does the average height of elephants compare by sex for individuals over 25 years old. Include the min and max height as well as the number of individuals in the sample as part of your analysis.**

```r
elephants %>% 
  filter(age > 25) %>% 
  group_by(sex) %>%
  summarise(avg_height = mean(height, na.rm = T), min_height = min(height, na.rm = T), max_height = max(height, na.rm = T), n = n())
```

```
## # A tibble: 2 x 5
##   sex   avg_height min_height max_height     n
## * <fct>      <dbl>      <dbl>      <dbl> <int>
## 1 F           233.       206.       278.    25
## 2 M           273.       237.       304.     8
```

For the next series of questions, we will use data from a study on vertebrate community composition and impacts from defaunation in [Gabon, Africa](https://en.wikipedia.org/wiki/Gabon). One thing to notice is that the data include 24 separate transects. Each transect represents a path through different forest management areas.  

Reference: Koerner SE, Poulsen JR, Blanchard EJ, Okouyi J, Clark CJ. Vertebrate community composition and diversity declines along a defaunation gradient radiating from rural villages in Gabon. _Journal of Applied Ecology_. 2016. This paper, along with a description of the variables is included inside the midterm 1 folder.  

**9. (2 points) Load `IvindoData_DryadVersion.csv` and use the function(s) of your choice to get an idea of the overall structure. Change the variables `HuntCat` and `LandUse` to factors.**

```r
vertebrates <- readr::read_csv("data/IvindoData_Dryadversion.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_double(),
##   HuntCat = col_character(),
##   LandUse = col_character()
## )
## i Use `spec()` for the full column specifications.
```

```r
str(vertebrates)
```

```
## tibble [24 x 26] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ TransectID             : num [1:24] 1 2 2 3 4 5 6 7 8 9 ...
##  $ Distance               : num [1:24] 7.14 17.31 18.32 20.85 15.95 ...
##  $ HuntCat                : chr [1:24] "Moderate" "None" "None" "None" ...
##  $ NumHouseholds          : num [1:24] 54 54 29 29 29 29 29 54 25 73 ...
##  $ LandUse                : chr [1:24] "Park" "Park" "Park" "Logging" ...
##  $ Veg_Rich               : num [1:24] 16.7 15.8 16.9 12.4 17.1 ...
##  $ Veg_Stems              : num [1:24] 31.2 37.4 32.3 29.4 36 ...
##  $ Veg_liana              : num [1:24] 5.78 13.25 4.75 9.78 13.25 ...
##  $ Veg_DBH                : num [1:24] 49.6 34.6 42.8 36.6 41.5 ...
##  $ Veg_Canopy             : num [1:24] 3.78 3.75 3.43 3.75 3.88 2.5 4 4 3 3.25 ...
##  $ Veg_Understory         : num [1:24] 2.89 3.88 3 2.75 3.25 3 2.38 2.71 3.25 3.13 ...
##  $ RA_Apes                : num [1:24] 1.87 0 4.49 12.93 0 ...
##  $ RA_Birds               : num [1:24] 52.7 52.2 37.4 59.3 52.6 ...
##  $ RA_Elephant            : num [1:24] 0 0.86 1.33 0.56 1 0 1.11 0.43 2.2 0 ...
##  $ RA_Monkeys             : num [1:24] 38.6 28.5 41.8 19.9 41.3 ...
##  $ RA_Rodent              : num [1:24] 4.22 6.04 1.06 3.66 2.52 1.83 3.1 1.26 4.37 6.31 ...
##  $ RA_Ungulate            : num [1:24] 2.66 12.41 13.86 3.71 2.53 ...
##  $ Rich_AllSpecies        : num [1:24] 22 20 22 19 20 22 23 19 19 19 ...
##  $ Evenness_AllSpecies    : num [1:24] 0.793 0.773 0.74 0.681 0.811 0.786 0.818 0.757 0.773 0.668 ...
##  $ Diversity_AllSpecies   : num [1:24] 2.45 2.31 2.29 2.01 2.43 ...
##  $ Rich_BirdSpecies       : num [1:24] 11 10 11 8 8 10 11 11 11 9 ...
##  $ Evenness_BirdSpecies   : num [1:24] 0.732 0.704 0.688 0.559 0.799 0.771 0.801 0.687 0.784 0.573 ...
##  $ Diversity_BirdSpecies  : num [1:24] 1.76 1.62 1.65 1.16 1.66 ...
##  $ Rich_MammalSpecies     : num [1:24] 11 10 11 11 12 12 12 8 8 10 ...
##  $ Evenness_MammalSpecies : num [1:24] 0.736 0.705 0.65 0.619 0.736 0.694 0.776 0.79 0.821 0.783 ...
##  $ Diversity_MammalSpecies: num [1:24] 1.76 1.62 1.56 1.48 1.83 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   TransectID = col_double(),
##   ..   Distance = col_double(),
##   ..   HuntCat = col_character(),
##   ..   NumHouseholds = col_double(),
##   ..   LandUse = col_character(),
##   ..   Veg_Rich = col_double(),
##   ..   Veg_Stems = col_double(),
##   ..   Veg_liana = col_double(),
##   ..   Veg_DBH = col_double(),
##   ..   Veg_Canopy = col_double(),
##   ..   Veg_Understory = col_double(),
##   ..   RA_Apes = col_double(),
##   ..   RA_Birds = col_double(),
##   ..   RA_Elephant = col_double(),
##   ..   RA_Monkeys = col_double(),
##   ..   RA_Rodent = col_double(),
##   ..   RA_Ungulate = col_double(),
##   ..   Rich_AllSpecies = col_double(),
##   ..   Evenness_AllSpecies = col_double(),
##   ..   Diversity_AllSpecies = col_double(),
##   ..   Rich_BirdSpecies = col_double(),
##   ..   Evenness_BirdSpecies = col_double(),
##   ..   Diversity_BirdSpecies = col_double(),
##   ..   Rich_MammalSpecies = col_double(),
##   ..   Evenness_MammalSpecies = col_double(),
##   ..   Diversity_MammalSpecies = col_double()
##   .. )
```

```r
vertebrates$HuntCat <- as.factor(vertebrates$HuntCat)
is.factor(vertebrates$HuntCat)
```

```
## [1] TRUE
```

```r
vertebrates$LandUse <- as.factor(vertebrates$LandUse)
is.factor(vertebrates$LandUse)
```

```
## [1] TRUE
```

**10. (4 points) For the transects with high and moderate hunting intensity, how does the average diversity of birds and mammals compare?**

```r
vertebrates %>% 
  select(TransectID, HuntCat, Diversity_MammalSpecies, Diversity_BirdSpecies) %>% 
  filter(HuntCat == "High" | HuntCat == "Moderate") %>% 
  summarise(avg_diversity_birds = mean(Diversity_BirdSpecies, na.rm = T), avg_diversity_mammals = mean(Diversity_MammalSpecies, na.rm = T), n = n())
```

```
## # A tibble: 1 x 3
##   avg_diversity_birds avg_diversity_mammals     n
##                 <dbl>                 <dbl> <int>
## 1                1.64                  1.71    15
```

**11. (4 points) One of the conclusions in the study is that the relative abundance of animals drops off the closer you get to a village. Let's try to reconstruct this (without the statistics). How does the relative abundance (RA) of apes, birds, elephants, monkeys, rodents, and ungulates compare between sites that are less than 5km from a village to sites that are greater than 20km from a village? The variable `Distance` measures the distance of the transect from the nearest village. Hint: try using the `across` operator.**  

```r
vertebrates_by_distance <- vertebrates %>% 
  filter(Distance < 5 | Distance > 20) %>% 
  mutate(Distance_Summary = ifelse(Distance < 5, "Less_than5", "Greater_than20")) %>% 
  group_by(Distance_Summary) %>% 
  summarise(across(contains("RA_"), mean, na.rm = T))
vertebrates_by_distance
```

```
## # A tibble: 2 x 7
##   Distance_Summary RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent RA_Ungulate
## * <chr>              <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl>
## 1 Greater_than20      7.21     44.5      0.557        40.1      2.68        4.98
## 2 Less_than5          0.08     70.4      0.0967       24.1      3.66        1.59
```

**12. (4 points) Based on your interest, do one exploratory analysis on the `gabon` data of your choice. This analysis needs to include a minimum of two functions in `dplyr.`**

```r
#Do logging transects have less vegetation than parks?
vertebrates %>% 
  select(TransectID, LandUse, contains("Veg")) %>% 
  filter(LandUse != "Neither") %>% 
  group_by(LandUse) %>% 
  summarise(across(contains("Veg"), mean, na.rm = T), n = n())
```

```
## # A tibble: 2 x 8
##   LandUse Veg_Rich Veg_Stems Veg_liana Veg_DBH Veg_Canopy Veg_Understory     n
## * <fct>      <dbl>     <dbl>     <dbl>   <dbl>      <dbl>          <dbl> <int>
## 1 Logging     14.4      33.5     11.6     45.4       3.50           3.00    13
## 2 Park        16.3      33.5      9.76    44         3.60           3.04     7
```

