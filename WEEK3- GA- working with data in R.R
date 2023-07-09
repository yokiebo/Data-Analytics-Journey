library(dplyr)
library(tidyverse)

ToothGrowth

#manual method
filtered_tg1 <- filter(ToothGrowth, dose == 0.5, supp == "VC")
arrange(filtered_tg1, len)

# piping method
filtered_tg2 <- ToothGrowth %>% filter(dose == 0.5, supp == "VC") %>% arrange(len)
filtered_tg

# or by doing nested function
arrange(filter(ToothGrowth, dose == 0.5, supp == "VC"),len)

# group by
filtered_tg3 <- ToothGrowth %>% 
  filter(dose == 0.5) %>% 
  group_by(supp) %>% 
  summarise(mean_len = mean(len, na.rm = T), .group = "drop")

filtered_tg3

#-------------------------------------------------------------------------------

# DATA FRAMES 


data("diamonds") 
View(diamonds)
# or just 
diamonds

head(diamonds) # give us the first six rows

str(diamonds) # get the structure

colnames(diamonds) # to get the column names

glimpse()

mutate() # to make changes to our data frame

# example: if we want to add new column:
mutate(diamonds, carat2 = carat *100)
# OR
diamonds %>%  mutate(carat2 = carat * 100 )


# WORKING WITH DATA IN R

install.packages("here")
install.packages("skimr")
install.packages("janitor")

library("here")
library("skimr") # makes summarizing data really easy and lets you skim through it more quickly
library("janitor") # has functions for cleaning data
library("dplyr")

install.packages("palmerpenguins") # for our dataset
library("palmerpenguins")


# CLEANING FUNCTIONS IN R


# The following are functions to use to get SUMMARY of our dataframe:
  # skim_without_charts()
  # glimpse()
  # head()
  # select()

skim_without_charts(penguins) # gives us a pretty comprehensive summary of a dataset

glimpse(penguins) # to get a quick idea of what's in this data set

head(penguins) # to get a preview of the first six rows

select()
# example: 
penguins %>% select(species) # to select only species column
penguins %>%  select(-species) # to select only all columns except species column


# To rename a column, use rename() function
penguins %>% rename(island_new = island) # to change our column name

# To change column names to be more consistent, we can use the rename_with()
penguins %>% rename_with(toupper) # makes it ALLCAPS
  #OR
rename_with(penguins, toupper)

penguins %>% rename_with(tolower) # to change back to lowercase


# To clean ensure that there is only numbers, characters and underscore in your data, use clean_name() function
clean_names(penguins)
# OR
penguins %>%  clean_names



# ORGANIZING DATA IN R

# TO SORT DATA
  # to sort in ascending order
  penguins %>% 
    arrange(bill_length_mm) 

  # to sort in descending order
  penguins %>% 
    arrange(-bill_length_mm)

  # it is important to assign this result to a variable so we can reuse this later

  new_penguins <- penguins %>% arrange(bill_length_mm)
  new_penguins


# TO GROUP DATA
  # be careful in using drop_na() because it will remove rows from the data. It is useful when doing summary statistics. 
penguins %>% group_by(island) %>% 
  drop_na() %>%
  summarize(mean_bill_length_mm = mean(bill_length_mm)) # to get mean bill length


penguins %>% group_by(island) %>% 
  drop_na() %>% 
  summarize(max_bill_length_mm = max(bill_length_mm)) # to get max bill length


penguins %>%  group_by(species, island) %>% # to group several columns and summarize several columns
  drop_na() %>% 
  summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm), min_bl = min(bill_length_mm))

# TO FILTER RESULTS
penguins %>% filter(species == "Adelie")



# TO TRANSFORM DATA

# to create a data frame
id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)
print(employee)

# to split name into first name and last name, use separate() function
separate_employee <- separate(employee, name, into = c("first_name", "last_name"), sep = " ") # sep is where to separate the column, in our case, the space between first name and last name
separate_employee

# to unite two or more columns into one column, use unite() function
unite(separate_employee, "name", first_name, last_name, sep = " ") # arguments: dataframe, "name of new column", column 1 (no need ""), column 2 (no need ""), separator

# to create new column in our data frame, use mutate_function
new_penguins <- penguins %>%  mutate(body_mass_kg = body_mass_g / 1000, flipper_length_m = flipper_length_mm / 1000) # if we want to add a new column for body mass in kg
new_penguins


# SUMMARIZING DATA FRAMES AND HOW TO ADDRESS BIAS

# Let's install the Antscombe package first
install.packages("Tmisc")
library(Tmisc)
data("quartet")
View(quartet)

  
quartet %>% 
  group_by(set) %>% 
  summarize(mean(x), sd(x), mean(y), sd(y), cor(x,y))
# sd(standard deviation) can help us understand the range of values in the dataset
# cor (correlation) shows us how strong the relationship between two variables is
  
# If we look at the dataset just basing on the summary, it is almost identical but if you plot it, you will see that it is very different.

ggplot(quartet, aes(x,y)) + geom_point() + geom_smooth(method = lm, se= FALSE) + facet_wrap(~set)

# The datasauRus package creates plots in different shapes
install.packages("datasauRus")
library(datasauRus)
  
ggplot(datasaurus_dozen, aes(x=x, y=y, colour = dataset)) + geom_point() + theme_void() + theme(legend.position = "none") + facet_wrap(~dataset, ncol = 3)
  
  
# Checking bias using R functions

# In R, we can quantify bias by comparing the actual outcome of our data with the predicted outcome.
# In SimDesign package, ff the model is unbiased, the outcome should be pretty close to zero. A high result means that your data might be biased. 

install.packages("SimDesign")
library("SimDesign")

# Let's check if the local weather predictions are biased
actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)

bias(actual_temp, predicted_temp)
# the result is pretty high, which means they aren't as accurate as they could be.

