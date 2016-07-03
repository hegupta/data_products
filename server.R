
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

features <- c('Petal.Width', 'Petal.Length')

pcho <- 22

ul <- unique(iris$Species)

df <- data.frame(label = ul, pch = pcho + as.integer(ul))

ipch <- sapply(iris$Species, function (x) df[df$label == x, 'pch'])

doPlot <- function(x) {
    km <- kmeans(iris[, features], x, nstart = 1)
    plot(iris[, features[1]], iris[, features[2]], pch = ipch,
         col=km$cluster, bg = km$cluster,
         main = "Iris data clustering",
         xlab = "Petal width",
         ylab = "Petal length")
    legend("topleft", pch = df$pch, legend=df$label, title = "Species")
}

shinyServer(
    function(input, output) {
        
        output$clusterPlot <- renderPlot({
            input$goButton
            doPlot(input$ncenters)
        })
    }
)
