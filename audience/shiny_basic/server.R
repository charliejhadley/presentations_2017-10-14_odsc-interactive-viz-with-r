library("shiny")
library("leaflet")
library("tidyverse")

function(input, output){
  
  output$leaflet_map <- renderLeaflet({
    
    quakes %>%
      leaflet() %>%
      addTiles() %>%
      addCircleMarkers()
    
  })
  
}

