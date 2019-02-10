#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   tabsetPanel(tabPanel("Draft Results", sidebarLayout(
     sidebarPanel(radioButtons("choice", "Pick your player's position", c("C","1B", "2B", "SS", "3B", "RF", "CF", "LF", "SP", "RP"))),
     mainPanel())),
               tabPanel("Projections",  "Contents"),
               tabPanel("Point Values", "Contents"))

)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
 
}

# Run the application 
shinyApp(ui = ui, server = server)

