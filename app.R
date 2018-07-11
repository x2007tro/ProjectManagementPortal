##
# Packages
##
library(readxl)
library(shinythemes)
library(DT)
library(lubridate)

##
# Source server and ui components
##
source("global.R", local = FALSE)
source("iUI/main.R")
source("iServer/main.R")
source("helper/inst_parser.R")

##
# Launch shiny app
##
shinyApp(
  ui = mainUI,
  server = mainServer
)