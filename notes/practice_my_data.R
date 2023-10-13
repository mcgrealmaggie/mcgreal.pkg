####Practice with my data 
#create a function to join the acc data

#example
#sum_columns <- function(data, column_one, column_two){
#join <- data %>% 
 # na.omit(data) %>% 
 #select({{column_one}}, {{column_two}}) %>% 
 #mutate(sum = {{column_one}} +{{column_two}})
#return(join)
#}

#sum_columns(surveys, column_one = hindfoot_length, column_two = weight)


#data_1 <- read_csv("projects/project_one/class_data_v1.csv", na = "1000")
#data_1

#sum_acc <- function(data, column_one, column_two, column_three){
  #join <- data %>% 
   # select({{column_one}}, {{column_two}}, {{column_three}}) %>% 
  #  mutate(sum = {{column_one}} + {{column_two}} + {{column_three}})
 # return(join)
#}

#data_2_acc <- sum_acc(data_1, column_one = Acc_X, column_two = Acc_Y, column_three = Acc_Z)
#View(data_2_acc)

##Issue: summing negative values. to get true some of amplitude, make negatives positive using abs()
#sum_acc_2 <- function(data, column_one, column_two, column_three){
 # join <- abs(data) %>% 
  #  select({{column_one}}, {{column_two}}, {{column_three}}) %>% 
   # mutate(sum = {{column_one}} + {{column_two}} + {{column_three}})
  #return(join)
#}

#data_3_acc <- sum_acc_2(data_1, column_one = Acc_X, column_two = Acc_Y, column_three = Acc_Z)
#View(data_3_acc)
