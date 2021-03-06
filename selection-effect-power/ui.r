library(shiny)
library(shinyBS)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Selection-Effect Power Calculator"),

  # Need to add tooltips for descriptions of inputs.

  # Pass syntax: 1 to by 0.4
   
  # Sidebar with a slider input for number of bins 
  sidebarPanel(
    sliderInput("num_strata", "Number of Strata:", min=1, max=10, value=2),
    textInput("sample_size", "Sample Size (may be a range):", 
      value="200 to 400 by 50"),
    textInput("phi", "Preference Rate:", value="0.5, 0.5"),
    textInput("sigma2", "Within-Stratum Variances:", value="1, 1"),
    numericInput("delta_pi", "Preference Effect:", 
      value=0.5, step=0.01),
    textInput("delta_nu", "Selection Effect (may be a range):", 
      value="0.1 to 1 by 0.1"),
    sliderInput("alpha", "Type-1 Error Rate:", min=0.01, max=0.5, value=0.05),
    sliderInput("theta", "Choice-Arm Proportion:", min=0, max=1, value=0.5),
    textInput("xi", "Proportion of Patients in Each Stratum:",value="0.5, 0.5"),
    bsTooltip("num_strata", "If this is 1, then the design is unstratified.",
      "top", options(container="list")),
    bsTooltip("phi", "The proportion of patients preferring treatment 1 within each stratum. There should be one proportion per stratum.", 
      "top", options(container="list")),
    bsTooltip("sigma2", "The within-stratum variances. There should be one variance value per stratum.", 
      "top", options(container="list")),
    bsTooltip("delta_pi", "The overall study preference effect.", 
      "top", options(container="list")),
    bsTooltip("delta_nu", "The overall study selection effect.", 
      "top", options(container="list")),
    bsTooltip("xi", "The proportion of patients in each stratum. There should be one proportion-value per stratum.", 
      "top", options(container="list")),
    downloadButton('downloadData', 'Download')
    # It would be nice to get rid of tooltips when the user doesn't want
    # them.
    #checkboxInput("tooltip_checkbox", label="Include help tooltips", 
    #              value=FALSE),
  ),
      
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("line_graph"),
    dataTableOutput("sample_size")
  )

))

