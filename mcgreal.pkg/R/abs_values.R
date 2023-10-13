abs_values <- function(data, column, new_column){
  new <- data %>% 
    mutate(new = abs({{column}})) %>% 
    rename({{new_column}} := new) 
  return(new)
}