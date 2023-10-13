##Notes 21Sep23

#recap of functions
# name_of_function <- function(argument = #info we are going to provide to our function, number_one = 1, number_two = 2){
#shift enter
#function body: product = number_one * number_two
#return statement: return(product)
}

name_of_function <- function(number_one = 1, number_two = 2) {
  product <- number_one * number_two
  return(product)
}

name_of_function()              
                             

division <- function(divide_by = 2) {
  result <- name_of_function()
  quotient <- result/2
  return(quotient)
}

division()

division(6)

division(8)


##Practice problem
#1 write yourself a new function
# -some sort of data operation on our surveys dataset (removes NAs, selects two data columns you want to look at)
#2 figure out why division() always returns an integer
# -bc we are using the default values of name_of_function?
# -could be a type conversion issue: bc we are using an integer R thinks everything is integers
surveys <- read_csv("data/surveys.csv")
surveys

#practice_function <- function(data, weight = weight, hfl = hindfoot_length) {
 # sum_cols <- weight + hfl
  #return(sum_cols)
#}

division <- function(first_num = 1.0, second_num = 2.0, divide_by){
  product <- name_of_function(first_num, second_num)
  result <- product/divide_by
  return(result)
}

division(6, 4, 2)

practice_function(surveys, weight, hindfoot_length)

remove_nas <- function(data) {
  clean <- data %>% 
    na.omit(data)
  return(clean)
}

remove_nas(surveys)


####### ADD TWO COLUMNS TOGETHER
#get a single column
select_col <- function(data, weight){
  clean <- data %>% 
    na.omit(data) %>% 
    select(weight)
  return(clean)
}

select_col(surveys)

#make more inclusive
select_col <- function(data, column){
  clean <- data %>% 
    na.omit(data) %>% 
    select({{column}}) #tells R this is going to be changing in response to the input provided in the argument
  return(clean)
}

select_col(surveys, "species_id")

select_col(surveys, column = plot_id)

#select multiple columns and add them together
sum_columns <- function(data, column_one, column_two){
  join <- data %>% 
    na.omit(data) %>% 
    select({{column_one}}, {{column_two}}) %>% 
    mutate(sum = {{column_one}} +{{column_two}})
  return(join)
}

sum_columns(surveys, column_one = hindfoot_length, column_two = weight)

sum_columns_vector <- function(data, vector){
  columns <- data %>% 
    select(all_of({{vector}})) 
  return(columns) #or c({{vector}})
}

cols <- c("plot_id", "weight", "hindfoot_length")

sum_columns_vector(surveys, vector = cols)







#####BACK TO CLASS
mathemagical <- function(data, columns){
  clean <- data %>% 
    na.omit() %>% 
    mutate(new_weights = weight/1000) %>% 
    select(all_of({{columns}}))
  return(clean)
}

#problems:
#only for weight column
#calculated column is named for the weights
#how do we get our calculated column

mathemagical(surveys, columns = "")
