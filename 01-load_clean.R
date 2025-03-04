library(tidyverse)
library(janitor)
library(docopt)
library(glue)

"This script cleans loads, cleans, and saves input data.

Usage: 01-load_clean.R --file_path=<file_path> --output_path=<output_path>
" -> doc

opt <- docopt(doc)

# load data

data <- read_csv(opt$file_path)

# clean data
data <- janitor::clean_names(data)

write_csv(data, opt$output_path)

print(glue("saved data to {opt$output_path}"))
