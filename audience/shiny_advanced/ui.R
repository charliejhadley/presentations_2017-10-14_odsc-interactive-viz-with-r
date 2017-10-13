library("leaflet") # hmtlwidget libraries must be loaded in both ui.R and server.R

fluidPage(
  uiOutput("magnitude_slider_UI"),
  uiOutput("selected_point_UI"),
  leafletOutput("leaflet_map")
)

