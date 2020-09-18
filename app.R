library(shiny)
library(DT)


# load in all our R objects for the dataframes
shane_df <- readRDS(file = "Data/beliebers.rds")
redemption_df <- readRDS(file = "Data/kshank.rds")
choo_df <- readRDS(file = "Data/choo.rds")
beavens_df <- readRDS(file = "Data/beavens.rds")
tyrone_df <- readRDS(file = "Data/tyrone.rds")
Mckenna_df <- readRDS(file = "Data/mckenna.rds")
votos_df <- readRDS(file = "Data/bartolos.rds")
a_rod_df <- readRDS(file = "Data/ARod.rds")
sniffers_df <- readRDS(file = "Data/Sniffersrow.rds")
christy_df <- readRDS(file = "Data/Team_christy.rds")
long_ball_df <- readRDS(file = "Data/Long_Ball.rds")
wright_df <- readRDS(file = "Data/The_Wright.rds")

# Define UI for application that supplies interactive data tables
ui <- fluidPage( 
  titlePanel("An app for displaying Fantasy draft results "),
  sidebarLayout(sidebarPanel(helpText("Create a datatable for fantasy draft results based on team. Note that the dashboard only permits one table at a time"),
                              radioButtons("team", "Choose a team:", choices = c("Kershawshank Redemption", "Choo Talkin to Me?", "Team Beavens", "I'am Tyrone",
                                                                                       "Team Mckenna", "Bartolos Votos", "Shane Beliebers", "A Rod", "Sniffer's Row", "Team Christy", "Long Ball", "The Wright Players"), selected = "Shane Beliebers")
                              
                              
                
                
                
                
                             ),
                 
    mainPanel(DT::dataTableOutput('table'))
                  
                 
                 
                 )
)
   
 



# Define server logic required to draw interactive data tables
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

