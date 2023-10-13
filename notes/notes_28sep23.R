#notes 28Sep23

#warmup
dub <- function(x){ #could call x "number_a"
  if(is.numeric(x) == TRUE){
  double <- x*2
  return(double)
  } else {
    print("Non-numeric data entered!")
  }
}

dub(2)

#how to test it? to prevent you from making mistakes in the first place
#what has to be true about x for this to work? -must be a variable/number
#testing falls into 3 categories
 ##preconditions: ensures the function has what it needs to work
is.numeric(2) #TRUE
is.numeric(a) #FALSE
  #to make sure x is numeric. then can check it by doing: "is.numeric(2)" or whatever your input is. should return "TRUE" if numeric; "FALSE" if not
  #issue putting as.numeric in function though because if we fail test we keep going 
  #try using as.numeric: will change value to numeric if it can
dub("dog") #error x*2 non-numeric argument. it not being numeric is not stopping it from trying though = issue
  #how to make it stop if not numeric?
  #"stopifnot(is.numeric(x))
dub2 <- function(x){ #could call x "number_a"
  stopifnot(is.numeric(x)) 
  double <- x*2
  return(double)
}
dub2(2) #4
dub2("dog") #error is.numeric(x) is not TRUE
  #IF AND ELSE STATEMENTS: 
a = 5
if(a>2){
  print("Hooray")
} else {
  print("Oh no!")
} #"Hooray"
  #if a>2 then print Hooray; if a<2 then print Oh no!
  #if one thing is true you do one thing; if another thing is true you do another thing
dub3 <- function(x){
  if(is.numeric(x) == TRUE){ #double ==
    double <- x*2
    return(double)
  } else {
    print("Non-numeric data entered!")
  }
}
dub3(2) #4
dub3("dog") #Non-numeric data entered!


#class prompt
#write a function with 3 arguments
  #a dataset
  #a column
  #the name of a new column that we will create
mcgreal_pkg
View(mcgreal_pkg)

abs_values <- function(data, column, new_column){
  new <- data %>% 
    mutate(new = abs({{column}})) %>% 
    rename({{new_column}} := new) 
  return(new)
}

Acc_X_abs <- abs_values(mcgreal_pkg, column = Acc_X, new_column = Acc_X_abs) 

View(Acc_X_abs)

#try with all 3 Acc columns
Acc_abs <- mcgreal_pkg %>% 
  abs_values(column = Acc_X, new_column = Acc_X_abs) %>% 
  abs_values(column = Acc_Y, new_column = Acc_Y_abs) %>% 
  abs_values(column = Acc_X, new_column = Acc_Z_abs)
View(Acc_abs)
