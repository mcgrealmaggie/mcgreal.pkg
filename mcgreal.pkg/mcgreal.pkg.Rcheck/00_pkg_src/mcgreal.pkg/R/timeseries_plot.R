#This plot function will allow me to create multiple plots, each representing a specific axis (e.g., X, Y, Z) for accelerometer or gyroscope data separated by behavior, allowing me to visualize and quickly judge the relationships between them. 

createTimeSeriesPlot <- function(data, x_var, y_var, behavior_var, facet_vars) {
  plot <- ggplot(data, aes_string(x = x_var, y = y_var, color = behavior_var)) +
    geom_line() +
    labs(x = x_var, y = y_var) +
    facet_wrap(facet_vars)
  
  return(plot)
}



#time_series_plot <- createTimeSeriesPlots(data = mcgreal_pkg,
 #                                         x_var = "timestamp",
  #                                        y_var = "LinAcc_X",
   #                                       behavior_var = "behavior",
    #                                      facet_vars = "~LinAcc_Y + LinAcc_Z")

#print(time_series_plot)