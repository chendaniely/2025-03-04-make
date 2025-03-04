library(readr)

data <- read_csv("data/titanic_clean.csv")

model <- glm(survived ~ as.factor(pclass) + sex + age + fare,
  data = data,
  family = "binomial"
)

summary(model)
