# Hands-on Lab: Importing Data in R

# We've made it easy for you to get the data, which we've hosted online. Simply run the code cell below (Shift + Enter) to download the data to your current folder.

# Download datasets

# CSV file
download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/movies-db.csv", 
              destfile="movies-db.csv")

# XLS file
download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/movies-db.xls", 
              destfile="movies-db.xls")


# To read CSV files into R, we use the core function read.csv.
# Load the CSV table into the my_data variable.
my_data <- read.csv("movies-db.csv")
my_data

# The data was loaded into the my_data variable. But instead of viewing all the data at once, we can use the head function to take a look at only the top six rows of our table, like so:
# Print out the first six rows of my_data
head(my_data)


# Additionally, you may want to take a look at the structure of your newly created table. R provides us with a function that summarizes an entire table's properties, called str. Let's try it out.
# Prints out the structure of your table.
str(my_data)

# Coding Exercise: in the code cell below, get the summary of my_data data frame
# Write your code below. Don't forget to press Shift+Enter to execute the cell
summary(my_data)


# Whenever you are going to use a library that is not native to R, you have to load it into the R environment after you install it. In other words, you need to install once only, but to use it, you must load it into R for every new session.
# Load the "readxl" library into the R environment.
library(readxl)

# Now that we have our library and its functions ready, we can move on to actually reading the file. In readxl, there is a function called read_excel, which does all the work for us. You can use it like this:
# Read data from the XLS file and attribute the table to the my_excel_data variable.
my_excel_data <- read_excel("movies-db.xls")


#Since my_excel_data is now a dataframe in R, much like the one we created out of the CSV file, all of the native R functions can be applied to it, like head and str.
# Prints out the structure of your table.
# Tells you how many rows and columns there are, and the names and type of each column.
# This should be the very same as the other table we created, as they are the same dataset.
str(my_excel_data)


# ACCESSING ROWS AND COLUMNS
#Whenever we use functions to read tabular data in R, the default method of structuring this data in the R environment is using Data Frames -- R's primary data structure. Data Frames are extremely versatile, and R presents us many options to manipulate them.

#Suppose we want to access the "name" column of our dataset. We can directly reference the column name on our data frame to retrieve this data, like this:

# Retrieve a subset of the data frame consisting of the "name" columns
my_data['name'] #<< NOT A VECTOR

#Another way to do this is by using the $ notation which at the output will provide a vector:
# Retrieve the data for the "name" column in the data frame.
my_data$name # << WILL GIVE A VECTOR


#You can also do the same thing using double square brackets, to get a vector of names column.
my_data[["name"]] # << WILL GIVE A VECTOR


# Similarly, any particular row of the dataset can also be accessed. For example, to get the first row of the dataset with all column values, we can use:
# Retrieve the first row of the data frame.
my_data[1,]


# We can specify more than one column or row by using c, the concatenate function. By using c to concatenate a list of elements, we tell R that we want these observations out of the data frame. Let's try it out.
# Retrieve the first row of the data frame, but only the "name" and "length_min" columns.
my_data[1, c("name","length_min")]



# Accessing Built-in Datasets in R

# Displays a list of the inbuilt datasets. Opens in a new "window".
data()

# Thankfully, R has documentation present for each inbuilt dataset. You can take a look at that by using the help function.
# Opens up the documentation for the inbuilt "women" dataset.
help(women)

# Since the datasets listed are inbuilt, you do not need to import or load them to use them. If you reference them by their name, R already has the data frame ready.
women










