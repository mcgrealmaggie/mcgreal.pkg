library(tidyverse)

remove_na <- function(x, y, z) {
  na <- data %>% 
    select(x, y, z) %>% 
    na.omit()
  return(na)
}
