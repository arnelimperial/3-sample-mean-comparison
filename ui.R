
library(shiny)
library(dplyr)
library(shinythemes)
library(ggpubr)
library(car)

shinyUI(fluidPage(
  theme = shinytheme("superhero"),
  titlePanel(title = "Difference of Three Samples"),
  
  fluidRow(
    column(2,
           textInput("num1", 'Control', NULL, width = '50%'),
           textInput("num2", 'Control', NULL, width = '50%'),
           textInput("num3", 'Control', NULL, width = '50%'),
           textInput("num4", 'Control', NULL, width = '50%'),
           textInput("num5", 'Control', NULL, width = '50%')),
      
      
    column(2,
           textInput("num6", 'Treatment 1', NULL, width = '50%'),
           textInput("num7", 'Treatment 1', NULL, width = '50%'),
           textInput("num8", 'Treatment 1', NULL, width = '50%'),
           textInput("num9", 'Treatment 1', NULL, width = '50%'),
           textInput("num10", 'Treatment 1', NULL, width = '50%')),
          
    
    column(2,
           textInput("num11", 'Treatment 2', NULL, width = '50%'),
           textInput("num12", 'Treatment 2', NULL, width = '50%'),
           textInput("num13", 'Treatment 2', NULL, width = '50%'),
           textInput("num14", 'Treatment 2', NULL, width = '50%'),
           textInput("num15", 'Treatment 2', NULL, width = '50%'),
          actionButton("run", "RUN T-Test")),
    
    column(5,
           verbatimTextOutput("sum")),
    
    column(6,
           verbatimTextOutput("anova")),
    
    column(6,
           verbatimTextOutput("tukey")),
    column(6,
           verbatimTextOutput("levene")),
    
    column(6,
           verbatimTextOutput("shapiro")),
           
      

    # Show a plot of the generated distribution
    column(9,
           plotOutput("plot"),
           plotOutput("plot1"))
           
    
  
           
           
           
      
      
    
  
           
  
     # textOutput("summary1"))
      
      
      
      
      
      
  
  )
    
  


  
  
  
))
