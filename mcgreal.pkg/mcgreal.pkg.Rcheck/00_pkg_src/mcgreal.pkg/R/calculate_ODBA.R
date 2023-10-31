#This function will add the absolute values of 3 columns together (X, Y, and Z axes of either of the two types of acceleration or gyroscope) to produce an output column of ODBA, which is a proxy for energy expenditure and what I'll use to determine and characterize general activity levels.

ODBA <- function(data, col_one, col_two, col_three, new_col){
  new <- data %>% 
    mutate(new = {{col_one}} + {{col_two}} + {{col_three}}) %>% 
    rename({{new_col}} := new)
  return(new)
}
  
ODBA1 <- ODBA(data = abs,
                col_one = absAcc_X,
                col_two = absAcc_Y, 
                col_three = absAcc_Z, 
                new_col = ODBA)
View(ODBA1)  
