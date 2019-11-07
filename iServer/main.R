#
# Shiny server
#
mainServer <- function(input, output, session) {

  ##
  # Data initialization
  ##
  source("./iServer/data_init.R", local = TRUE)
  
  ##
  # Update input
  ##
  source("./iServer/select_proj.R", local = TRUE)
  
  ##
  # Update input
  ##
  source("./iServer/display_proj.R", local = TRUE)
  
}
