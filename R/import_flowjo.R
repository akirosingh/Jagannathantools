##' .. content for \description{Imports csv files created directly from FlowJo and removed Mean, SD, and empty final column. In addition if there are NAs in the table the sample is removed at this step too!} (no empty lines) ..
##'
##' .. content for \details{The defaults take all the csv in the DataRaw/ folder, but changing the filter_string can allow you to be selective about which files to merge} ..
##'
##' @title Importing raw .csv files directly from FlowJo
##' @param directory a string with the path to the folder containng csv files
##' @param filter_string a string that has a pattern filter out csv files
##' @return
##' @author akirosingh
##' @export
import_flowjo <- function(directory = "DataRaw/", filter_string = "\\.csv") {
  target_files <- list.files(path = directory) %>% str_subset(pattern = filter_string)
  i <- c()
  stacked_df <- c()
  for (i in 1:length(target_files)){
    # Importing and removing last two rows (Mean and SD)
    df <- head(read_csv(paste0(directory,target_files[i])),-2)
    # Removing last column
    df <- df[1:(length(df)-1)]
    stacked_df <- bind_rows(df,stacked_df)
  }
  return(stacked_df)

}
