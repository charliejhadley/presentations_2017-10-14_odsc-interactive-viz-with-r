library("shiny")
library("leaflet")
library("tidyverse")
library("sf")

## Convert to an sf data.frame as it is GIS data
quakes_sf <- quakes %>%
  st_as_sf(coords = c("long", "lat")) %>%
  mutate(quake.id = row_number())

function(input, output) {
  ## Set min and max slider values from data requires
  ## us to render the control on the server first
  output$magnitude_slider_UI <- renderUI({
    sliderInput(
      "min_magnitude",
      "Minimum earthquare magnitude",
      min = min(quakes$mag),
      max = max(quakes$mag),
      value = 4.5,
      step = 0.1
    )
  })
  
  ## Rather than re-loading the map tiles, instead clear and add shapes
  ## whenever input$min_magnitude changes
  observeEvent(input$min_magnitude,
               {
                 leafletProxy("leaflet_map") %>%
                   clearShapes() %>%
                   addCircleMarkers(
                     data = quakes_sf %>%
                       filter(mag <= input$min_magnitude),
                     layerId = ~ quake.id ## Add quake.id to the leaflet_map_marker_click object
                   )
               })
  
  output$leaflet_map <- renderLeaflet({
    ## On first load the slider input will be NULL,
    ## ensure not to try and plot anything
    if (is.null(input$min_magnitude)) {
      return()
    }
    
    ## Extract an appropriate bounding box for the map before any
    ## points are added to it
    bbox <- quakes_sf %>%
      st_bbox() %>%
      as.list()
    
    leaflet() %>%
      addTiles() %>%
      fitBounds(bbox$xmin, bbox$ymin, bbox$xmax, bbox$ymax)
    
    
  })
  
  output$selected_point_UI <- renderUI({
    if (is.null(input$leaflet_map_marker_click)) {
      "Click a marker for information about that quake"
    } else {
      ## Check in the console to see the content of this object
      print(input$leaflet_map_marker_click)
      
      paste0(
        "Selected marker info: ",
        "Latitude: ",
        input$leaflet_map_marker_click$lat,
        ", Longitude: ",
        input$leaflet_map_marker_click$lng,
        ", Quakes Row Number: ",
        input$leaflet_map_marker_click$id
      )
    }
    
    
    
    
  })
  
}
