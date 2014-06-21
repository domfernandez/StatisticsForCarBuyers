library(shiny)
shinyUI(navbarPage("Statistics for Car Buyers",
                   
                   tabPanel("Generate Plot",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("variable", "X Axis:", selected = "Weight (lb/1000)",
                                            list("MPG" = "mpg",
                                                 "Number of cylinders" = "cyl",
                                                 "Displacement (cu.in.)"  = "disp",
                                                 "Gross horsepower" = "hp",
                                                 "Rear axle ratio"  = "drat",
                                                 "Weight (lb/1000)"  = "wt",
                                                 "1/4 mile time"  = "qsec",
                                                 "V/S"  = "vs",
                                                 "Number of forward gears"  = "gear",
                                                 "Number of carburetors"  = "carb")),
                                
                                selectInput("variable2", "Y Axis:",
                                            list("MPG" = "mpg",
                                                 "Number of cylinders" = "cyl",
                                                 "Displacement (cu.in.)"  = "disp",
                                                 "Gross horsepower" = "hp",
                                                 "Rear axle ratio"  = "drat",
                                                 "Weight (lb/1000)"  = "wt",
                                                 "1/4 mile time"  = "qsec",
                                                 "V/S"  = "vs",
                                                 "Number of forward gears"  = "gear",
                                                 "Number of carburetors"  = "carb"))
                              ),
                              
                              mainPanel(
                                h3(textOutput("caption")),
                                plotOutput("plot")
                              )
                            )
                   ),    
                   
                   tabPanel("Fit Model",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("dependent", "Dependent Variable:", c("mpg","cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")),
                                uiOutput("independent")
                              ),
                              
                              mainPanel(tableOutput("regTab")
                              )
                            )  
                            
                   )  
))