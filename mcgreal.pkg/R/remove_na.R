library(tidyverse)

remove_na <- function(data, x, y, z) {
  na <- data %>% 
    select(x, y, z) %>% 
    na.omit()
  return(na)
}
