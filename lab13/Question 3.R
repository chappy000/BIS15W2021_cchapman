library(shiny)
library(tidyverse)
library(shinydashboard)
library(paletteer)

UC_admit <- readr::read_csv("data/UC_admit.csv")
uc_admit <- janitor::clean_names(UC_admit)
uc_admit$academic_yr <- as.factor(uc_admit$academic_yr)

colors <- paletteer::palettes_d_names
my_palette <-  paletteer_d("yarrr::info")


ui <- fluidPage(    
  
  titlePanel("UC Campus Admissions"),
  sidebarLayout(      
    sidebarPanel(
      selectInput("x", "Select Admissions Variable", choices = c("ethnicity", "campus", "category"), 
                  selected = "ethnicity"),
      hr()),
    
    mainPanel(
      plotOutput("UCAdmissions")  
    )
  )
  
)


server <- function(input, output) {
  
  
  output$UCAdmissions <- renderPlot({
    
    uc_admit %>%
      filter(ethnicity != "All") %>% 
      ggplot(aes_string(x = "academic_yr", y = "filtered_count_fr", fill = input$x)) + 
      geom_col(position = "dodge")+
      theme_minimal()+
      scale_fill_manual(values = my_palette)+
      labs(title = "UC Admissions by Year", x = input$x, y= "count")
  })
}

shinyApp(ui, server)