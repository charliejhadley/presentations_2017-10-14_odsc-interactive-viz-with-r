library("leaflet") # hmtlwidget libraries must be loaded in both ui.R and server.R

fluidPage(
  sliderInput("min_magnitude",
              "Minimum earthquare magnitude",
              min = 4,
              max = 6.4,
              value = 4.5,
              step = 0.1
              )
)


