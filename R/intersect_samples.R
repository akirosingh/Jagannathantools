##' Finding the core samples shared across many different conditions for paired tests content for paired tests
##'
##' @title Core samples across conditions
##' @param df the dataframe to subset to sample ids shared across x_cat
##' @param sampleid the sample ids often patient numbers
##' @param condition the experimental condition such as Stim condition == "M1"
##' @param x_cat the variable which has different sample ids across like days
##' @return
##' @author akirosingh
##' @export
intersect_samples <- function(df, sampleid, condition = NA, x_cat) {
  if(is.na(condition)==T){completeset<- length(unique(df[[condition]]))
  df %>%
    group_by(!!sym(x_cat), !!sym(sampleid)) %>%
    filter(n()== completeset) %>%
    ungroup()
  } else{
    df %>%
      subset()
    group_by(x_cat, condition) %>%
      subset(condition == condition)
    filter(n() != 1) %>%
      ungroup()
  }} # TODO: Think about doing this for every condition then remerging.
