##' Wrapper function to plot boxplots with wilcox significance added from previous wilcox_cat function. It will us BH corrected P values
##'
##' @title Graphing boxplots with wilcox tests
##' @param df data
##' @param x_cat a categorical/discrete variable
##' @param y_var a continuous variable
##' @param condition the different experimental conditions in an experiment
##' @param wilcox_results the results of wilcox tests
##' @param p.method the adjusted p-value "p", "bonferroni", "holm, "BH"
##' @return
##' @author akirosingh
##' @export
plot_cat <- function(df, x_cat, y_var, condition, p.method, wilcox_results = NA){
  if(is.na(wilcox_results)==T){
    #If you don't calculate all_wilcox_cat beforehand this is what you want
      pairwise.test <- df %>%
     group_by(!! sym(condition)) %>%
     wilcox_test(formula =as.formula(substitute(a ~ i, list(a = as.name(y_var), i = as.name(x_cat)))))%>%
        mutate(bonferroni = signif(p.adjust(p, method = "bonferroni"),digits = 3), BH = signif(p.adjust(p, method = "BH"),digits = 3), holm = signif(p.adjust(p,method = "holm"),digits =3)) %>%
    add_y_position(scales = "free_y")
     pairwise.test[[x_cat]] <- pairwise.test$group2
  }
else{

  # Here I am choosing to use BH for p.adj, use select(Stim.x:groups, !! sym(x_cat), bonferroni) for bonferroni
  pairwise.test <- wilcox_results %>%
    select(condition:groups, !! sym(x_cat), !! sym(p.method)) %>%
    subset(.y. == y_var) %>%
    na.omit()
}
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
    pairwise.test, label = p.method, tip.length = 0.01
  )
}


