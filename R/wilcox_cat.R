##' .. content for \description{Wrapper-function to do a wilcox test across multiple conditions (Think Stim conditions) } (no empty lines) ..
##'
##'
##' @title Wilcox comparison within an experiment with different conditions
##' @param df data
##' @param x_cat a categorical/discrete variable
##' @param y_var a continuous variable
##' @param condition the different experimental conditions in an experiment like Stim
##' @return
##' @author akirosingh
##' @export
wilcox_cat <- function(df, x_cat, y_var, condition, paired = F) {
    pairwise.test <- df %>%
      group_by(!! sym(condition)) %>%
      wilcox_test(formula =as.formula(substitute(a ~ i, list(a = as.name(y_var), i = as.name(x_cat)))),paired = paired)%>%
      add_y_position(scales = "free_y")
    pairwise.test[[x_cat]] <- pairwise.test$group2
    pairwise.test}


