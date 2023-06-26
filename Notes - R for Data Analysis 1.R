# R for Data Analysis: Notes


# FUNDAMENTALS OF PROGRAMMING USING R IN RSTUDIO


# The basic functions of R.
# 1 Functions. A body of reusable code used to perform specific tasks in R
    # Argument. Information that a function in R needs in order to run.
      print("Coding in R")
      ?print() #this is used to find out more about a specific syntax: ?function()
      
# 2 Comments. Helpful when you want to explain or describe what's going on in your code. 
      
# 3 Variables. A representation of a value in R that can be stored for use later during programming. Can also be called 'objects'
      # A variable name should start with a letter and can also contain numbers and underscores. 
        #Here's an example of a variable
        first_variable <- "This is my variable"
        second_variable <-  12.5
        
# 4 Data types
        
# 5 Vectors. A group of data elements of the same type stored in a sequence in R.  
      #Here's an example of a vector
        vec_1 <- c(13, 48.5, 71, 101.5, 2)
         
# 6 Pipes. A tool in R for expressing a sequence of multiple operations, represented with "%>%". It is used to apply the output of one function into another function.
        # makes your code easier to read and understand.
      
        
        
# OPERATOR    
# Operator: A symbol that names the type of operation or calculation to be performed in a formula. 
        
      #1 Assignment operators. Used to assign values to variables and vectors
          #Example:
          sales_1 <- c(67.00, 75.50, 90.00, 54.75) 
          
      #2 Arithmetic operators. Used to complete math operations. (+) (-) (*) (/)
          #example
          quarter_1_sales <- 35657.98
          quarter_2_sales <- 43810.55
          midyear_sales <- quarter_1_sales + quarter_2_sales
          yearend_sales <- midyear_sales * 2
          
# WORKING WITH PIPES
      # Pipes take the output of one statement and makes it the input of the next statement. 
      # Like nested query
          
            #example: 1st approach (typing out function contained inside other function)
            data("ToothGrowth") #to load the data
            View(ToothGrowth) # to view the data (capital V, case sensitive)
            
            # then load dyplr package
            filtered_tg <- filter(ToothGrowth, dose == 0.5) #filters the result to only show dose = 0.5
            View(filtered_tg) # to view the filtered data
            
            arrange(filtered_tg, len) # sort the data by len (length of tooth)
            
            
            #example: 2nd approach (Nested function)
            
            arrange(filter(ToothGrowth, dose == 0.5), len)
            
            
            #example: 3rd approach (Pipe) (cmd+shift+m)
            
            filtered_toothgrowth <- ToothGrowth %>% 
              filter(dose == 0.5) %>% 
              arrange(len)
            
            #let's add another line of code to group the results by supplement and get the avg (mean length)
           
            filtered_toothgrowth <- ToothGrowth %>% 
              filter(dose == 0.5) %>% 
              group_by(supp) %>% 
              summarize(mean_len = mean(len, na.rm = T), .group = 'drop')
            
            
 