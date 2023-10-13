##31Aug23
##Warm up
#write in the data file
data_warmup <- read_csv("data/portal_data_joined.csv")
data_warmup

#remove NA values, mean weight of animal collected per plot type, count how many NL per plot
data_warmup_2 <- data_warmup %>% 
  filter(!is.na(weight)) %>% 
  filter(!is.na(plot_type)) %>% 
  filter(!is.na(species_id)) %>% 
  mutate(mean_weight = mean(weight)) %>% 
  group_by(plot_type)
data_warmup_2

##Warm up solutions
warmup <- read_csv("data/portal_data_joined.csv")
warmup %>% 
  na.omit() %>% #resulting data will be larger if you omit just weight NAs, in this case the whole row is removed even if it's just missing sex data, etc.
  group_by(plot_type) %>% #if you group by weight then you can't take the average of the weights in each plot type group
  summarize(mean_weight = mean(weight))
warmup %>% 
  group_by(plot_type) %>% 
  filter(!is.na(weight)) %>% 
  summarize(mean_weight = mean(weight))
warmup %>% 
  group_by(plot_type) %>% 
  filter(!is.na(weight)) %>% 
  mutate(mean_weight = mean(weight)) #returns a crap ton of rows still, just organizes it by group and then has the same mean weight for all animals in each group type
warmup %>% 
  na.omit() %>% 
  group_by(plot_type, species_id) %>%
  filter(species_id == "NL") %>% 
  count()

##Class
surveys_wide <- warmup %>% #= each animal a column, each row a weight
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>%  #trying to get an ave weight per genus for each of different field sites
  summarize(mean_weight = mean(weight))
surveys_wide #still long format right now

surveys_true_wide <- surveys_wide %>% 
  spread(key = genus, value = mean_weight)
surveys_true_wide

surveys_true_wide <- surveys_wide %>% 
  spread(genus, mean_weight, fill = 0) #alternative way that fills in the NAs with 0's
surveys_true_wide

#revert to long format
surveys_gather <- surveys_true_wide %>% 
  gather(key = genus, value = mean_weight, -plot_id) # the "-" boots out a variable if you dont want it anymore
surveys_gather #didnt work? did not drop the plot_id

##Break prompt
#same surveys dataset
#do a summarize that will give you the number of distinct genera
#per year
#convert to wide: columns = years, values (rows) = # of distinct genera
surveys_distinct <- warmup %>% #surveys_distinct_long 
  na.omit() %>%
  group_by(year, plot_id) %>% 
  summarize(n_genus = n_distinct(genus))
surveys_distinct #simple way to calculate species richness in an area!!!

surveys_distinct_wide <- surveys_distinct %>% 
  spread(key = year, value = n_genus) #do not have to type the "key =" and "value =", could just be spread(genus, n_genus_) it assumes first thing is the key and second is value
surveys_distinct_wide

##Communicating Results
minitable <- warmup %>% 
  na.omit() %>% 
  group_by(plot_type) %>% 
  filter(species_id == "NL") %>% 
  count()
minitable
