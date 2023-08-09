# IBM: R for Data Analysis (3)


# READING CSV FILES FILES

  # Reading CSV files
  read.csv("/file_path/movies-db.csv")

  # Reading Excel files
  install.packages("readxl") # install the package first
  library(readxl)
  read_excel("/file_path/movies-db.xls")
  
  # Accessing data from a dataset
  # In order to make use of the data that we're reading, we need to assign the output to a VARIABLE:
  my_data <- read.csv("/file_path/movies-db.csv")
  my_data
  
  # By default, R will structure the data as a data frame, which provides us with a lot of tools and flexibility
  
  my_data['name'] # this will access the column named 'name' in the data frame
  my_data[1, ] # to access the first row
  my_data[ ,3] # to access the 3rd column
  
  my_data[1, c("name", "length_min")] # to access specific columns (name & length_min only) from row 1
  
  
  # Accessing built-in datasets
  data()
  
  help(CO2) # to see documentation for each of the dataset
  
  CO2 # to view built-in dataset, no need of "" or view() or importing since R has already prepared the dataset.
  
#-------------------------------------------------------------------------------
  
# READING TEXT FILES
  
  # Reading text files using readLines()
  text <- readLines("/file_path/toy_story.txt")
  
  length(text) # to count up the elements in the vector
  
  nchar(text) # will count up the number of characters in each line of our character vector
  
  file.size("/file_path/toy_story.txt") # to know the size of your file. (listed in bytes)
  
  # Reading text files using scan(). This will read the text file by word rather than by line.
  text <- scan("/resources/toy_story.txt", "") # the second argument is just an empty string but it is needed for our purposes.
  

#-------------------------------------------------------------------------------
  
# WRITING AND SAVING TO FILES
  
  #To Export as a text file, use write() function
  m <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
  m
  
  write(m, file = "matrix_as_text.txt", ncolumns = 3, sep= " ")
  
  # To export as a CSV file, write.csv() function
  write.csv(df, file = "/file_path/dataset.csv", row.names = FALSE)
      # first argument: data frame you like to write to a file
      # 2nd argument: path for the file you like to output
      # 3rd argument: can be used to specify whether or not the file would display the name for each row.
  
  # To omit the column name, you can use the write.table() function
  write.table(df, file = "/file_path/dataset.csv", row.names = FALSE, col.names = FALSE, sep = ",")
  
  # To export as an excel file, install the xlsx package first
  install.packages(xlsx)
  library(xlsx)
  
  write.xlsx(df, file = "file_path/dataset.xlsx", sheetName = "Sheet1", col.names = TRUE, row.names = FALSE)
  
  
  # To save R Objects in .RData files
  save(list = c("var1", "var2", "var3"), file = "vars.RData", safe = TRUE)
      # first argument: the list arguments takes in a vector where each element is a variable name of the object you want to save
      # 2nd argument: the file arguments specifies the file to write to
      # 3rd argument: The safe argument specifies whether or not you want to the save to be performed atomically. If this is false, there’s a chance that the existing file could be damaged if the save fails.
  
    
  
#-------------------------------------------------------------------------------

# HTTP Request and REST API
  
 # Hypertext Transfer Protocol (HHTP): A communication protocol for fetching web resources for clients from servers on the internet
    # Resources can include:
      #1 Web page
      #2 Media files (images, videos)
      #3 Other files, like csv file containing a dataset
  
  # Essential components of HTTP:
    #1 HTTP request
    #2 HTTP response
        # HTTP request and HTTP response are comprised of human readable texts called hypertext
  
# Representational State Transfer (REST) API: A set of rules/constraints for designing distributed applications. Is the most popular web API design standard so most web APIs that you see today follow REST rule
  # REST has the following features:
    #1 Resource-centric
    #2 Stateless, no connection context information
    #3 most uses JSON or XML for data exchanging
    #4 Enables transportation using HTTP or other protocols
  
  # To work with HTTP request or REST API in R, use a popular R package called httr
    # httr includes functions for the most common HTTP methods:
      # GET
      # POST
      # DELETE 
      # PUT
  
  # To make a basic GET request using httr
  response <- GET("https://www.ibm.com/")
  
  # To make a POST request using httr
  body <- list(course_name = 'Introduction to R', instructor = 'Yan')
  response <- POST('http://httpbin.org/post', body = body)
  response
  
  
  
# ------------------------------------------------------------------------------
  
# WEB SCRAPING IN R
  
  # rvest: Easy web scraping with R
    # A popular web scraping package for R
    # Given an HTML node, you can find its child nodes using the tag names
  
# Read HTML from a character variable
simple_html <- "<html>
        <body>
          <p> This is a html page </p>
        </body>
      </html>"
  
root_node <- read_html(simple_html)
root_node


# Read HTML from a URL
root_node <- read_html('https://www.ibm.com/us-en')
root_node


# Download an HTML file (and scrape them in offline mode)
download.file('http://www.ibm.com', destfile = 'ibm.html')
root_node <- read_html('ibm.html')


# Extract node content

# Example: Find the <p> node following the node path:
# <html> -> <body> -> <p>
root_node <- read_html("<html>
                          <body>
                            <p> This is an html page </p>
                          </body>
                       </html>")
body_node <- html_node(root_node, "body")
p_node <- html_node(body_node, "p")
p_content <- html_text(p_node)
p_content


# Extract a data from a table from HTML page
root_node <- read_html("color.html")
table_node <- html_node(root_node, "table")
color_data_frame <- html_table(table_node)
color_data_frame

