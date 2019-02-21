#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)


shane_df <- readRDS(file.choose())
redemption_df <- readRDS(file.choose())
choo_df <- readRDS(file.choose())
beavens_df <- readRDS(file.choose())
tyrone_df <- readRDS(file.choose())
Mckenna_df <- readRDS(file.choose())
votos_df <- readRDS(file.choose())

# Define UI for application that draws a histogram
ui <- fluidPage( 
  titlePanel("An app for displaying Fantasy draft results "),
  sidebarLayout(sidebarPanel( helpText("Create a datatable for fantasy draft results based on team"),
                              checkboxGroupInput("team", "Choose a team:", choices = c("Kershawshank Redemption", "Choo Talkin to Me?", "Team Beavens", "I'am Tyrone", "Team Mckenna", "Bartolos Votos", "Shane Beliebers", "A Rod", "Sniffer's Row", "Team Christy", "Long Ball", "The Wright Players"), selected = "Shane Beliebers")
                              
                              
                
                
                
                
                             ),
                 
    mainPanel(DT::dataTableOutput('table'))
                  
                 
                 
                 )
)
   
 



# Define server logic required to draw a histogram
server <- function(input, output) {

output$table <- DT::renderDataTable(
 team_displayed <- teamInput()
  )

 teamInput <- reactive({
   switch (input$team,
          "Kershawshank Redemption" = redemption_df,
          "Choo Talkin to Me?" = choo_df,
          "Team Beavens" = beavens_df,
          "I'am Tyrone" = tyrone_df, 
          "Team Mckenna" = Mckenna_df,
          "Bartolos Votos" = votos_df,
          "Shane Beliebers" = shane_df, 
          "A Rod" = a_rod_df, 
          "Sniffer's Row" = sniffers_df, 
          "Team Christy" = christy_df, 
          "Long Ball" = long_ball_df, 
          "The Wright Players" = wright_df)
 
   
   })
   

}

# Run the application 
shinyApp(ui = ui, server = server)

