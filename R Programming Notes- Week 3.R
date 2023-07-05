# R Programming Notes: Week 3



# CONDITIONS AND LOOPS

  # IF Statements
    movie_year <- 2002
    if(movie_year > 2000) {
        print('Movie year is greater than 2000')
    } else {
        print('Movie year is not greater than 2000')
    }
    
    
    movie_year2 <- 1998
    if(movie_year2 > 2000) {
      print('Movie year is greater than 2000')
    } else {
      print('Movie year is not greater than 2000')
    }
    
  #Logical operators
    "Toy Story" == "Toy Story" # Use double (==) because the single (=) is used for variable assignment
    "Toy Story" != "Interstellar" 
    
  # Comparison and logical operators
    == # is equal to
    != # is not equal to
    >  # greater than
    <  # less than
    >= # greater than or equal to
    <= # less than or equal to
    &  # And
    |  # Or
    !  # Not
    %in% #is found in
      
      # example 1
        movie_year = 1997
        
        if(movie_year < 2000 & movie_year > 1990) {
          print('Movie year between 1990 and 2000')
        } else {
          print('Movie year not between 1990 and 2000')
        }
    
      #example 2
        movie_year = 1997
        
        if(movie_year > 2010 | movie_year < 2000) { # any of the condition have to be true
          print('Movie year is not between 2000 and 2010')
        }
      
      
  
  # Combining logical operators
    "Toy Story" == "Toy Story" & 1995 < 1987 # will return false because not all conditions are true (2nd statement is false)
    "Toy Story" == "Toy Story" & 1992 > 1987 # will return true because all conditions are true
   
    
   
# LOOPS:
    
  # For loops: Can be used to cycle through all the values in a vector.
    years <- c(1995, 1998, 1985, 2011, 1936, 1999)
    
    for (yr in years) {
        print(yr)
    }
    
    for(yr in years) {
      if(yr < 1980) {
        print("Old movie")
      } else {
        print("Not that old")
      }
    }
    
    # Another example of for loops: Let’s try to use a for loop to print all the years present in the year column in the movies_data data frame.
    
    # Get the data for the "year" column in the data frame.
    years <- movies_data['year'] # movies_data is name of data frame, year is name of column in csv
    # For each value in the "years" variable...
    # Note that "val" here is a variable -- it assumes the value of one of the data points in "years"!
    for (val in years) {
      # ...print the year stored in "val".
      print(val)
    }
    
    
  # While loops: Will continue to execute so long as the condition inside the parenthesis remains true.
    count <- 1
    
    while(count <= 5) {
      print(c("Iteration number:", count))
      count <- count + 1
    }
    
    
    # Another example for while loops: Let’s try using while to print the first five movie names of our dataset.
    
      # Creating a start point.
      iteration = 1
      # We want to repeat until we reach the sixth operation -- but not execute the sixth time.
      # While iteration is less or equal to five...
      while (iteration <= 5) {
        
        print(c("This is iteration number:",as.character(iteration)))
        
        # ...print the "name" column of the iteration-th row.
        print(movies_data[iteration,]$name)
        
        # And then, we increase the "iteration" value -- so that we actually reach our stopping condition
        # Be careful of infinite while loops!
        iteration = iteration + 1
      }
    
    
# SUBSET
    # Suppose we want a subset of the movies_data data frame composed of movies from a given year forward (e.g. year 2000)
    # if a selected variable is recent, or from that given year back if we select old.
    
    decade = 'recent'
    # If the decade given is recent...
    if(decade == 'recent' ){
      # Subset the dataset to include only movies after year 2000.
      subset(movies_data, year >= 2000)
    } else { # If not...
      # Subset the dataset to include only movies before 2000.
      subset(movies_data, year < 2000)
    }
    
    
# Applying Functions to Vectors: 
    
    # First, we create a vector...
    my_list <- c(10,12,15,19,25,33)
    # ...we can try adding two to all the values in that vector.
    my_list + 2
    # Or maybe even exponentiating them by two.
    my_list ** 2
    # We can also sum two vectors element-wise!
    my_list + my_list
    
    
#-------------------------------------------------------------------------------
    
#FUNCTIONS IN R: A function is a reusable block of code that can be reused in different parts of a program. 
    # Can be broken into predefined functions and user-defined functions

    
  # Common predefined functions
    ratings <- c(8.7, 6.9, 8.5)
    mean(ratings)
    
    sort(ratings) #ascending order
    
    sort(ratings, decreasing = TRUE) # descending order
    
    
  # User-defined functions
    
    #example 1
    printHelloWorld <- function() {
      print("Hello World")
    } # this function will print hello world when run
    
    printHelloWorld()
    
    #example 2
    add <- function(x,y) {
      x + y
    } # this function will add two values separated by comma
    add(87,89)
    
    # -OR- 
    
    add2 <- function(x,y) {
      return(x + y)
    }
    add2(3,4)
    
    
# IF/ELSE IN FUNCTIONS
    isGoodRating <- function(rating) {
      if(rating <7) {
        return("NO")
      } else {
          return("YES")
      }
    }
    
    isGoodRating(8)
    
    
  # You can also set a default value in the function argument, in this case, the threshold
    isGoodRating <- function(rating, threshold = 7) {
      if(rating < threshold) {
        return("NO")
      } else {
          return("YES")
      }
    }
    
    isGoodRating(10)
    
  # You can also override the default value (change the default value) by doing this:
    isGoodRating(8, threshold = 9)
    
    
  # Using functions within functions
    # Looking to see if you should see a movie based on their average using a function
    
    watchMovie <- function(moviename, my_threshold = 7) {
      rating <- my_data[my_data[,1]] == moviename, "average_rating"]
      isGoodRating(rating, threshold = mythreshold)
    }
    
    watchMovie("Akira")
    
    
  # Global and local variables
    myFunction <- function() {
      y <<- 3.14 # defined as a global variable that can be accessed outside the function
      temp <- 'Hello World'
      return(temp)
    }
  myFunction()
  
  
  
  
#-------------------------------------------------------------------------------

# STRING OPERATIONS IN R
  
  # Basic String Operations
  summary <- readLines("file_path/The_Artist.txt")
  summary
  
  # counting the characters
  nchar(summary[1])
  
  # to convert characters to upper case
  toupper(summary[1])
  
  # to convert characters to lower case
  tolower(summary[1])
    
  # to replace substring
  chartr(" ", "-", summary[1]) # replace all space with hyphen
  
  # to split a string
  char_list <- strsplit(summary[1], " ")
  word_list <- unlist(char_list) #since the first line retuns a list, we need to use the unlist function
  word_list
  
  # sort string in a list
  sorted_list <- sort(word_list)
  sorted_list
  
  # to concatenate strings
  paste(sorted_list, collapse = " ") # the collapse argument determines the string value that will separate the individual elements. In our case, we'll simply separate them by a simple space character.
  
  # to isolate a specific portion of a string, use substr
  sub_string <- substr(summary[1], start = 4, stop = 50)
  sub_string
  
  # to remove all whitespace from the beginning and end of a string, use trimws() function
  trimws(sub_string)
  
  # to form a substring by counting back from the last position (ex. last 8 characters), use  str_sub() function
  library(stringr)
  str_sub(summary[1], -8, -1) # we want to retrieve the last 8 characters (-8) from the last character (-1).
  
    
  
# ------------------------------------------------------------------------------
  
# REGULAR EXPRESSIONS IN R

  # Regular expressions are used to match patterns in strings and texts. 
  # if you need to isolate the domain name in email address
  # example: johndoe@google.com
  # we can use @.*\\.  (we use \\ because we don't want R to treat the 2nd period as a wildcard)
  
  # grep takes in at least two expressions: the regular expression and the list of strings you'd like to check for a match)
  grep("@.*", c("test@testing.com", "not an email", "test2@testing.com"))
  
  grep("@.*", c("test@testing.com", "not an email", "test2@testing.com"), value = TRUE) # to show the values that matched the expression
  
  gsub("@.*", "@newdomain.com", c("test@testing.com", "not an email", "test2@testing.com")) # to replace the strings that matched the expression with new string (newdomain)
  
  matches <- regexpr("@.*", c("test@testing.com", "not an email", "test2@testing.com"))
  regmatches(c("test@testing.com", "not an email", "test2@testing.com"), matches)  # to extract just the exact domain
  
  
  #Solving the problem: Suppose we are to get the domain name (ex. @example., @google.) of all email in a table with 2 columns: Name and Email and create a 3rd column with the extracted substring
  
  matches <- regexpr("@.*\\.", email_df[, 'Email'])
  email_df[, 'Domain'] = regmatches(email_df[, 'Email'], matches)
  
# Regular Expression applications
  # 1 Data Extraction
  # 2 Cleaning
  # 3 Data Analysis
  # 4 Data Validation
  # 5 Text Mining
  # 6 Parsing
  

# Miscellaneous
  # To read text files in R, we can use the built-in R function readLines().
  # To check length of data variable
    length(my_data)
  # To check the size of the file, use the file.size() method of R and it takes file path as argument and returns the number of bytes.
  
  # Another method to read text files is the scan() method. The difference: readLines() read text line by line while scan() read text files word by word
    my_data1 <- scan("The_Artist.txt", "")
    my_data1
    
    
#-------------------------------------------------------------------------------

#DATE FORMAT IN R
    
  # To check the structure of the data frame, use the str() function
    str(bestActors) # name of data frame is bestActors
    
  # Converting UNIX time to Date (counts the seconds since 01-01-1970)
    actors.birthday <- as.POSIXct(bestActor$Date.of.Birth, origin = "1970-01-01")
    # the output will be a full time stamp with this structure: YYYY-MM-DD HH:MM:SS
    # Since we don't need the timestamp, we can use this function:
    actors.birthday <-as.Date(actors.birthday)
    
  # Converting character and factor formats to Date (ex. of Factor w/ 10 levels "1945/07/26" , "1949/06/22")
    actresses.birthday <- as.Date(bestActresses$Date.of.Birth, "%Y/$m/$d") 
    # The first argument is the string we want to transform into a date object,the second parameter tells the function to expect the date format to be year/month/day
    
  # Other formats
    #1  "%a" = "Three character abbreviated weekday name"
    #2  "%A" = "Full weekday name"
    #3  "%b" = "Three character abbreviated month name"
    #4  "%B" = "Full month name"
    #5  "%d" = "Day of the month"
    #6  "%m" = "Month of the year"
    #7  "%y" = "Two digit year representation"
    #8  "%Y" = "Four digit year representation"
    
  #USEFUL DATE FUNCTIONS
    as.Date("1994/06/27") - as.Date("1959/01/01") # tells time difference between dates
    
    as.Date("1994/06/27") > as.Date("1959/01/01") #Boolean
    
    as.Date("1994/06/27") - 14 # subtract a number from a date
    
    Sys.Date() # returns the current date as a date class object
    
    date() # returns a character string describing the current date and time
    
    Sys.time() # returns the current time in the POSIX timestamp format
    
    weekdays(Sys.Date()) # converts the date into a string representing the week day that the date falls on
    
    months(Sys.Date()) # converts the date into a string representing the month
    
    quarters(Sys.Date()) # converts the date into a string representing the quarter
    
    julian(Sys.Date()) # to convert your date to julian calendar
    
    seq(Sys.Date(), by = "month", length.out = 4) # create a sequence of dates based on some reference point and length
    # this example starts at current date, then move in 1 month increments until 4 months is achieved
    
    

    
  