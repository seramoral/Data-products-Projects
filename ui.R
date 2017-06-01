
library(shiny)

min_length <- min(iris$Petal.Length) 
max_length <- max(iris$Petal.Length)
min_width <- min(iris$Petal.Width) 
max_width <- max(iris$Petal.Width)

shinyUI(navbarPage("Species",
    tabPanel("Interactive Plot of the Species",                 
  
    sidebarPanel(
       sliderInput("petal_length",
                   "Petal length:",
                   min = min_length,
                   max = max_length,
                   value = c(min_length,max_length),
                   step = 0.1),
       
       sliderInput("petal_width",
                   "Petal width:",
                   min = min_width,
                   max = max_width,
                   value = c(min_width,max_width),
                   step = 0.1)
    ),

    mainPanel(
      h3('Species that has the minimun and the maximun of the measures introduced', align = "center"),
      plotOutput("plot_species")
    )
    ),
    
 
  tabPanel("Documentation", 
           mainPanel(
             includeMarkdown("documentation_application.md")
          )
  )
  
  )
  
)
  
  
