#This plotting function will allow me to visualize all three axes of dynamic ("linear") acceleration, from which ODBA is derived, with ODBA itself through time and categorized by behavior type. 
#This will help me understand which behaviors result in the most/least activity and, at the same time, what particular motions are making up those behaviors and levels of activity.

#library(ggplot2)
#createBehaviorAccODBAPlot
#____________________________________________________________________________________________

#' Plot ODBA and dynamic acceleration values over time and categorize by behavior
#' 
#' Creates and saves a plot that visualizes the 3 axes of dynamic acceleration and associated calculated ODBA value labelled by behavior observed by an individual over time
#'
#'
#'@param data dataframe containing columns of interest
#'@param x column containing timestamps
#'@param yX column containing values from the accelerometer's X-axis
#'@param yY column containing values from the accelerometer's Y-axis
#'@param yZ column containing values from the accelerometer's Z-axis
#'@param yODBA column containing the calculated ODBA values
#'@param behavior column containing behavioral annotations
#'@param dest destination for the plot to be saved
#'@return the final plot
#'
#'@export 
#'

createBAOPlot <- function(data, x, yX, yY, yZ, yODBA, behavior, dest){
  plot <- ggplot(data = data, aes(x = {{x}}, color = {{behavior}})) + 
    geom_line(aes(y = {{yX}}), color = "hotpink") + 
    geom_line(aes(y = {{yY}}), color = "skyblue2") + 
    geom_line(aes(y = {{yZ}}), color = "goldenrod1") +
    geom_line(aes(y = {{yODBA}}), color = "lightgrey") +
    geom_hline(yintercept = 0) 
  ggsave(dest)
  return(plot)
}

