DevelopingDataProductsCourseProjectPresentation
========================================================
author: Coursera Data Science Course Student: Developing Data Products
date: Jan 24th 2015

Overview of my Shiny App
========================================================

This App leverages the Galton data set which includes child and parent heights to predict a child height based on user provided parent height using the linear regression model fit algorithm

The app can be accessed using the following URL:
https://achidraw.shinyapps.io/CourseraDevelopingDataProductsApp/

Topics covered:
- About the Galton data set
- Prediction model used
- App usage - Input, Processing & Output

About the Galton data set
========================================================
transition: rotate

Galton's height data for parents and children
<small> Data set from tabulated data set used by Galton in 1885 to study the relationship between a parent's height and their childrens.
A data frame with 928 observations on the following 2 variables.
- child: The child's height
- parent: The "midparent" height

The midparent's height is an average of the fathers height and 1.08 times the mother's. In the data there are 205 different parents and 928 children. The data here is truncated at the ends for both parents and children so that it can be treated as numeric data. The data were tabulated and consequently made discrete. The father.son data set is similar data used by Galton and is continuous.

Source: This data was found at http://www.bun.kyoto-u.ac.jp/~suchii/galton86.html.

See also the data.set father.son which was found from http://stat-www.berkeley.edu/users/juliab/141C/pearson.dat.
</small>

About the Galton data set
========================================================
transition: rotate


```
'data.frame':	928 obs. of  2 variables:
 $ child : num  61.7 61.7 61.7 61.7 61.7 62.2 62.2 62.2 62.2 62.2 ...
 $ parent: num  70.5 68.5 65.5 64.5 64 67.5 67.5 67.5 66.5 66.5 ...
```
***

```
  child parent
1  61.7   70.5
2  61.7   68.5
3  61.7   65.5
4  61.7   64.5
5  61.7   64.0
6  62.2   67.5
```

```
     child          parent    
 Min.   :61.7   Min.   :64.0  
 1st Qu.:66.2   1st Qu.:67.5  
 Median :68.2   Median :68.5  
 Mean   :68.1   Mean   :68.3  
 3rd Qu.:70.2   3rd Qu.:69.5  
 Max.   :73.7   Max.   :73.0  
```

Prediction model used
========================================================
transition: rotate

The linear regression model is used to fit the child vs parent data 
fit <- lm(child ~ parent, data = galton)

And then the predict function is used with this model along  with the parent's height to predict the child's height
predict(fit, newdata = data.frame(parent = c(parent_ht)))


App Usage: Input, Processing, Output
========================================================
transition: rotate
- Input: This is a simple app where the user just inputs one parameter - the parent height.
- Processing: The server then uses the prediction model to predict the child height. In this we're using reactive processing on the server based on the user input.
- Output: The child height is finally displayed both in text as well as on a chart.

The app can be accessed using the following URL: https://achidraw.shinyapps.io/CourseraDevelopingDataProductsApp/

