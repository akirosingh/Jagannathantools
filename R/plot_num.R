##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param df
##' @param x_num
##' @param y_var
##' @param condition
##' @param correlation_results
##' @return
##' @author akirosingh
##' @export
plot_num <- function(df, x_num, y_var, condition, correlation_results) {
  correlations <- correlation_results %>%
    subset(var1 == x_num & var2 == y_var)

  graph <-df %>%
    ggplot(aes(x = !!sym(x_num), y = !!sym(y_var), color = !!sym(condition))) +
    geom_point() +geom_smooth(method="loess", se=TRUE,  fullrange=FALSE, level=0.95, formula=y~x)+
    theme_minimal()+  geom_text(data = correlations, mapping = aes(x = -Inf, y = Inf, color = !!sym(condition), label = paste("p-value= ",BH,", rho=", cor),hjust= 0,vjust=1)) +
    facet_wrap(~!!sym(condition), scales = "free") +
    theme(legend.position = "none")
  graph
}

}
