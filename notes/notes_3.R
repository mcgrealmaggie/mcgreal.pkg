####notes_3
####5Sep23

## Warmup
portal_data <- read_csv("data/portal_data_joined.csv")
portal_data

#remove the NAs from the numeric columns, save as variable
portal <- portal_data %>% 
  na.omit()

#check it; if mean comes back NA then didn't work
mean(portal$weight)

##Plotting
library(ggplot2)

ggplot(data = portal) #gives us blank canvas layer
ggplot(data = portal, mapping = aes(x = weight, y = hindfoot_length)) #x = independent variable, y = dependent variable. aka we think weight predicts hindfoot_length of aninmal. adds dimension to canvas
#R cuts off graph based on values in weight column

ggplot(data = portal, mapping = aes(x = weight, y = hindfoot_length)) + geom_point()

install.packages("hexbin")
library(hexbin)

ggplot(data = portal, mapping = aes(x = weight, y = hindfoot_length)) + geom_hex()
#showing us density of points, "hotspots". harder to see individual values for any one animal

ggplot(data = portal, mapping = aes(x = weight, y = hindfoot_length)) + geom_point(alpha = 0.1, color = "blue") 
#alpha argument to geom_point() function, can make some points transparent. 0.1 = 10% opacity

ggplot(data = portal, mapping = aes(x = weight, y = hindfoot_length)) + geom_point(alpha = 0.1, aes(color = species_id))
#color as an aes argument will go to species id column, count number of unique species id's and divides up the rainbow

##Challenge
#geom_point()
#try it with a non-numeric x axis... species_id, sex
#to see how it displays non-numeric/discrete data... vertical

ggplot(data = portal, mapping = aes(x = species_id, y = hindfoot_length)) + geom_point(aes(color = sex))

ggplot(data = portal, mapping = aes(x = sex, y = hindfoot_length)) + geom_point()

##Box and whisker plots
#more useful for discrete data

ggplot(data = portal, mapping = aes(x = species_id, y = hindfoot_length)) + geom_boxplot()
#usu want to use median when many outliers
#big benefit = can see where most of data per species lie, average size for an animal
#cannot see underlying data points, just summary (box)
#can put the data back on the plot

ggplot(data = portal, mapping = aes(x = species_id, y = weight)) + #plus sign needs to be at end of previous row
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato")
#geom_jitter() puts the points back on the plot
#can see that some sp have way more data than others
#turn off boxplot alpha then put jitter first to put the boxes on top

####Break exercise
#+ geom_violin() make same plot with violin plot instead of geom_boxplot
#+ represent things on a log scale scale_x_log10(), scale_y_log10()
#+ either a box or violin plot of weight, with color by plot_id
install.packages("viridis")
library(viridis)

#violin plot, gives you a sense of how data is distributed
ggplot(data = portal, mapping = aes(x = species_id, y = hindfoot_length)) + geom_violin()

#log scale. both must be numeric. scales it to be more proportional 
ggplot(data = portal, mapping = aes(x = weight, y = hindfoot_length)) + geom_point() + scale_y_log10()


##Plotting time series data
library(tidyverse)
yearly_counts <- portal %>% #count of how many of each genus we see every year
  count(year, genus)
yearly_counts

#usu represented with line plots
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) #no data, gives us our axes and canvas. n = observations per genus
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) + geom_line() #not very helpful, must group by genus/species_id
ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = genus)) + geom_line() #add group = genus to aes argument
#gives each genus its own line, better but not great still
ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = genus, color = genus)) + geom_line() #color by genus by adding color = genus to aes argument

##Communicating without color
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) + 
  geom_line() +
  facet_wrap(facets = vars(genus)) #vars is how you want to group it up. same as group 

#viewing males and females separately
yearly_counts_sex <- portal %>% 
  count(year, genus, sex)
#3 columns: year, how often each genus was observed, broken up into if observations were male or female

ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(facets = vars(genus))
#color assignment is alphabetical. female before male. f = salmon, m = teal
#y axis is rescaled because we do not have as many observations when splitting them into m and f (dividing up data makes each group smaller)

ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_grid(rows = vars(sex), cols = vars(genus))

#back to old view
#theme_bw()
ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(facets = vars(genus)) +
  theme_bw()

#theme_minimal()
ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(facets = vars(genus)) +
  theme_minimal()

#least popular theme
ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(facets = vars(genus)) +
  theme_void()

ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n, color = sex)) +
geom_line() +
  facet_wrap(facets = vars(genus)) +
  theme_
