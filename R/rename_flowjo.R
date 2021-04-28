##' .. content for \description{Fixes the default column names for raw FlowJo CSV files. It takes out the freq of parent clause at the end of the name and takes out the last two cell features for the name. TODO: Make sure this works with boolean names} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param data
##' @param removal
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
