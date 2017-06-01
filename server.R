#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot_species <- renderPlot({
    
    minimun_length <- input$petal_length[1]
    minimun_width <- input$petal_width[1]
    maximun_length <- input$petal_length[2]
    maximun_width <- input$petal_width[2]
    
    iris2 <- iris[iris$Petal.Length >= minimun_length,]
    iris2 <- iris2[iris2$Petal.Width >= minimun_width,]
    iris2 <- iris2[iris$Petal.Length <= maximun_length,]
    iris2 <- iris2[iris2$Petal.Width <= maximun_width,]
    
    sepal_length <- iris2$Sepal.Length
    sepal_width <- iris2$Sepal.Width
    species <- iris2$Species
    
    min_length <- min(iris$Sepal.Length) 
    max_length <- max(iris$Sepal.Length)
    min_width <- min(iris$Sepal.Width) 
    max_width <- max(iris$Sepal.Width)
    
    plot(x = sepal_length, y = sepal_width, col = species, main = "Species with the indicated petal measures", 
         xlab = "Sepal length", ylab = "Sepal width", xlim = c(min_length, max_length), ylim = c(min_width, max_width))
    
  })
  
})
