# Hands-on Lab: Final project

library(rvest)
library(tidyverse)
library(httr)


# TASK 1
# Writing a function to use HTTP request to get a public COVID-19 Wiki page.

# First, let's write a function to use HTTP request to get a public COVID-19 Wiki page.
#Before you write the function, you can open this public page from this URL https://en.wikipedia.org/w/index.php?title=Template:COVID-19_testing_by_country using a web browser.
# The goal of task 1 is to get the html page using HTTP request (httr library)

get_wiki_covid19_data <- function() 
  {
    wiki_base_url <- "https://en.wikipedia.org/w/index.php"
    wiki_params <- list(title= "Template: COVID-19_testing_by_country")
    wiki_response <- GET(wiki_base_url, query = wiki_params)
    return(wiki_response)
}

covid19 <<- get_wiki_covid19_data()

print(covid19)



# TASK 2
# Extract COVID-19 testing data table from the wiki HTML page

wiki_page <- read_html(covid19)
allTables <- wiki_page %>% html_table(fill= TRUE) # to see all the tables

covid_df <- allTables[[2]] # we're only interested in table 2 since it contains the data we need
covid_df


# TASK 3
#Preprocess and export the extracted data frame
# The goal of task 3 is to pre-process the extracted data frame from the previous step, and export it as a csv file

preprocess_covid_data_frame <- function(covid_df) {
  
  shape <- dim(covid_df)
  
  #Remove the World row
  
  covid_df <- covid_df[!(covid_df$`Country or region`=="World"),]
  
  # Remove the last row
  covid_df <- covid_df[1:172, ]
  
  # We dont need the Units and Ref columns, so can be removed
  covid_df["Ref."] <- NULL
  covid_df["Units[b]"] <- NULL
  
  # Renaming the columns
  names(covid_df) <- c("country", "date", "tested", "confirmed", "confirmed.tested.ratio", "tested.population.ratio", "confirmed.population.ratio")
  
  # Convert column data types
  covid_df$country <- as.factor(covid_df$country)
  covid_df$date <- as.factor(covid_df$date)
  covid_df$tested <- as.numeric(gsub(",","",covid_df$tested))
  covid_df$confirmed <- as.numeric(gsub(",","",covid_df$confirmed))
  covid_df$'confirmed.tested.ratio' <- as.numeric(gsub(",","",covid_df$`confirmed.tested.ratio`))
  covid_df$'tested.population.ratio' <- as.numeric(gsub(",","",covid_df$`tested.population.ratio`))
  covid_df$'confirmed.population.ratio' <- as.numeric(gsub(",","",covid_df$`confirmed.population.ratio`))
  
  return(covid_df)
}

new_covid_data_frame <- preprocess_covid_data_frame(covid_df)

print(new_covid_data_frame)

summary(new_covid_data_frame)

write.csv(new_covid_data_frame, "covid.csv")





# TASK 4
# Get a subset of the extracted data frame
# The goal of task 4 is to get the 5th to 10th rows from the data frame with only country and confirmed columns selected

covid_dataset <- read.csv("covid.csv", header = TRUE, sep= ",")

covid_subset <- subset(covid_dataset[5:10, c("country","confirmed")])

covid_subset





# TASK 5
# Calculate worldwide COVID testing positive ratio
# The goal of task 5 is to get the total confirmed and tested cases worldwide, and try to figure the overall positive ratio using confirmed cases / tested cases


# Return the total confirmed cases worldwide
total_confirmed_cases <- sum(covid_dataset$confirmed)
total_confirmed_cases

# Get the total tested cases worldwide
total_tested_cases <- sum(covid_dataset$tested)
total_tested_cases

# Get the positive ratio (confirmed / tested)
positive_ratio <- total_confirmed_cases / total_tested_cases
positive_ratio




# TASK 6
# Get a country list which reported their testing data
# The goal of task 6 is to get a catalog or sorted list of countries who have reported their COVID-19 testing data

# Get the `country` column
country_column <- covid_dataset$country
country_column

# Check its class (should be Factor)
class(country_column)

# Convert the country column into character so that you can easily sort them
country_column <- as.character(country_column)

# Sort the countries AtoZ
AtoZ <- sort(country_column)

# Sort the countries ZtoA
ZtoA <- sort(country_column, decreasing = TRUE)

# Print the sorted ZtoA list
print(ZtoA)



# TASK 7
# Identify countries names with a specific pattern
# The goal of task 7 is using a regular expression to find any countires start with United

# Use a regular expression `United.+` to find matches
united_countries <- grep('United.+', covid_dataset$country, value = TRUE)


# Print the matched country names
print(united_countries)



# TASK 8
# Pick two countries you are interested, and then review their testing data
# The goal of task 8 is to compare the COVID-19 test data between two countires, you will need to select two rows from the dataframe, and select country, confirmed, confirmed-population-ratio columns

# Select a subset (should be only one row) of data frame based on a selected country name and columns
philippines_subset <- covid_dataset %>% select(country, confirmed, confirmed.population.ratio) %>% filter(country == 'Philippines')
philippines_subset
# Select a subset (should be only one row) of data frame based on a selected country name and columns
thailand_subset <- covid_dataset %>% select(country, confirmed, confirmed.population.ratio) %>% filter(country == 'Thailand')
thailand_subset



# TASK 9
# Compare which one of the selected countries has a larger ratio of confirmed cases to population
# The goal of task 9 is to find out which country you have selected before has larger ratio of confirmed cases to population, which may indicate that country has higher COVID-19 infection risk


# Use if-else statement
if(philippines_subset$confirmed.population.ratio > thailand_subset$confirmed.population.ratio) {
    print("Philippines has higher infection risk than Thailand")
} else {
  print("Philippines has lower infection risk than Thailand")
}



# TASK 10
# Find countries with confirmed to population ratio rate less than a threshold
# The goal of task 10 is to find out which countries have the confirmed to population ratio less than 1%, it may indicate the risk of those countries are relatively low

# Get a subset of any countries with `confirmed.population.ratio` less than the threshold
low_risk_countries <- subset(covid_dataset, subset = confirmed.population.ratio < 1)
low_risk_countries

