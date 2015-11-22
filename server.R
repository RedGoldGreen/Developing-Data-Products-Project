library(shiny)
library(ggplot2)

shinyServer(
    
    function(input, output) {
        
         output$freqPlot <- renderPlot({

         if (input$var == "Exponential")
             {
             output$text1 <- renderText({ 
                 paste("You have selected the Exponential distribution w/rate/mean=1 and n=",input$n)
             })   
                 x <- rexp(input$n)
             } 
         else if (input$var == "Normal")
             {
             output$text1 <- renderText({
                 paste("You have selected the Normal distribution w/mean=0 and n=",input$n)
             })    
                 x <- rnorm(input$n)
            }
                           
         else if (input$var == "Uniform")
            {
             output$text1 <- renderText({ 
                 paste("You have selected the Uniform distribution w/min=0/max=1/mean=.5 and n=",input$n)              
             })     
                 x <- runif(input$n)
            }

         print(ggplot(data.frame(x), aes(x)) +
             geom_histogram(aes(y = ..density..),
                            binwidth=.25,
                            colour="black", fill="white") +
             xlab(paste("(mean=", as.character(round(mean(x),3)), ")")) +
             # Overlay density curve
             geom_density(alpha=.2, fill="#FF6666") +
             # Drop mean line
             geom_vline(aes(xintercept=mean(x)),
                        color="black", linetype="solid", size=.8)
     )

        })

  }
)