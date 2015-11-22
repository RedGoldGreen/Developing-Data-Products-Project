shinyUI(pageWithSidebar(
  headerPanel (h3("Exploring R's Probability Distributions", align="center"),
br()),

  sidebarPanel(
      br(),
      selectInput("var", 
                  label = "Choose your favorite distribution to plot",
                  choices = c("Exponential", "Normal",
                              "Uniform"),
                 selected = "Normal"),
      br(),
       selectInput("n", 
                    label = "How many numbers do you want to draw?",
                      choices = c("50",
                                  "1000", "10000"),
                      selected = "1000")          
          
  ),
  mainPanel(
      tabsetPanel(
          tabPanel("Plot", plotOutput("freqPlot"),
              textOutput("text1")),
          tabPanel("Help", 
              br(),
              h3("Application Help"),
              br(),
              h4("Purpose"),
              p("This app lets you explore several R probability distributions by
                choosing a distribution and sample size and viewing the resulting 
                histogram (overlaid w/a density plot w/a calculated actual mean)."),
              h4("Instructions"),
              p("The app has two select widgets - one to choose a distribution and one
                to choose the number of random numbers to sample for the plot. The 
                defaults (and the first plot you will see entering the app) is a 
                Normal distribution w/a draw of 1000 numbers. Change the value
                of either of the widgets and a new draw of numbers will occur and
                a new plot will be generated."),
              h4("Other"),
              p("The app takes the default mean for the random number funtion rnorm call (0),
                the default rate for the rexp call (1; mean of 1 also) and the default min/max (0/1; mean of .5) for 
                the runif call.")
              
              ) 
 ))
))
