#This function will import the data set and define NAs by changing all values of "1000" to NA.
#This will serve as my "clean data" function, as I do not want to get rid of any NAs right now.


readData <- function(file, na){
  data <- read_csv(file, na = na)
  return(data)
}
  

mcgreal_pkg <- readData(file = "mcgreal.pkg.csv", na = "1000")
