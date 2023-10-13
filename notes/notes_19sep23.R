#Notes 19Sep23

#what is a function?
#-they do something #sum() adds stuff
#-they have arguments #(1, 2)stuff to add
#-you get something back #return type/return value #[3]


#Function
#-name after what you're going to do
#-lines of code that work together to do something 

#Arguments
#-obvious names
#-information needed to make the function go

#Return type
#-every function should return 1 thing!
#-what you get back


#Write a function called calc_shrub_vol
calc_shrub_vol <- function(height, length, width) {
  volume <- height * length * width #tell it what it's going to do
  return(volume) #return statement
} #define functions by calling the function "function" (called recursion)

calc_shrub_vol(2, 4, 6)

calc_shrub_vol(2.5, 4.2, .8)

calc_shrub_vol(2.5, 4.2, q) #error

q <- 5 #give q a variable, typically don't do this but we could
calc_shrub_vol(2.5, 4.2, q)

calc_shrub_vol(length = 4, height = 2, width = 6) #can name the arguments. Named arguments can be reordered

volume #error, object not found
#functions are local in scope
#between the {}, volume, height, length, and width all exist
#outside {} none exist
#if you want to be able to access your volume (RETURN TYPE) after you've calculated it you need to save it to a variable

volume <- calc_shrub_vol(2, 4, 6) #like using read_csv without saving it to a variable
volume #anything you want to exist and use again have to save to variable

#Return statement
#-try removing it
calc_shrub_vol <- function(height, length, width) {
  volume <- (height * length * width)
  
}

calc_shrub_vol(2, 4, 6)
#-if you do not create a return, nothing is returned to you
#-in this case, a calculated value
#-it ran the math problem, it did the problem but did not tell you
#-put return type back in
calc_shrub_vol <- function(height, length, width) {
  volume <- (height * length * width)
  return(volume)
}

calc_shrub_vol(2, 4, 6)

#Assigning default values
#-if user doesn't give it a differe height, length, or width, the default will be 1 for all
calc_shrub_vol <- function(height = 1, length = 1, width = 1) {
  volume <- (height * length * width)
  return(volume)
}

calc_shrub_vol() #[1]

calc_shrub_vol(height = 2, length = 4) #[8]

calc_shrub_vol(2, , 4) #[8]

calc_shrub_vol(2) #[2]

calc_shrub_vol(height = 2, , length = 2) #[4]

#Create a function to use our volume to estimate a mass
est_shrub_mass <- function(volume){
  mass <- 2.65 * volume^0.9
  return(mass)
}

#-uses output from previous function to do its thing
#-how are we going to get the volume in there? a few dif ways
#--make variable for volume
volume <- calc_shrub_vol(2, 4, 6)
est_shrub_mass(volume) #[86.37001]
#--use other function
est_shrub_mass(calc_shrub_vol(2, 4, 6))

#Detour
surveys <- read_csv("data/portal_data_joined.csv") #function read_csv, argument (1st) data file name, return type read in your csv
#-get a variable that holds the equivalent of the entire hindfoot column
h_f <- surveys$hindfoot_length #one way to do it but saves it as a vector of values
h_f
#-remove the NAs
h_f <- h_f %>% 
  na.omit()
h_f

h_fl <- surveys %>% #other way to do it saves it as a df with one column
  select(hindfoot_length) %>% 
  na.omit() #switching the order WOULD remove all rows of NAs so you'd have less in the end
h_fl

#Create a function
multiply_by_two <- function(data) {
  product <- data*2
  return(product)
}

multiply_by_two(h_fl) 
#Did it do it right? how can we verify that it works when we have a bunch of data?
#-can manually check/look
#-some other mathematical operation
#-subset data
#-logical operations
#-break try: IGNORE THIS, I DIDNT GET IT
multiplied <- multiply_by_two(h_fl)
multiplied
#-can manually check/look
#-counting number of TRUEs
test <- h_fl *2
bools <- multiplied == test 
sum(bools)

#Moving on
#-what should we fill the arguments with? height, length, and width
est_shrub_density <- function(height, length, weight) {
  volume <- calc_shrub_vol(height, length, weight)
  mass <- est_shrub_mass(volume)
  density <- mass / volume
  return(density)
}
est_shrub_density(2, 4, 6) #[1.799375]
#-check
volume <- calc_shrub_vol(2, 4, 6)
mass <- est_shrub_mass(volume)
mass / volume #[1.799375] #checks out!

#How would you verify that you have a reasonable density?
#How do we know our inputs are correct?
#How do we know our outputs are correct?

#If you're going to use an R package, how do you know you can trust someone elses work?
