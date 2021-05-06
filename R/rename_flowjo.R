##' Fixes the default column names for raw FlowJo CSV files. It takes out the freq of parent clause at the end of the name and takes out the last two cell features for the name. TODO: Make sure this works with boolean names
##'
##'
##' @title Fixing the column names of csv files exported from flowjo
##' @param data dataframe from flowjo with raw column names
##' @param removal the parts of the column names to remove
##' @param feature_num the number of additional information to column names
##' @return
##' @author akirosingh
##' @export
rename_flowjo <- function(data, feature_num = 1, removal = " \\| Freq\\. of Parent \\(\\%\\)") {
  renamer <-function(name, feature_num){
    catch <- basename(name)
    for (i in 1:(feature_num-1)){
      output<- dirname(name)
      catch <- c(catch,basename(output))
      name<-output}
    return(paste(rev(catch),collapse = "/"))
  }
  if(feature_num<2){
    names(data)[2:length(names(data))]<- names(data)[2:length(names(data))] %>%
      basename() %>%
      str_replace_all(pattern =  removal, replace = "")

    names(data)[1] <- "filename"
    return(data)
  }else{

    names(data)[2:length(names(data))]<- unlist(lapply(X = names(data)[2:length(names(data))],FUN = renamer,feature_num = feature_num))%>%
      str_replace_all(pattern =  removal, replace = "")

    names(data)[1] <- "filename"
    return(data)}
}
