
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Clustering of Iris dataset"),
    
    fluidRow(
        p("This application is an exercise in taking a classical labeled data-set 
          (the Iris data-set in this case) and applying an unsupervised learning 
          algorithm to it (k-means clustering in this case), in an attempt to 
          check how well the results of k-means clustering correlate with the 
          actual labels of the data-set and with our intuition of how the data 
          should be clustered if the labels weren't available."),
        p("For visualization purposes, the Iris data has been plotted with the 
          petal width on the x-axis and the petal length on the y-axis. The data 
          points have also been plotted using different shapes based on their 
          label, i.e. the species they belong to. The mapping of shape to 
          species is displayed in the plot legend. Using different shapes for 
          different species helps us in understanding which species are allocated 
          to which clusters as we run k-means clustering. Note that the k-means 
          algorithm has itself been configured to use these very same features 
          (petal width and petal length) for clustering the data."),
        p("To actually run k-means clustering on the data, drag the slider which 
          controls the number of cluster centers or click the Re-run button. 
          Clicking the Re-run button runs k-means again on the data-set without 
          changing the current number of cluster centers. Once k-means has run, 
          the data-points are colored differently based on the cluster they have 
          been assigned to. Ideally, you should see as many different colored 
          groups as the number of chosen cluster centers. Note that the actual 
          color chosen for a cluster depends on the vagaries of the k-means 
          algorithm, so you should focus on how the different colors separate 
          the data-points into different groups instead of what the actual colors 
          are. The same group of points may change color from run-to-run even 
          if the number of cluster centers does not change."),
        p("One interesting exercise to conduct is how well the results of k-means 
          correlate with the actual data labels when the number of cluster centers 
          is the same as the number of species. Try setting the number of cluster 
          centers to 3 and check how accurately k-means partitions the 3 different 
          species into separate groups."),
        p("Another interesting exercise to conduct is to run k-means multiple 
          times without changing the number of cluster centers. The results of 
          k-means are heavily dependent on the initial random initialization of 
          the cluster centers, so it is interesting to see how the assignment of 
          data points to groups changes from run-to-run even if the number of 
          cluster centers is not changed. This phenomenon is especially pronounced 
          for the bottom-left group of points when the number of cluster centers 
          is on the higher side.")
    ),
    
    fluidRow(
        sidebarPanel(
            sliderInput("ncenters",
                        "Number of cluster centers:",
                        min = 1,
                        max = 8,
                        value = 3),
            actionButton("goButton", "Re-run")
        ),
        
        mainPanel(
            plotOutput("clusterPlot")
        )
    )
    
))
