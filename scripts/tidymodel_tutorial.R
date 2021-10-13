###gary hutson youtubes https://www.youtube.com/watch?v=PtD5hgHM-DY

library(pacman)
p_load(NHSRdatasets, tidymodels, readr, ranger, broom, broom.mixed, skimr, remotes, dplyr, magrittr, parallel, doParallel, vip, themis, plotly)
library(cli)
library(tidymodels)


stranded_pat <- NHSRdatasets::stranded_data %>%
  setNames(c("stranded_class", "age", " care_home_ref_flag", "medically_safe_flag",
             "hcop_flag", "needs_mental_health_support_flag", "previous_care_in_last_12_month", "admit_date", "frail_descrip")) %>%
  mutate(stranded_class = factor(stranded_class),
         admit_date = lubridate::dmy(admit_date)) %>%
  drop_na()


head(stranded_pat)

### deal with class imbalance

bal <- table(stranded_pat$stranded_class)
prop <- prop.table(bal)
upsample <- bal[2] / sum(bal)

### sample

set.seed(123)

split <- rsample::initial_split(stranded_pat, prop = 0.75)
train <- rsample::training(split)
test <- rsample::testing(split)


## recipe
stranded_recipe <- 
  recipe(stranded_class ~ ., data = train) %>%
  step_date(admit_date, features = c("dow", "month")) %>%
  step_rm(admit_date) %>%
  themis::step_upsample(stranded_class, over_ratio = as.numeric(upsample)) %>%
  step_dummy(all_nominal(), -all_outcomes()) %>%
  step_zv(all_predictors()) %>%
  step_normalize(all_predictors())

stranded_recipe

##model

model <- 
  parsnip::logistic_reg() %>%
  set_engine("glm")

model

## workflow

strand_wf <- 
  workflow() %>%
  add_model(model) %>%
  add_recipe(stranded_recipe)

strand_wf

## fit training data

strand_fit <-
  strand_wf %>%
  fit(data = train)

strand_fit %>%
  pull_workflow_fit() %>%
  tidy()


## fit test

class_pred <- predict(strand_fit, test)
prob_pred <- predict(strand_fit, test, type = "prob")
lr_pred <- data.frame(class_pred, prob_pred) %>%
  setNames(c("class", "p_not", "p_yes"))

strand_pred <- test %>%
  bind_cols(lr_pred)

head(strand_pred)

## accuracy

roc <- 
  strand_pred %>%
  roc_curve(truth = stranded_class, p_not) %>%
  autoplot()

roc

cm <- caret::confusionMatrix(strand_pred$stranded_class, 
                             strand_pred$class, 
                             positive = "Stranded")
cm

## kfold

set.seed(123)

ten_fold <- vfold_cv(train, v = 10)

set.seed(123)

lr_fit_rs <- 
  strand_wf %>%
  fit_resamples(ten_fold)

lr_fit_rs

collected_metrics <- tune::collect_metrics(lr_fit_rs)
collected_metrics

accuracy_resamples <- collected_metrics$mean[1] * 100
accuracy_val <- as.numeric(cm$overall[1] * 100)

## random forest

rf_mod <- 
  rand_forest(trees = 500) %>%
  set_engine("ranger") %>%
  set_mode("classification")

rf_fit <- 
  rf_mod %>%
  fit(stranded_class ~ ., data = train)

rf_fit

rf_wf <- 
  workflow() %>%
  add_model(rf_mod) %>%
  add_formula(stranded_class ~ .)

set.seed(123)

rf_fit_rs <- 
  rf_wf %>%
  fit_resamples(ten_fold)

rf_fit_rs

rf_fit_rs_pred <- tune::collect_metrics(rf_fit_rs)
rf_fit_rs_pred

## tuning

tune_tree <- 
  decision_tree(
    cost_complexity = tune(),
    tree_depth = tune()
  ) %>%
  set_engine("rpart") %>%
  set_mode("classification")

tune_tree
help("cost_complexity")


## grid search

grid_tree_tune <- 
  grid_regular(dials::cost_complexity(),
               dials::tree_depth(), 
               levels=10)

tail(grid_tree_tune)


## parallel processing

all_cores <- parallel::detectCores() - 1
cl <- makePSOCKcluster(all_cores)
registerDoParallel(cl)

tree_wf <- 
  workflow() %>%
  add_model(tune_tree) %>%
  add_formula(stranded_class ~ .)

tree_pred_tune <- 
  tree_wf %>%
  tune::tune_grid(
    resamples = ten_fold,
    grid = grid_tree_tune
  )


tree_pred_tune$.notes
