library(readr)
library(ggplot2)

model <- read_rds("output/model.RDS")

summary(model)

# results

coef <- broom::tidy(model)
coef

# process results

coef <- coef |>
  dplyr::mutate(or = exp(estimate))

coef

# plot results


ggplot(coef |> dplyr::filter(term != "(Intercept)"), aes(x = term, y = or)) +
  geom_point() +
  coord_flip() +
  geom_hline(yintercept = 1)
