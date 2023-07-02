# R Programming Notes: Week 2



# VECTOR AND FACTORS

#Vector - one-dimensional array of objects and is a simple tool to store your data
  
  # To create
    # TYPE 1: Numeric vector (to hold a list of numbers)
    c(1,2,3,4,5,6,7,8,9,10) # Vector that contains the numbers from 1 to 10
    c(1:10) # Also vector that contains the numbers from 1 to 10
    c(10:1) # If you want the numbers in decreasing order from 10 to 1 
    c(1985, 1999, 2010, 2002)
    
    ratings <- c(81, 125) # vectors can also be assigned in a variable
    ratings / 60
    
    # TYPE 2: Character vector (to hold a list of strings)
    c("Toy Story", "Akira", "The Artist", "City of God", "Toy Story", "Akira", "The Artist", "City of God")
    
    #TYPE 3: Logical vector (True or False)
    movie_ratings <- c(7.3, 8.5, 8.3, 7.5, 6.9, 5.2, 8.2, 8.0, 7.9, 9.3)
    movie_ratings > 7.5 # marks True or False the values that meet the condition
  
    
# Factors - are variables that can take an unlimited number of values. These variables are often referred to as 'categorical variables'.
    
  # To create: 
    # Step 1: Create a vector first
      genre_vector <- c("Comedy", "Comedy", "Animation", "Animation", "Crime")
    # Step 2: Create factor
      genre_factor <- factor(genre_vector)
      genre_factor
      # *Levels in output corresponds to the three unique categories of the vector: Animation, comedy, crime
      
  
  # Summarizing factors:
      summary(genre_factor) # Shows the count or number of occurences of each of the component categories
    
  
  #Types of Factors (categorical variables)
      # Type 1: Nominal categorical variables - have no implied order. Example is the genre_vector.
      # Type 2: Ordinal categorical variables - have ordering. 
      
          # To create ordinal variable:
      
          # Step 1: Create a vector first
          movielength_vector <- c("Very short", "Short", "Medium", "Short", "Long", "Very short", "Very long")
          
          # Step 2: Create factor
          movielength_factor <- factor(movielength_vector, 
                                ordered = TRUE,
                                levels = c("Very short", "Short", "Medium", "Long", "Very long"))
          
          movielength_factor
          
  
#VECTOR OPERATIONS
          
  # To NAME the elements of the vector use the names() function
      #example: We want to name the year vector with the title of the movie
      year <- c(1985, 1999, 2010, 2002)
      names(year) <- c("The Breakfast Club", "American Beauty", "Black Swan", "Chicago")
      
  # To call in the year vector using the name assigned:
      year["Black Swan"]
      
      
  # To return the LENGTH of a vector, use length() function
      year <- c(1985, 1999, 2010, 2002)
      length(year)
          
  # To SORT the vector, use the sort() function
      year <- c(1985, 1999, 2010, 2002)
      names(year) <- c("The Breakfast Club", "American Beauty", "Black Swan", "Chicago")
      year_sorted <- sort(year)
      year_sorted
      
  # To find the smallest/largest number, use the min() OR max() function
      year <- c(1985, 1999, 2010, 2002)
      min(year)
      
      year <- c(1985, 1999, 2010, 2002)
      max(year)
          
  # To find the AVERAGE of numbers, use sum() / no. of elements function OR mean() function
      cost_2014 <- c(8.6, 8.5, 8.1) #sum() function
      sum(cost_2014) / 3
      
      cost_2014 <- c(8.6, 8.5, 8.1) #mean() function
      mean(cost_2014)

  # To summarize vector, use summary() function
      cost_2014 <- c(8.6, 8.5, 8.1)
      summary(cost_2014)
      
      
#VECTOR INDEX
      
  # To return a single value
      cost_2014 <- c(8.6, 8.5, 8.1)
      cost_2014[2] # to return the 2nd value in the vector
    
  # To return multiple values
      cost_2014 <- c(8.6, 8.5, 8.1)
      cost_2014[c(2,3)] # returns the 1st and 2nd value in vector
  
  # To return a range of values
      cost_2014 <- c(8.6, 8.5, 8.1)
      cost_2014[1:3]
      
  # To return negative index values (to remove particular element from the output)
      titles <- c("Black Swan", "Casino", "City of God", "Jumanji", "Toy Story")
      titles[-1] #removes first index aka "Black Swan"
      
  # Out of range index
      titles <- c("Black Swan", "Casino", "City of God", "Jumanji", "Toy Story")
      titles[8] # This will return an NA since there are only 5 index in the vector
      
  # Conditional index
      cost_2014 <- c(8.6, 8.5, 8.1)
      cost_2014 > 8.3
      # To retrieve the elements that are true:
        cost_2014[cost_2014 > 8.3]
        
  # Missing values. Use NA for missing values
        age_restriction <- c(14, 12, 10, NA, 18, NA)
        

# VECTOR ARITHMETIC
        
  #example 1
  age_restriction <- c(14, 16, 12, 10, 18, 18)
  sequences <- c(2, 3, 0, 2, 6, 3)
  multiply <- age_restriction * sequences
  multiply
  
  #example 2
  cost_2014 <- c(8.6, 8.5, 8.1)
  multiply2 <- cost_2014 * 10
  multiply2
  
  
  
#-------------------------------------------------------------------------------

# LISTS - collections of objects like a vector but unlike a vector, the elements inside can differ in data type.

  # To create
      movie <- list("Toy Story", 1995, c("Animation", "Adventure", "Comedy"))
    
  # To access
      movie[2] #approach 1
    
      movie[2:3] #to access a range
    
    
  # NAMED LIST
    
    # To create
      movie <- list(name = "Toy Story",
                    year = 1995,
                    genre = c("Animation", "Adventure", "Comedy"))
    
    # To access
      movie$genre # Approach 1 (listname+$+name)
      movie["genre"] # Approach 2 (enclosed in a bracket)
  
  
    # Adding items to the list
      movie["age"] <- 5 # Simply add the item in square bracket then assignment operator then value. 
    
      
    # To modify the value of the list
      movie["age"] <- 6

    # To remove elements from the list
      movie["age"] <- NULL # Just assign a null value to the element
  

#-------------------------------------------------------------------------------

#ARRAY AND MATRICES 

# Arrays - A single or multidimensional structure containing data of the the same data type.
      
    # To create: 
      # Step 1: Create a vector first
        movie_vector <- c("Akira", "Toy Story", "Room", "The Wave", "Whiplash", "Star Wars", "The Ring", "The Artist", "Jumanji")
      
      # Step 2: Use the array() function
        movie_array <- array(movie_vector, dim = c(4,3)) # add dim (dimension) to define the no. of rows and columns
    
    # To access an element in array:
        movie_array[1,2] # name_of_array[row, column]
    
    # To get the dimension of the array, use the dim() function
        dim(movie_array)
        
    # We can also do math in arrays
        length_vector <- c(125, 81, 118, 81, 106, 121, 95, 100, 104)
        length_array <- array(length_vector, dim = c(3,3))
        length_array
        
        # Let's add 5 to the array, to account for a 5-min bathroom break:
        length_array + 5
        
        
    # Using Logical Conditions to Subset Arrays
        
        # Which movies can I finish watching in two hours? Using a logical condition, we can check which movies are less than 2 hours long.
        mask_array <- length_array < 120
        mask_array
        
        
        # Using this array of TRUEs and FALSEs, we can subset the array of movie names:
        x_vector <- c("Akira", "Toy Story", "Room", "The Wave", "Whiplash",
                      "Star Wars", "The Ring", "The Artist", "Jumanji")
        x_array <- array(x_vector, dim = c(3,3))
        
        x_array[mask_array]
        
        
        # find all movie titles with length less than or equal to 90 minutes
        mask_array <- length_array <= 90
        x_array[mask_array]
        
        
        
  
# Matrices - Same with arrays but must be two-dimensional
        
    #To create:
        # Step 1: Create a vector first
          movie_vector <- c("Akira", "Toy Story", "Room", "The Wave", "Whiplash", "Star Wars", "The Ring", "The Artist", "Jumanji")
  
       #Step 2: Use matrix() function with three arguments (vector, nrow, ncol)
          movie_matrix <- matrix(movie_vector, nrow = 3, ncol = 3)
        
        #By default, matrix arranges by column, to arrange in rows use byrow = TRUE as the 4th argument.
          movie_matrix <- matrix(movie_vector, nrow = 3, ncol = 3, byrow = TRUE)
        
    # To Access:
          movie_matrix[2:3, 1:2] # extract elements in rows 2 to 3, and columns 1 to 2
          movie_matrix[1,1]  # To retrieve "Akira", you should use [1,1] as it lies in the first row and first column.

          
# CONCATENATION FUNCTION: is used to combine two vectors into one vector. It combines values of both vectors. 
          
    # Lets create a new vector for the upcoming movies as a upcoming_movie variable and add them to the movie_vector variable to create a new_vector of movies.
        upcoming_movie <- c("Fast and Furious 8", "xXx: Return of Xander Cage", "Suicide Squad")
        new_vector <- c(movie_vector, upcoming_movie)
        new_vector

        
        
#-------------------------------------------------------------------------------
        
#DATA FRAMES: A type of structure that contains correlated information. (ex. movie titles along with their corresponding years.)
    
    # To create:
        movies <- data.frame(name = c("Toy Story", "Akira", "The Breakfast Club", "The Artist", "Modern Times", "Fight Club", "City of God", "The Untouchables"), 
                             year = c(1995, 1998, 1985, 2011, 1936, 1999, 2002, 1987))
        
        movies
        
    # To access: 
        movies$name #(name of data frame + $ + column name)
        movies[1] # use column number to access the column
        movies[1,2] 
    
    # To get information about the data frame structure
        str(movies)
        
    # Head and tails
        head(movies) #will display the first 6 elements of the data frame
        tail(movies) #will display last 6 elements of the data frame
        
    # To insert a new column
        movies['length'] <- c(81, 125, 97, 100, 87, 139, 130, 119)
        
    # To insert a new row
         movies <- rbind(movies, c(name = "Dr. Strangelove", 
                                   year = 1964,
                                   length = 94))
    
    # To delete rows, use negative [-]
         movies <- movies[-9,] 
         
    # To delete column, just assign a NULL value
         movies["length"] <- NULL
         
         
    # Now, let's try to get the row with name "Toy Story"
         
         # Find the rows with name "Toy Story"
         selected <- movies["name"] == "Toy Story"
         # Get the selected row(s) with 'name' and 'year' columns
         toy_story <- movies[selected, c("name", "year")]
         toy_story
        
        
        
        
        
        
        
        
        
        
        
    