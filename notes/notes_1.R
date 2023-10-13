surveys %>%
filter(!is.na(weight)) %>%  #take out missing values and keep only ones that have data
mutate(weight_kg = weight/1000,
      weight_kg_2 = weight_kg*2) %>%
select(weight, weight_kg, weight_kg_2, record_id)

#is.na will give us only the NA values for weights but the "!" takes the inverse, giving us only the actual values
#"!=" ---> not equal to

surveys_hindfoot <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  select(species_id, hindfoot_half) %>% 
  filter(hindfoot_half < 30)
surveys_hindfoot

## Warm up: 29Aug23
surveys

# data 1980-1989
surveys_warmup <- surveys %>% 
  filter(year > 1979, year < 1990) %>% 
  filter(!is.na(weight)) %>% 
  filter(!is.na(hindfoot_length)) %>% 
  mutate(weight_hflength = weight/hindfoot_length)

# order of operations
surveys_warmup_class <- surveys %>% # start pipe
  filter(year >= 1980, year <= 1989) %>% # first command, filter year
  mutate(weight_hindfoot = weight/hindfoot_length) %>%  # create new column
  filter(!is.na(weight_hindfoot))
  
surveys_warmup_class

## Working With Data II: 29Aug23

surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

  
# group_by function -> makes groups of data by some variable
# summary command + mean command -> takes the mean of a variable
# na.rm = TRUE -> "na remove" removes the NAs or putting them in their own column so you can still calc your average. This is different than mutate because it took all the ave weights for females and all the ave weights for males
# Only removed NAs from the weight means, so the NA in the output is its own category since there was F, M, and NAs in the sex column
# Putting na.rm = FALSE would be the same as just not putting it at all

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight))

#With summary command you can do goup_bys across multiple different levels of things

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight)) %>% 
  print(n = 20) # will show you first 20 rows

## Challenge: mean weight, min weight, and max weight BY SEX (= gives you 3 rows)

surveys %>% 
  na.omit() %>% # na.omit() removes all NAs in whole data table  
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight), min_weight = min(weight), max_weight = max(weight)) %>% 
  arrange(max_weight) # visually arranges/moves things around

surveys %>% 
  count(sex) # count -> gives you count of the # of things there are within that grouping

surveys %>% 
  count(sex, species_id) %>% 
  arrange(species_id, desc(n)) # arrange by species in descending order, so alphabetical and most numerous

## Challenge: # animals per plot type, mean min max per species id hindfoot, heaviest animal per year

surveys %>% 
  count(plot_id)

surveys %>% 
  group_by(species_id) %>% 
  filter(!is.na(hindfoot_length)) %>% 
  summarize(mean_hindfoot = mean(hindfoot_length), 
            min_hindfoot = min(hindfoot_length), 
            max_hindfoot = max(hindfoot_length))

surveys %>% 
  group_by(year) %>% 
  na.omit() %>% 
  summarize(max_weight = max(weight)) %>% 
  arrange(year)

# End challenge

surveys %>% 
  na.omit() %>% 
  group_by(year) %>% 
  filter(weight == max(weight)) %>% #looking for the thing in the weight column for every year and finding which of these weight values is the highest (will find and keep the row that has the highest weight value)
  select(year, weight, species_id, record_id) %>% 
  arrange(year)

# new

heaviest_animal <- surveys %>% 
  na.omit() %>% 
  group_by(year) %>% 
  filter(weight == max(weight)) %>% 
  select(year, weight, species_id, record_id) %>% 
  arrange(year)

heaviest_animal

write_csv(heaviest_animal, path = "data/data_output/big_rats.csv")
