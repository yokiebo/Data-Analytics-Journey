# WEEK4:GA - Visualizations in R

# some popular data viz packages in R: ggplot2, Plotly, Lattice, RGL, Dygraphs, Leaflet, Highcharter, Patchwork, gganimate, ggridges


library(ggplot2)
library("palmerpenguins")
diamonds

# CORE CONCEPTS OF GGPLOT2
#1 Aesthetic. A visual property of an object in your plot
#2 Geoms. The geometric object used to represent your data
#3 Facets. Let's you display smaller groups or subsets of your data
#4 Labels and annotations. Let you customize your plot


ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# THREE STEPS OF CREATING A PLOT
#1 Start with the ggplot function and choose a dataset to work with
#2 Add a geom_function to display your data
#3 Map the variables you want to plot in the arguments of the aes() function


# To turn our code into a reusable template, replace the bracketed sections in the code below with the dataset, a geom_function or a group of aesthetic map
ggplot(data = <DATA>) +
  <GEOM_FUNCTION>(mapping=aes(<AESTHETIC MAPPINGS>))


# Another example
ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = bill_depth_mm))


# Changing aesthetic
  
  # changing color for every species
  ggplot(data = penguins) +
    geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) # mapping color into specific variable (species)
  
  # changing shape for every species
  ggplot(data = penguins) +
    geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species))
  
  # adding size for every species
  ggplot(data = penguins) +
    geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species, size = species))
  
  # alpha aesthetic: controls the transparency of the points
  # alpha is a good option when you got a dense plot with lots of data points
  ggplot(data = penguins) +
    geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha = species))
  
  # to change color but not tie or map the color to a specific variable
  # if we want to change the overall appearance of our plot without regard specific variable, we write code outside of the aes() function.
  ggplot(data = penguins) +
    geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha = species), color = "blue")
  
  
# DIFFERENT GEOM FUNCTIONS TO CREATE DIFFERENT TYPES OF PLOTS
  
  #1 geom_point
  ggplot(data = penguins) + 
    geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))
  
  #2 geom_bar: automatically counts how many times x value appears in the data and then shows the count on the y axis
  ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut))
  
        # to outline geom bar with color
          ggplot(data = diamonds) +
            geom_bar(mapping = aes(x = cut, color = cut))
        # to fill with color
          ggplot(data = diamonds) +
            geom_bar(mapping = aes(x = cut, fill = cut))
        # to make stacked bar, map fill with other variable other than cut
          ggplot(data = diamonds) +
            geom_bar(mapping = aes(x = cut, fill = clarity))
  
  
  #3 geom_line
  
  
  #4 geom_smooth: is useful for showing general trends in our data
  ggplot(data = penguins) +
    geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))
  
        # To plot separate line for each species of penguins, add linetype aesthetic to the code
        ggplot(data = penguins) +
          geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype = species))
        
        # Combining two geom_function
        ggplot(data = penguins) +
          geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
          geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "black")
  
        
  #5 geom_jitter: creates a scatter plot and then adds a small amount of random noise to each point in the plot
     # Jittering helps us deal with overplotting which happens when the datapoints in a plot overlap with each other. It makes the points easier to find
  ggplot(data = penguins) +
    geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g))
  
  
  
  
# FACETS: Lets you display smaller groups, or subsets, of your data. Facetting can help ypu discover new patterns in your data and focus on relationships between different variables. 
  
  # 2 FACET FUNCTIONS:
  
    #1 Facet_wrap(): To facet your plot by a SINGLE VARIABLE
      ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
        facet_wrap(~species)
      
      
      ggplot(data = diamonds) +
        geom_bar(mapping = aes(x = color, fill = cut)) +
        facet_wrap(~cut)

      
    #2 Facet_grid(): To facet your plot with TWO VARIABLES
      ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
        facet_grid(sex~species) # facets vertically by the values of the first variable and horizontally by the values of second variable
      
  
      
  
# LABELS AND ANNOTATION
  
  # Annotation. To add notes to a document or diagram to explain or comment upon it. In ggplot2, it can help explain the plot's purpose or highlight important data.
    
  #LABELS: Titles, subtitles and captions are labels that we put OUTSIDE OF THE GRID of our plot to indicate important information
      
      #to add title
      ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
        labs(title = "Palmer Penguins: Body Mass vs. Flipper Length")
      
      # to add subtitle
      ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
        labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguin Species")
      
      # to add caption
      ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
        labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman" )
      
  
  
    #ANNOTATE: To put texts inside the grid to call out specific data points, we can use the annotate() function 
      ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
        labs(title = "Palmer Penguins: Body Mass vs. FLipper Length", subtitle = "Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman") +
        annotate("text", x = 220, y = 3500, label = "The Gentoos are the largest")
      
      # To customize annotations
      ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
        labs(title = "Palmer Penguins: Body Mass vs. FLipper Length", subtitle = "Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman") +
        annotate("text", x = 220, y = 3500, label = "The Gentoos are the largest", color = "blue", fontface = "bold", size = 3, angle = 15)
      

  # PRO-TIP: if you want to use less code, you can store your plot code in a variable and just add an annotation to it
      p <-  ggplot(data = penguins) +
        geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
        labs(title = "Palmer Penguins: Body Mass vs. FLipper Length", subtitle = "Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman")
  
      p+ annotate("text", x = 220, y = 3500, label = "The Gentoos are the largest", color = "blue", fontface = "bold", size = 3, angle = 15)
      
      
      
      
# SAVING YOUR PLOT
    # Approach 1: Export option in the plots tab
      
    # Approach 2: ggsave() function
      ggsave("Three Penguin Species.png")

