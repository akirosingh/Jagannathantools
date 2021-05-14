##' Imports csv files created directly from FlowJo and removed Mean, SD, and empty final column. In addition if there are NAs in the table the sample is removed at this step too!
##' The defaults take all the csv in the DataRaw/ folder, but changing the filter_string can allow you to be selective about which files to merge
##'
##' @title Importing raw .csv files directly from FlowJo
##' @param directory a string with the path to the folder containng csv files
##' @param filter_string a string that has a pattern filter out csv files
##' @param rm.bottomm T if std and mean are at the bottomm and to remove the last column. F if you just want to import and concatenate everything
##' @return
##' @author akirosingh
##' @export
import_flowjo <- function(directory = "DataRaw/", filter_string = "\\.csv",rm.bottom = T) {
  if(rm.bottom==T){
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
  else{target_files <- list.files(path = directory) %>% str_subset(pattern = filter_string)
  i <- c()
  stacked_df <- c()
  for (i in 1:length(target_files)){
    # Importing and removing last two rows (Mean and SD)
    df <- read_csv(paste0(directory,target_files[i]))
    stacked_df <- bind_rows(df,stacked_df)

  }
}
}
