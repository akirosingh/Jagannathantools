##' .. content for \description{Wrapper function to plot boxplots with wilcox significance added from previous wilcox_cat function.} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param df
##' @param x_cat
##' @param y_var
##' @param condition
##' @param wilcox_results
##' @return
##' @author akirosingh
##' @export
plot_cat <- function(df, x_cat, y_var, condition, wilcox_results) {
  # TODO: Make a conditional statement for different behavior
  # If you don't calculate all_wilcox_cat beforehand this is what you want
  #   pairwise.test <- df %>%
  #  group_by(!! sym(condition)) %>%
  #  wilcox_test(formula =as.formula(substitute(a ~ i, list(a = as.name(y_var), i = as.name(x_cat)))))%>%
  # add_y_position(scales = "free_y")
  #  pairwise.test[[x_cat]] <- pairwise.test$group2

  # Here I am choosing to use BH for p.adj, use select(Stim.x:groups, !! sym(x_cat), bonferroni) for bonferroni
  pairwise.test <- wilcox_results %>%
    select(condition:groups, !! sym(x_cat), BH) %>%
    subset(.y. == y_var) %>%
    na.omit()

  graph <- df %>%
    tidyr::drop_na(!! sym(x_cat)) %>%
    ggplot(aes_string(x = x_cat, y = y_var, fill = x_cat)) +
    geom_boxplot() +
    scale_fill_hue() +
    theme_minimal() +
    facet_wrap(~!!sym(condition), scales = "free_y")+
    scale_y_continuous(expand = expansion(mult = c(0, 0.1)))

  # Note: if you want to compare P values without the multiple hypothesis correction you'll want to change "BH" to "p".
  graph + stat_pvalue_manual(
    pairwise.test, label = "BH", tip.length = 0.01
  )
}


