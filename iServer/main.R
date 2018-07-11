#
# Shiny server
#
mainServer <- function(input, output, session) {

  ##
  # Data initialization
  ##
  source("./iServer/data_init.R", local = TRUE)
  
  ##
  # Time entry main
  ##
  source("./iServer/time_entry_main.R", local = TRUE)
  
  ##
  # Time entry daily conf
  ##
  source("./iServer/time_entry_dlyconf.R", local = TRUE)
  
  ##
  # Time entry weekly conf
  ##
  source("./iServer/time_entry_wlyconf.R", local = TRUE)
  
  ##
  # Configuration 
  ##
  source("./iServer/conf.R", local = TRUE)
}
