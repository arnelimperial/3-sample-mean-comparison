library(shiny)
library(dplyr)
library(shinythemes)
library(ggpubr)
library(car)
  


shinyServer(function(input,output,session){
 
  
  
  
    
    observeEvent( input$run,{
      num1 <- as.numeric(input$num1)
      num2 <- as.numeric(input$num2)
      num3 <- as.numeric(input$num3)
      num4 <- as.numeric(input$num4)
      num5 <- as.numeric(input$num5)
      num6 <- as.numeric(input$num6)
      num7 <- as.numeric(input$num7)
      num8 <- as.numeric(input$num8)
      num9 <- as.numeric(input$num9)
      num10 <- as.numeric(input$num10)
      num11 <- as.numeric(input$num11)
      num12 <- as.numeric(input$num12)
      num13 <- as.numeric(input$num13)
      num14 <- as.numeric(input$num14)
      num15 <- as.numeric(input$num15)
      
      
      
      
      #reactive expression
    
      
      
    
        control = c(num1, num2, num3, num4, num5)
        treatment1 =c(num6, num7, num8, num9, num10)
        treatment2 =c(num11, num12, num13, num14, num15)
        samples = c("Control","Treatment1", "Treatment2")
        response = c(num1, num2, num3, num4, num5,num6, num7, num8, num9, num10,num11, num12, num13, num14, num15)
        group =c("control","control","control","control","control", "treatment1","treatment1","treatment1","treatment1","treatment1", "treatment2", "treatment2","treatment2","treatment2", "treatment2")
        
        df <- data.frame(control, treatment1, treatment2)
        DF <- data.frame(group, response)

        
      

      
      #output$sum <- renderPrint({
        #summary(df)
          #})
        
        output$sum <- renderPrint({
          summary(df)
          })
        
        output$plot <- renderPlot({
          ggboxplot(DF, x = "group", y = "response", color = "#FC4E07", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                    order = c("control", "treatment1", "treatment2"),
                    ylab = "Response Variables", xlab = "Independent Variables")
        })
        
        output$plot1 <- renderPlot({
         hist(treatment2, breaks = 10, col = "#00AFBB", main = "Histogram", xlab="Independent Variable", ylab="Response")
            
            
          
       })
        res.aov <- aov(response ~ group, data = DF)
      
        output$anova <- renderPrint({
          
          # Summary of the analysis
          summary(res.aov)
  
          
        })
        
        output$tukey <- renderPrint({
        
          TukeyHSD(res.aov)
          
        })
        output$levene <- renderPrint({
          
          leveneTest(response ~ group, data = DF)
          
        })
        
        aov_residuals <- residuals(object = res.aov )
        
        
        output$shapiro <- renderPrint({
          
          shapiro.test(x = aov_residuals )
          
          
        })
        
        
      
      
      
      
      
      
      
      
      
      
    })
    
    
    
    
    
    
    
  
  
  
  
  

  
  
  })
  
  

