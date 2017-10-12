library("statesRcontiguous")
library("leaflet")

shp_all_us_states %>%
  leaflet() %>%
  addProviderTiles(providers$Esri.WorldShadedRelief) %>%
  addPolygons()

library("RColorBrewer")
palette_state_divisions <-
  colorFactor(brewer.pal(9, "Set3"),
              contiguous_states$state.division)


contiguous_states %>%
  leaflet() %>%
  addPolygons(fillColor = ~ palette_state_divisions(state.division)) %>%
  addLegend(pal = palette_state_divisions,
            values = state.division)


