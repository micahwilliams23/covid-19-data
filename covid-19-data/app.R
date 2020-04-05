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

    # Application title
    titlePanel("Covid-19 Infections"),
    mainPanel(
        plotOutput("preImage")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    # Send a pre-rendered image, and don't delete the image after sending it
    output$preImage <- renderImage({
        # When input$n is 3, filename is ./images/image3.jpeg
        filename <- file.path('20200403_ca.gif')
        
        # Return a list containing the filename and alt text
        list(src = filename,
             contentType = 'image/gif',
             alt = 'Animation of Coronavirus spread in California')
        
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)
