# load the shiny library to develop the shiny app
library(shiny)

# this is shiny required code to create the shiny appo
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Child Height Prediction"),
                # prompt the user to input the parent height for which they want to predict the child height
                sidebarPanel(
                        numericInput('parent_ht', 'Enter parent height in inches', 68, min = 48, max = 90, step = 0.5),
                        # on submit the parent height is passed to the server where the linear model using galton dataset is used to predict the child's height
                        submitButton('Submit')
                ),
                # once the server returns with the user entered value and the predicted child height show them to the user
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered parent height in inches as '),
                        verbatimTextOutput("input_parent_ht"),
                        h4('Which resulted in a prediction of child height in inches as '),
                        verbatimTextOutput("predicted_child_ht"),
                        # plot to show the galton data set, the linear model and the user input as well as the predicted height
                        plotOutput('myPlot')
                )
        )
)