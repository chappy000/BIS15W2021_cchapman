---
title: "Lab 7 Homework"
author: "Claire Chapman"
date: "2021-02-02"
output:
  html_document:
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(skimr)
```

## Data
**1. For this homework, we will use two different data sets. Please load `amniota` and `amphibio`.**  

`amniota` data:  
Myhrvold N, Baldridge E, Chan B, Sivam D, Freeman DL, Ernest SKM (2015). “An amniote life-history
database to perform comparative analyses with birds, mammals, and reptiles.” _Ecology_, *96*, 3109.
doi: 10.1890/15-0846.1 (URL: https://doi.org/10.1890/15-0846.1).

```r
amniota <- readr::read_csv("data/amniota.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_double(),
##   class = col_character(),
##   order = col_character(),
##   family = col_character(),
##   genus = col_character(),
##   species = col_character(),
##   common_name = col_character()
## )
## i Use `spec()` for the full column specifications.
```

`amphibio` data:  
Oliveira BF, São-Pedro VA, Santos-Barrera G, Penone C, Costa GC (2017). “AmphiBIO, a global database
for amphibian ecological traits.” _Scientific Data_, *4*, 170123. doi: 10.1038/sdata.2017.123 (URL:
https://doi.org/10.1038/sdata.2017.123).

```r
amphibio <- readr::read_csv("data/amphibio.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_double(),
##   id = col_character(),
##   Order = col_character(),
##   Family = col_character(),
##   Genus = col_character(),
##   Species = col_character(),
##   Seeds = col_logical(),
##   OBS = col_logical()
## )
## i Use `spec()` for the full column specifications.
```

```
## Warning: 125 parsing failures.
##  row col           expected                                                           actual                file
## 1410 OBS 1/0/T/F/TRUE/FALSE Identified as P. appendiculata in Boquimpani-Freitas et al. 2002 'data/amphibio.csv'
## 1416 OBS 1/0/T/F/TRUE/FALSE Identified as T. miliaris in Giaretta and Facure 2004            'data/amphibio.csv'
## 1447 OBS 1/0/T/F/TRUE/FALSE Considered endangered by Soto-Azat et al. 2013                   'data/amphibio.csv'
## 1448 OBS 1/0/T/F/TRUE/FALSE Considered extinct by Soto-Azat et al. 2013                      'data/amphibio.csv'
## 1471 OBS 1/0/T/F/TRUE/FALSE nomem dubitum                                                    'data/amphibio.csv'
## .... ... .................. ................................................................ ...................
## See problems(...) for more details.
```

## Questions  
**2. Do some exploratory analysis of the `amniota` data set. Use the function(s) of your choice. Try to get an idea of how NA's are represented in the data.**  


```r
summary(amniota)
```

```
##     class              order              family             genus          
##  Length:21322       Length:21322       Length:21322       Length:21322      
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##    species            subspecies   common_name        female_maturity_d 
##  Length:21322       Min.   :-999   Length:21322       Min.   :-30258.7  
##  Class :character   1st Qu.:-999   Class :character   1st Qu.:  -999.0  
##  Mode  :character   Median :-999   Mode  :character   Median :  -999.0  
##                     Mean   :-999                      Mean   :  -723.7  
##                     3rd Qu.:-999                      3rd Qu.:  -999.0  
##                     Max.   :-999                      Max.   :  9131.2  
##  litter_or_clutch_size_n litters_or_clutches_per_y adult_body_mass_g  
##  Min.   :-999.000        Min.   :-999.0            Min.   :     -999  
##  1st Qu.:-999.000        1st Qu.:-999.0            1st Qu.:        4  
##  Median :   1.692        Median :-999.0            Median :       24  
##  Mean   :-383.909        Mean   :-766.8            Mean   :    29107  
##  3rd Qu.:   3.200        3rd Qu.:-999.0            3rd Qu.:      135  
##  Max.   : 156.000        Max.   :  52.0            Max.   :149000000  
##  maximum_longevity_y  gestation_d       weaning_d     
##  Min.   :-999.000    Min.   :-999.0   Min.   :-999.0  
##  1st Qu.:-999.000    1st Qu.:-999.0   1st Qu.:-999.0  
##  Median :-999.000    Median :-999.0   Median :-999.0  
##  Mean   :-737.061    Mean   :-874.9   Mean   :-892.4  
##  3rd Qu.:   1.083    3rd Qu.:-999.0   3rd Qu.:-999.0  
##  Max.   : 211.000    Max.   :7396.9   Max.   :1826.2  
##  birth_or_hatching_weight_g weaning_weight_g     egg_mass_g     
##  Min.   :   -999.0          Min.   :    -999   Min.   :-999.00  
##  1st Qu.:   -999.0          1st Qu.:    -999   1st Qu.:-999.00  
##  Median :   -999.0          Median :    -999   Median :-999.00  
##  Mean   :    -88.6          Mean   :    1116   Mean   :-739.64  
##  3rd Qu.:   -999.0          3rd Qu.:    -999   3rd Qu.:   0.56  
##  Max.   :2250000.0          Max.   :17000000   Max.   :1500.00  
##   incubation_d    fledging_age_d    longevity_y       male_maturity_d 
##  Min.   :-999.0   Min.   :-999.0   Min.   :-999.000   Min.   :-999.0  
##  1st Qu.:-999.0   1st Qu.:-999.0   1st Qu.:-999.000   1st Qu.:-999.0  
##  Median :-999.0   Median :-999.0   Median :-999.000   Median :-999.0  
##  Mean   :-820.5   Mean   :-909.4   Mean   :-737.821   Mean   :-827.8  
##  3rd Qu.:-999.0   3rd Qu.:-999.0   3rd Qu.:   1.042   3rd Qu.:-999.0  
##  Max.   :1762.0   Max.   : 345.0   Max.   : 177.000   Max.   :9131.2  
##  inter_litter_or_interbirth_interval_y female_body_mass_g male_body_mass_g 
##  Min.   :-999.000                      Min.   :   -999    Min.   :   -999  
##  1st Qu.:-999.000                      1st Qu.:   -999    1st Qu.:   -999  
##  Median :-999.000                      Median :   -999    Median :   -999  
##  Mean   :-932.502                      Mean   :     41    Mean   :   1243  
##  3rd Qu.:-999.000                      3rd Qu.:     14    3rd Qu.:     13  
##  Max.   :   4.847                      Max.   :3700000    Max.   :4545000  
##  no_sex_body_mass_g   egg_width_mm    egg_length_mm    fledging_mass_g 
##  Min.   :     -999   Min.   :-999.0   Min.   :-999.0   Min.   :-999.0  
##  1st Qu.:     -999   1st Qu.:-999.0   1st Qu.:-999.0   1st Qu.:-999.0  
##  Median :     -999   Median :-999.0   Median :-999.0   Median :-999.0  
##  Mean   :    30689   Mean   :-970.5   Mean   :-968.9   Mean   :-984.6  
##  3rd Qu.:       28   3rd Qu.:-999.0   3rd Qu.:-999.0   3rd Qu.:-999.0  
##  Max.   :136000000   Max.   : 125.0   Max.   : 455.0   Max.   :9992.0  
##   adult_svl_cm       male_svl_cm     female_svl_cm    birth_or_hatching_svl_cm
##  Min.   :-999.000   Min.   :-999.0   Min.   :-999.0   Min.   :-999.0          
##  1st Qu.:-999.000   1st Qu.:-999.0   1st Qu.:-999.0   1st Qu.:-999.0          
##  Median :-999.000   Median :-999.0   Median :-999.0   Median :-999.0          
##  Mean   :-656.153   Mean   :-985.1   Mean   :-947.4   Mean   :-940.3          
##  3rd Qu.:   9.499   3rd Qu.:-999.0   3rd Qu.:-999.0   3rd Qu.:-999.0          
##  Max.   :3049.000   Max.   : 315.2   Max.   :1125.0   Max.   : 760.0          
##  female_svl_at_maturity_cm female_body_mass_at_maturity_g no_sex_svl_cm   
##  Min.   :-999.0            Min.   :  -999.0               Min.   :-999.0  
##  1st Qu.:-999.0            1st Qu.:  -999.0               1st Qu.:-999.0  
##  Median :-999.0            Median :  -999.0               Median :-999.0  
##  Mean   :-989.4            Mean   :  -980.6               Mean   :-747.1  
##  3rd Qu.:-999.0            3rd Qu.:  -999.0               3rd Qu.:-999.0  
##  Max.   : 580.0            Max.   :194000.0               Max.   :3300.0  
##  no_sex_maturity_d
##  Min.   : -999.0  
##  1st Qu.: -999.0  
##  Median : -999.0  
##  Mean   : -942.6  
##  3rd Qu.: -999.0  
##  Max.   :14610.0
```

```r
#I don't see any actual "NA"s in the data but lots of "-999"
```

```r
amniota %>% 
  purrr::map_df(~sum(is.na(.)))
```

```
## # A tibble: 1 x 36
##   class order family genus species subspecies common_name female_maturity~
##   <int> <int>  <int> <int>   <int>      <int>       <int>            <int>
## 1     0     0      0     0       0          0           0                0
## # ... with 28 more variables: litter_or_clutch_size_n <int>,
## #   litters_or_clutches_per_y <int>, adult_body_mass_g <int>,
## #   maximum_longevity_y <int>, gestation_d <int>, weaning_d <int>,
## #   birth_or_hatching_weight_g <int>, weaning_weight_g <int>, egg_mass_g <int>,
## #   incubation_d <int>, fledging_age_d <int>, longevity_y <int>,
## #   male_maturity_d <int>, inter_litter_or_interbirth_interval_y <int>,
## #   female_body_mass_g <int>, male_body_mass_g <int>, no_sex_body_mass_g <int>,
## #   egg_width_mm <int>, egg_length_mm <int>, fledging_mass_g <int>,
## #   adult_svl_cm <int>, male_svl_cm <int>, female_svl_cm <int>,
## #   birth_or_hatching_svl_cm <int>, female_svl_at_maturity_cm <int>,
## #   female_body_mass_at_maturity_g <int>, no_sex_svl_cm <int>,
## #   no_sex_maturity_d <int>
```

```r
#confirms that there are no actual "NA"s.. yet
```

**3. Do some exploratory analysis of the `amphibio` data set. Use the function(s) of your choice. Try to get an idea of how NA's are represented in the data.**  


```r
summary(amphibio)
```

```
##       id               Order              Family             Genus          
##  Length:6776        Length:6776        Length:6776        Length:6776       
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##    Species               Fos            Ter            Aqu            Arb      
##  Length:6776        Min.   :1      Min.   :1      Min.   :1      Min.   :1     
##  Class :character   1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:1     
##  Mode  :character   Median :1      Median :1      Median :1      Median :1     
##                     Mean   :1      Mean   :1      Mean   :1      Mean   :1     
##                     3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:1     
##                     Max.   :1      Max.   :1      Max.   :1      Max.   :1     
##                     NA's   :6053   NA's   :1104   NA's   :2810   NA's   :4347  
##      Leaves        Flowers      Seeds             Fruits         Arthro    
##  Min.   :1      Min.   :1      Mode:logical   Min.   :1      Min.   :1     
##  1st Qu.:1      1st Qu.:1      TRUE:4         1st Qu.:1      1st Qu.:1     
##  Median :1      Median :1      NA's:6772      Median :1      Median :1     
##  Mean   :1      Mean   :1                     Mean   :1      Mean   :1     
##  3rd Qu.:1      3rd Qu.:1                     3rd Qu.:1      3rd Qu.:1     
##  Max.   :1      Max.   :1                     Max.   :1      Max.   :1     
##  NA's   :6752   NA's   :6772                  NA's   :6774   NA's   :5534  
##       Vert           Diu            Noc           Crepu         Wet_warm   
##  Min.   :1      Min.   :1      Min.   :1      Min.   :1      Min.   :1     
##  1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:1     
##  Median :1      Median :1      Median :1      Median :1      Median :1     
##  Mean   :1      Mean   :1      Mean   :1      Mean   :1      Mean   :1     
##  3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:1     
##  Max.   :1      Max.   :1      Max.   :1      Max.   :1      Max.   :1     
##  NA's   :6657   NA's   :5876   NA's   :5156   NA's   :6608   NA's   :5997  
##     Wet_cold       Dry_warm       Dry_cold     Body_mass_g      
##  Min.   :1      Min.   :1      Min.   :1      Min.   :    0.16  
##  1st Qu.:1      1st Qu.:1      1st Qu.:1      1st Qu.:    2.60  
##  Median :1      Median :1      Median :1      Median :    9.29  
##  Mean   :1      Mean   :1      Mean   :1      Mean   :   94.56  
##  3rd Qu.:1      3rd Qu.:1      3rd Qu.:1      3rd Qu.:   31.82  
##  Max.   :1      Max.   :1      Max.   :1      Max.   :26000.00  
##  NA's   :6625   NA's   :6572   NA's   :6735   NA's   :6185      
##  Age_at_maturity_min_y Age_at_maturity_max_y  Body_size_mm    
##  Min.   :0.25          Min.   : 0.300        Min.   :   8.40  
##  1st Qu.:1.00          1st Qu.: 2.000        1st Qu.:  29.00  
##  Median :2.00          Median : 3.000        Median :  43.00  
##  Mean   :2.14          Mean   : 2.964        Mean   :  66.65  
##  3rd Qu.:3.00          3rd Qu.: 4.000        3rd Qu.:  69.15  
##  Max.   :7.00          Max.   :12.000        Max.   :1520.00  
##  NA's   :6392          NA's   :6392          NA's   :1549     
##  Size_at_maturity_min_mm Size_at_maturity_max_mm Longevity_max_y 
##  Min.   :  8.80          Min.   : 10.10          Min.   :  0.17  
##  1st Qu.: 27.50          1st Qu.: 32.00          1st Qu.:  6.00  
##  Median : 43.00          Median : 50.00          Median : 10.00  
##  Mean   : 56.63          Mean   : 67.46          Mean   : 11.68  
##  3rd Qu.: 58.00          3rd Qu.: 75.50          3rd Qu.: 15.00  
##  Max.   :350.00          Max.   :400.00          Max.   :121.80  
##  NA's   :6529            NA's   :6528            NA's   :6417    
##  Litter_size_min_n Litter_size_max_n Reproductive_output_y
##  Min.   :    1.0   Min.   :    1     Min.   : 0.080       
##  1st Qu.:   18.0   1st Qu.:   30     1st Qu.: 1.000       
##  Median :   80.0   Median :  186     Median : 1.000       
##  Mean   :  530.9   Mean   : 1034     Mean   : 1.034       
##  3rd Qu.:  300.0   3rd Qu.:  700     3rd Qu.: 1.000       
##  Max.   :25000.0   Max.   :45054     Max.   :15.000       
##  NA's   :5153      NA's   :5153      NA's   :2344         
##  Offspring_size_min_mm Offspring_size_max_mm      Dir              Lar        
##  Min.   : 0.200        Min.   : 0.400        Min.   :0.0000   Min.   :0.0000  
##  1st Qu.: 1.400        1st Qu.: 1.600        1st Qu.:0.0000   1st Qu.:0.0000  
##  Median : 2.000        Median : 2.300        Median :0.0000   Median :1.0000  
##  Mean   : 2.455        Mean   : 2.857        Mean   :0.2984   Mean   :0.6921  
##  3rd Qu.: 3.000        3rd Qu.: 3.500        3rd Qu.:1.0000   3rd Qu.:1.0000  
##  Max.   :20.000        Max.   :25.000        Max.   :1.0000   Max.   :1.0000  
##  NA's   :5446          NA's   :5446          NA's   :1079     NA's   :1079    
##       Viv           OBS         
##  Min.   :0.0000   Mode:logical  
##  1st Qu.:0.0000   NA's:6776     
##  Median :0.0000                 
##  Mean   :0.0095                 
##  3rd Qu.:0.0000                 
##  Max.   :1.0000                 
##  NA's   :1079
```

```r
# no negative numbers but actual "NA"s
```

**4. How many total NA's are in each data set? Do these values make sense? Are NA's represented by values?**   


```r
amniota %>%
  summarise(total_NAs = sum(is.na(amniota)))
```

```
## # A tibble: 1 x 1
##   total_NAs
##       <int>
## 1         0
```

```r
#this doesn't make sense, there are NAs represented by negative values
```


```r
amphibio %>% 
  summarise(total_NAs = sum(is.na(amphibio)))
```

```
## # A tibble: 1 x 1
##   total_NAs
##       <int>
## 1    170691
```

**5. Make any necessary replacements in the data such that all NA's appear as "NA".**   

```r
amniota_tidy <- amniota %>%
  na_if("-999") %>% 
  mutate(female_maturity_d_tidy = ifelse(female_maturity_d < 0, NA, female_maturity_d)) %>% 
  select(-female_maturity_d)
summary(amniota_tidy)
```

```
##     class              order              family             genus          
##  Length:21322       Length:21322       Length:21322       Length:21322      
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##    species            subspecies    common_name        litter_or_clutch_size_n
##  Length:21322       Min.   : NA     Length:21322       Min.   :  0.900        
##  Class :character   1st Qu.: NA     Class :character   1st Qu.:  2.000        
##  Mode  :character   Median : NA     Mode  :character   Median :  2.800        
##                     Mean   :NaN                        Mean   :  3.826        
##                     3rd Qu.: NA                        3rd Qu.:  4.150        
##                     Max.   : NA                        Max.   :156.000        
##                     NA's   :21322                      NA's   :8244           
##  litters_or_clutches_per_y adult_body_mass_g   maximum_longevity_y
##  Min.   : 0.120            Min.   :        0   Min.   :  0.083    
##  1st Qu.: 1.000            1st Qu.:       15   1st Qu.:  6.000    
##  Median : 1.050            Median :       44   Median : 12.308    
##  Mean   : 1.752            Mean   :    37493   Mean   : 16.466    
##  3rd Qu.: 2.000            3rd Qu.:      238   3rd Qu.: 22.000    
##  Max.   :52.000            Max.   :149000000   Max.   :211.000    
##  NA's   :16374             NA's   :4645        NA's   :15822      
##   gestation_d        weaning_d       birth_or_hatching_weight_g
##  Min.   :   5.00   Min.   :   1.94   Min.   :0.00e+00          
##  1st Qu.:  29.91   1st Qu.:  27.75   1st Qu.:1.30e+00          
##  Median :  63.92   Median :  51.60   Median :5.90e+00          
##  Mean   : 105.28   Mean   : 113.05   Mean   :4.48e+03          
##  3rd Qu.: 151.88   3rd Qu.: 129.83   3rd Qu.:4.39e+01          
##  Max.   :7396.92   Max.   :1826.25   Max.   :2.25e+06          
##  NA's   :18926     NA's   :19279     NA's   :17779             
##  weaning_weight_g     egg_mass_g        incubation_d     fledging_age_d 
##  Min.   :       1   Min.   :   0.218   Min.   :   2.00   Min.   :  1.0  
##  1st Qu.:      13   1st Qu.:   2.100   1st Qu.:  17.00   1st Qu.: 16.5  
##  Median :      43   Median :   5.100   Median :  29.25   Median : 27.5  
##  Mean   :   41386   Mean   :  22.252   Mean   :  46.67   Mean   : 36.8  
##  3rd Qu.:     850   3rd Qu.:  20.100   3rd Qu.:  59.50   3rd Qu.: 46.0  
##  Max.   :17000000   Max.   :1500.000   Max.   :1762.00   Max.   :345.0  
##  NA's   :20258      NA's   :15907      NA's   :17682     NA's   :19478  
##   longevity_y      male_maturity_d   inter_litter_or_interbirth_interval_y
##  Min.   :  0.083   Min.   :  30.44   Min.   :0.047                        
##  1st Qu.:  5.500   1st Qu.: 365.00   1st Qu.:0.318                        
##  Median : 10.700   Median : 365.25   Median :0.999                        
##  Mean   : 13.521   Mean   : 787.16   Mean   :0.907                        
##  3rd Qu.: 18.200   3rd Qu.: 913.00   3rd Qu.:1.000                        
##  Max.   :177.000   Max.   :9131.25   Max.   :4.847                        
##  NA's   :15822     NA's   :19278     NA's   :19904                        
##  female_body_mass_g male_body_mass_g  no_sex_body_mass_g   egg_width_mm   
##  Min.   :      0    Min.   :      0   Min.   :        0   Min.   :  2.50  
##  1st Qu.:     14    1st Qu.:     16   1st Qu.:       13   1st Qu.:  8.00  
##  Median :     41    Median :     48   Median :       35   Median : 13.00  
##  Mean   :   2076    Mean   :   6197   Mean   :    68952   Mean   : 22.99  
##  3rd Qu.:    220    3rd Qu.:    246   3rd Qu.:      164   3rd Qu.: 35.90  
##  Max.   :3700000    Max.   :4545000   Max.   :136000000   Max.   :125.00  
##  NA's   :14113      NA's   :14679     NA's   :11663       NA's   :20727   
##  egg_length_mm    fledging_mass_g    adult_svl_cm      male_svl_cm    
##  Min.   :  2.50   Min.   :   4.85   Min.   :   1.79   Min.   :  1.57  
##  1st Qu.: 10.94   1st Qu.:  14.60   1st Qu.:   9.50   1st Qu.: 21.41  
##  Median : 19.98   Median :  24.80   Median :  18.50   Median : 35.85  
##  Mean   : 36.40   Mean   : 452.27   Mean   :  38.20   Mean   : 50.44  
##  3rd Qu.: 58.92   3rd Qu.: 107.00   3rd Qu.:  40.50   3rd Qu.: 63.39  
##  Max.   :455.00   Max.   :9992.00   Max.   :3049.00   Max.   :315.20  
##  NA's   :20702    NA's   :21111     NA's   :14274     NA's   :21040   
##  female_svl_cm      birth_or_hatching_svl_cm female_svl_at_maturity_cm
##  Min.   :   1.800   Min.   :  0.400          Min.   :  2.85           
##  1st Qu.:   5.756   1st Qu.:  2.450          1st Qu.:  4.90           
##  Median :   8.150   Median :  3.300          Median :  6.00           
##  Mean   :  20.609   Mean   : 12.099          Mean   : 18.69           
##  3rd Qu.:  17.721   3rd Qu.:  5.256          3rd Qu.:  8.40           
##  Max.   :1125.000   Max.   :759.999          Max.   :580.00           
##  NA's   :20242      NA's   :20085            NA's   :21120            
##  female_body_mass_at_maturity_g no_sex_svl_cm    no_sex_maturity_d
##  Min.   :    30.0               Min.   :   1.7   Min.   :   33.0  
##  1st Qu.:    82.5               1st Qu.:   5.7   1st Qu.:  365.3  
##  Median : 97050.0               Median :   7.7   Median :  913.1  
##  Mean   : 97032.5               Mean   :  20.0   Mean   : 1604.5  
##  3rd Qu.:194000.0               3rd Qu.:  11.0   3rd Qu.: 2008.9  
##  Max.   :194000.0               Max.   :3300.0   Max.   :14610.0  
##  NA's   :21318                  NA's   :16052    NA's   :20860    
##  female_maturity_d_tidy
##  Min.   :  23.81       
##  1st Qu.: 289.00       
##  Median : 365.12       
##  Mean   : 726.85       
##  3rd Qu.: 819.34       
##  Max.   :9131.25       
##  NA's   :17853
```


**6. Use the package `naniar` to produce a summary, including percentages, of missing data in each column for the `amniota` data.**  

```r
naniar::miss_var_summary(amniota_tidy)
```

```
## # A tibble: 36 x 3
##    variable                       n_miss pct_miss
##    <chr>                           <int>    <dbl>
##  1 subspecies                      21322    100  
##  2 female_body_mass_at_maturity_g  21318    100. 
##  3 female_svl_at_maturity_cm       21120     99.1
##  4 fledging_mass_g                 21111     99.0
##  5 male_svl_cm                     21040     98.7
##  6 no_sex_maturity_d               20860     97.8
##  7 egg_width_mm                    20727     97.2
##  8 egg_length_mm                   20702     97.1
##  9 weaning_weight_g                20258     95.0
## 10 female_svl_cm                   20242     94.9
## # ... with 26 more rows
```

**7. Use the package `naniar` to produce a summary, including percentages, of missing data in each column for the `amphibio` data.**

```r
naniar::miss_var_summary(amphibio)
```

```
## # A tibble: 38 x 3
##    variable n_miss pct_miss
##    <chr>     <int>    <dbl>
##  1 OBS        6776    100  
##  2 Fruits     6774    100. 
##  3 Flowers    6772     99.9
##  4 Seeds      6772     99.9
##  5 Leaves     6752     99.6
##  6 Dry_cold   6735     99.4
##  7 Vert       6657     98.2
##  8 Wet_cold   6625     97.8
##  9 Crepu      6608     97.5
## 10 Dry_warm   6572     97.0
## # ... with 28 more rows
```

**8. For the `amniota` data, calculate the number of NAs in the `egg_mass_g` column sorted by taxonomic class; i.e. how many NA's are present in the `egg_mass_g` column in birds, mammals, and reptiles? Does this results make sense biologically? How do these results affect your interpretation of NA's?**  


```r
amniota_tidy %>% 
  group_by(class) %>% 
  select(class, egg_mass_g) %>% 
  naniar::miss_var_summary() %>% 
  arrange(desc(pct_miss))
```

```
## # A tibble: 3 x 4
## # Groups:   class [3]
##   class    variable   n_miss pct_miss
##   <chr>    <chr>       <int>    <dbl>
## 1 Mammalia egg_mass_g   4953    100  
## 2 Reptilia egg_mass_g   6040     92.0
## 3 Aves     egg_mass_g   4914     50.1
```
This makes sense to me that mammals would not have any data for egg mass because they do not lay eggs. This reminds me that NAs can be used to depict where measurements are not applicable, not just where data was not collected.

**9. The `amphibio` data have variables that classify species as fossorial (burrowing), terrestrial, aquatic, or arboreal.Calculate the number of NA's in each of these variables. Do you think that the authors intend us to think that there are NA's in these columns or could they represent something else? Explain.**

```r
amphibio %>% 
  select(Fos, Ter, Aqu, Arb) %>% 
  purrr::map_df(~sum(is.na(.)))
```

```
## # A tibble: 1 x 4
##     Fos   Ter   Aqu   Arb
##   <int> <int> <int> <int>
## 1  6053  1104  2810  4347
```
The NAs in this column must represent a "no" the animal does not live there, whereas a 1 represents a "yes", the animal does live there.

**10. Now that we know how NA's are represented in the `amniota` data, how would you load the data such that the values which represent NA's are automatically converted?**

```r
auto_amniota <- 
  readr::read_csv("data/amniota.csv", na = c("NA", "-999"))
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_double(),
##   class = col_character(),
##   order = col_character(),
##   family = col_character(),
##   genus = col_character(),
##   species = col_character(),
##   subspecies = col_logical(),
##   common_name = col_character(),
##   gestation_d = col_logical(),
##   weaning_d = col_logical(),
##   weaning_weight_g = col_logical(),
##   male_svl_cm = col_logical(),
##   female_svl_cm = col_logical(),
##   birth_or_hatching_svl_cm = col_logical(),
##   female_svl_at_maturity_cm = col_logical(),
##   female_body_mass_at_maturity_g = col_logical(),
##   no_sex_svl_cm = col_logical()
## )
## i Use `spec()` for the full column specifications.
```

```
## Warning: 13577 parsing failures.
##  row                      col           expected actual               file
## 9803 birth_or_hatching_svl_cm 1/0/T/F/TRUE/FALSE    4.7 'data/amniota.csv'
## 9804 birth_or_hatching_svl_cm 1/0/T/F/TRUE/FALSE    4.7 'data/amniota.csv'
## 9805 birth_or_hatching_svl_cm 1/0/T/F/TRUE/FALSE    4.7 'data/amniota.csv'
## 9806 birth_or_hatching_svl_cm 1/0/T/F/TRUE/FALSE    4.7 'data/amniota.csv'
## 9807 birth_or_hatching_svl_cm 1/0/T/F/TRUE/FALSE    4.7 'data/amniota.csv'
## .... ........................ .................. ...... ..................
## See problems(...) for more details.
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
