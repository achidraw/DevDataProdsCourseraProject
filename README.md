---
title: "README.md"
output: html_document
---

This App leverages the Galton data set which includes child and parent heights to predict a child height based on user provided parent height using the linear regression model fit algorithm

The app can be accessed using the following URL: https://achidraw.shinyapps.io/CourseraDevelopingDataProductsApp/

App Usage: Input, Processing, Output

- Input: This is a simple app where the user just inputs one parameter - the parent height.
- Processing: The server then uses the prediction model to predict the child height. In this we're using reactive processing on the server based on the user input.
- Output: The child height is finally displayed both in text as well as on a chart.
