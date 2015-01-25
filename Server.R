library(shiny)
library(UsingR)

# Load the Galton child and parent height data set
data(galton)

# use a linear regression model with child height as the dependent variable and parent height as the independent variable
# this is run only once when the server starts
fit <- lm(child ~ parent, data = galton)

# This function predicts the child height based on the parent height as input leveraging the linear model created above
PredictChildHeight <- function(parent_ht) {
        predict(fit, newdata = data.frame(parent = c(parent_ht)))
}

# This function plots the bubble chart using parent height (x-axis) vs child height (y-axis) and the fitted linear model as a line. 
#It also draws a vertical line to show the user inputted parent height and a horizontal line based on the model predicted child height
myPlot <- function(parent_ht, predicted_child_ht){
        y <- galton$child
        x <- galton$parent
        freqData <- as.data.frame(table(x, y))
        names(freqData) <- c("child", "parent", "freq")
        plot(
                as.numeric(as.vector(freqData$parent)),
                as.numeric(as.vector(freqData$child)),
                pch = 21, col = "black", bg = "lightblue",
                cex = .15 * freqData$freq,
                xlab = "parent height inches",
                ylab = "child height inches"
        )
        abline(fit$coeff[1],fit$coeff[2], col="blue", lwd=3)
        abline(v=parent_ht, col="red", lwd=2)
        abline(h=PredictChildHeight(parent_ht), col="red", lty=3, lwd=2)
}

# This is the Shiny server required code
shinyServer(
        function(input, output) {
                output$input_parent_ht <- renderPrint({input$parent_ht});
                output$predicted_child_ht <- renderPrint({PredictChildHeight(input$parent_ht)});
                output$myPlot <- renderPlot(myPlot(input$parent_ht));
        }
)