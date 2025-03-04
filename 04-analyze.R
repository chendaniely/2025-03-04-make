library(readr)
library(ggplot2)
library(docopt)

"
Usage: 04-model.R --model=<model> --output_coef=<output_coef> --output_fig=<output_fig>
" -> doc

opt <- docopt(doc)

model <- read_rds(opt$model)

summary(model)

# results

coef <- broom::tidy(model)
coef

# process results

coef <- coef |>
  dplyr::mutate(or = exp(estimate))

coef

write_csv(coef, opt$output_coef)

# plot results


ggplot(coef |> dplyr::filter(term != "(Intercept)"), aes(x = term, y = or)) +
  geom_point() +
  coord_flip() +
  geom_hline(yintercept = 1)

ggsave(opt$output_fig)
