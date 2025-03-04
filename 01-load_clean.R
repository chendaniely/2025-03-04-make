library(tidyverse)
library(janitor)
# load data

data <- read_csv("data/titanic.csv")

# clean data
data <- janitor::clean_names(data)

data

write_csv(data, "data/titanic_clean.csv")

print("finished script 1")
