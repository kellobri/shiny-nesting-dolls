#
#

library(shiny)
library(gitlink)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),
    ribbon_css("https://github.com/kellobri/shiny-nesting-dolls", color = "black", font_color = "white", border_color = "white"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput('appchoice', "Select an Application", c("Basic Histogram" = 'https://colorado.rstudio.com/rsc/child-app/', 'Upgraded Histogram' = 'https://colorado.rstudio.com/rsc/upgrade-hist/'))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            htmlOutput("frame")        
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$frame <- renderUI({
        
        tags$iframe(src=input$appchoice, height=600, width=800, frameborder = "no")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
