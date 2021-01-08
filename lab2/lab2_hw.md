---
title: "Lab 2 Homework"
author: "Claire Chapman"
date: "2021-01-07"
output:
  html_document:
    keep_md: yes
    theme: spacelab
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

1. Below are data collected by three scientists (Jill, Steve, Susan in order) measuring temperatures of eight hot springs. Run this code chunk to create the vectors.  

```r
spring_1 <- c(36.25, 35.40, 35.30)
spring_2 <- c(35.15, 35.35, 33.35)
spring_3 <- c(30.70, 29.65, 29.20)
spring_4 <- c(39.70, 40.05, 38.65)
spring_5 <- c(31.85, 31.40, 29.30)
spring_6 <- c(30.20, 30.65, 29.75)
spring_7 <- c(32.90, 32.50, 32.80)
spring_8 <- c(36.80, 36.45, 33.15)
```

2. Build a data matrix that has the springs as rows and the columns as scientists. 

```r
Temperatures <- c(spring_1, spring_2, spring_3, spring_4, spring_5, spring_6, spring_7, spring_8)
Temperature_matrix <- matrix(Temperatures, nrow = 8, byrow = TRUE)
Temperature_matrix
```

```
##       [,1]  [,2]  [,3]
## [1,] 36.25 35.40 35.30
## [2,] 35.15 35.35 33.35
## [3,] 30.70 29.65 29.20
## [4,] 39.70 40.05 38.65
## [5,] 31.85 31.40 29.30
## [6,] 30.20 30.65 29.75
## [7,] 32.90 32.50 32.80
## [8,] 36.80 36.45 33.15
```

3. The names of the springs are 1.Bluebell Spring, 2.Opal Spring, 3.Riverside Spring, 4.Too Hot Spring, 5.Mystery Spring, 6.Emerald Spring, 7.Black Spring, 8.Pearl Spring. Name the rows and columns in the data matrix. Start by making two new vectors with the names, then use `colnames()` and `rownames()` to name the columns and rows.


```r
springs <- c("Bluebell", "Opal", "Riverside", "Too_Hot", "Mystery", "Emerald", "Black", "Pearl")
scientists <- c("Jill", "Steve", "Susan")

colnames(Temperature_matrix) <- scientists
rownames(Temperature_matrix) <- springs
Temperature_matrix
```

```
##            Jill Steve Susan
## Bluebell  36.25 35.40 35.30
## Opal      35.15 35.35 33.35
## Riverside 30.70 29.65 29.20
## Too_Hot   39.70 40.05 38.65
## Mystery   31.85 31.40 29.30
## Emerald   30.20 30.65 29.75
## Black     32.90 32.50 32.80
## Pearl     36.80 36.45 33.15
```

4. Calculate the mean temperature of all three springs.


```r
mean_temp <- rowMeans(Temperature_matrix)
mean_temp
```

```
##  Bluebell      Opal Riverside   Too_Hot   Mystery   Emerald     Black     Pearl 
##  35.65000  34.61667  29.85000  39.46667  30.85000  30.20000  32.73333  35.46667
```


5. Add this as a new column in the data matrix.  


```r
better_temperature_matrix <- cbind(Temperature_matrix, mean_temp)
better_temperature_matrix
```

```
##            Jill Steve Susan mean_temp
## Bluebell  36.25 35.40 35.30  35.65000
## Opal      35.15 35.35 33.35  34.61667
## Riverside 30.70 29.65 29.20  29.85000
## Too_Hot   39.70 40.05 38.65  39.46667
## Mystery   31.85 31.40 29.30  30.85000
## Emerald   30.20 30.65 29.75  30.20000
## Black     32.90 32.50 32.80  32.73333
## Pearl     36.80 36.45 33.15  35.46667
```


6. Show Susan's value for Opal Spring only.


```r
better_temperature_matrix[2,3]
```

```
## [1] 33.35
```


7. Calculate the mean for Jill's column only. 


```r
mean(better_temperature_matrix[1:8])
```

```
## [1] 34.19375
```
OR


```r
mean(better_temperature_matrix[ ,1])
```

```
## [1] 34.19375
```


8. Use the data matrix to perform one calculation or operation of your interest.
Finding the average temperature of all the springs:


```r
mean(better_temperature_matrix[ ,4])
```

```
## [1] 33.60417
```


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
