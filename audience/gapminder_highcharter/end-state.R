library("gapminder")
library("tidyverse")
library("highcharter")
library("RColorBrewer")

gapminder %>%
  group_by(year, continent) %>%
  summarise(mean.pop = mean(pop)) %>%
  hchart(type = "line",
         hcaes(x = year,
               y = mean.pop,
               group = continent))

hc_style_gapminder <- function(hc) {
  
  hc %>%
    hc_colors(colors = brewer.pal(5, "Dark2")) %>%
    hc_xAxis(title = "Year") %>%
    hc_yAxis(title = "",
             labels = list(formatter = JS("function() {
                                          return this.value / 1000000000 + 'B';
}"))) %>%
    hc_tooltip(
      shared = TRUE,
      valueDecimals = 0
             )
  
}

gapminder %>%
  group_by(year, continent) %>%
  summarise(total.pop = sum(as.numeric(pop))) %>%
  hchart(type = "line",
         hcaes(x = year,
               y = total.pop,
               group = continent)) %>%
  hc_title(text = "Continental populations from 1952 - 2007") %>%
  hc_style_gapminder()
