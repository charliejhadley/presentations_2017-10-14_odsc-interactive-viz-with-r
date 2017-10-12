library("tidyverse")
library("statesRcontiguous")
library("leaflet.extras")
library("RColorBrewer")

contiguous_states <- shp_all_us_states %>%
  filter(contiguous.united.states == TRUE)


palette_state_divisions <-
  colorFactor(brewer.pal(9, "Set3"),
              contiguous_states$state.division)

contiguous_states %>%
  leaflet() %>%
  addPolygons(
    fillColor = ~palette_state_divisions(state.division),
    color = "#000000",
    fillOpacity = 1,
    weight = 1,
    label = ~state.name
  ) %>%
  addLegend(pal = palette_state_divisions,
            values = ~state.division,
            opacity = 1) %>%
  setMapWidgetStyle(style = list(background = "#aacbff"))
