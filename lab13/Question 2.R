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
      selectInput("x", "Select Admissions Variable", choices = c("academic_yr", "campus", "category"), 
                  selected = "academic_yr"),
      hr()),
    
    mainPanel(
      plotOutput("UCEthnicity")  
    )
  )
  
)


server <- function(input, output) {
  
  
  output$UCEthnicity <- renderPlot({
    
    uc_admit %>%
      filter(ethnicity != "All") %>% 
      ggplot(aes_string(x=input$x, y = "filtered_count_fr", fill = "ethnicity")) + 
      geom_col(position = "dodge")+
      theme_minimal()+
      scale_fill_manual(values = my_palette)+
      labs(title = "UC Admissions Ethnicity", x = NULL, y = "Count")+
      coord_flip()
  })
}

shinyApp(ui, server)