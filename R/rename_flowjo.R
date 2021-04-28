##' .. content for \description{Fixes the default column names for raw FlowJo CSV files. It takes out the freq of parent clause at the end of the name and takes out the last two cell features for the name. TODO: Make sure this works with boolean names} (no empty lines) ..
##'
##'
##' @title Fixing the column names of csv files exported from flowjo
##' @param data dataframe from flowjo with raw column names
##' @param removal the parts of the column names to remove
##' @return
##' @author akirosingh
##' @export
rename_flowjo <- function(data, removal = " \\| Freq\\. of Parent \\(\\%\\)") {

  names(data)[2:length(names(data))]<- names(data)[2:length(names(data))] %>%
    basename() %>%
    str_replace_all(pattern =  removal, replace = "")

  names(data)[1] <- "filename"
  return(data)
}
