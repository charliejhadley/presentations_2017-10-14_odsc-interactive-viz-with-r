library("tidyverse")
## Data source: https://github.com/ShirinG/blog_posts_prep/tree/master/GoT
## Additional info: Data sources from https://www.kaggle.com/mylesoneill/game-of-thrones and manipulated by hand by https://shiring.github.io/

download.file("https://github.com/ShirinG/blog_posts_prep/blob/master/GoT/union_characters.RData?raw=true",
              destfile = "data-raw/union_characters.RData")
download.file("https://github.com/ShirinG/blog_posts_prep/blob/master/GoT/union_edges.RData?raw=true",
              destfile = "data-raw/union_edges.RData")

load("data-raw/union_characters.RData")
load("data-raw/union_edges.RData")

got_characters <- union_characters %>%
  mutate_if(is.factor, as.character)
got_edges <- union_edges

got_characters %>% colnames()

got_characters <- got_characters %>%
  select(-shape, -popularity, -color) %>%
  mutate(id = name) %>%
  mutate(label = name,
         title = name) %>%
  mutate(culture = ifelse(is.na(culture), "Unknown Culture", culture)) %>%
  mutate(gender = recode(male, `0` = "female", `1` = "male")) %>%
  select(-male)

got_supercultures <- read_csv("data-raw/got_super-cultures.csv")

got_characters <- got_characters %>%
  mutate(superculture = plyr::mapvalues(culture, from = got_supercultures$culture, to = got_supercultures$super.culture))

got_edges <- got_edges %>%
  select(-lty, -color)

write_csv(got_edges, "data/GoT_edges.csv")
write_csv(got_characters, "data/GoT_nodes.csv")
