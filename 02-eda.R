library(readr)
library(ggplot2)

# don't do this
# source("01-load_clean.R")

data <- readr::read_csv("data/titanic_clean.csv")

# eda

ggplot(data, aes(x = pclass, fill = as.factor(survived))) +
  geom_bar() +
  ggtitle("titanic")

ggsave("output/titanic1.png")

ggplot(data, aes(x = survived)) +
  geom_bar()
