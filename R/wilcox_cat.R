##' .. content for \description{Wrapper-function to do a wilcox test across multiple conditions (Think Stim conditions) } (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param df
##' @param x_cat
##' @param y_var
##' @param condition
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


