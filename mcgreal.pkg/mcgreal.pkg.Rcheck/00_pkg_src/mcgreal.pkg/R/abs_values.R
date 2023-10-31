#This function will take the X, Y, and Z columns for acceleration, linear acceleration, and gyroscope measurements and create 3 new columns for each that have the absolute values of the original measurements. 
#This will allow me to calculate additional time-series columns that provide more information for my behavioral classification model to work with and use to describe the quantified motions associated with each observed behavior.
#This will be my "feature extraction" section and will probably have a lot more functions later.
#____________________________________________________________________________________________

#' Calculate the absolute values of each measurement in a column
#' 
#' Creates and stores each measurement's absolute value in a new column in the data set
#'
#'
#'@param data dataframe containing column of interest
#'@param col column containing measurements of interest
#'@param new_col name new column in which absolute values will be stored
#'@return column The new column containing the calculated absolute values (numeric)
#'
#'@export 
#'

absValues <- function(data, col, new_col){
  new <- data %>% 
    mutate(new = abs({{col}})) %>% 
    rename({{new_col}} := new) 
  return(new)
}

#abs <- mcgreal_pkg %>% 
  #absValues(col = Acc_X, new_col = absAcc_X) %>% 
  #absValues(col = Acc_Y, new_col = absAcc_Y) %>%
  #absValues(col = Acc_Z, new_col = absAcc_Z) 
#View(abs)
