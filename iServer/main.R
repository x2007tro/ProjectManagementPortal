#
# Shiny server
#
mainServer <- function(input, output, session) {

  ##
  # Data initialization
  ##
  source("./iServer/data_init.R", local = TRUE)
  
  ##
  # WC WSCC RSet
  source("./iServer/wc_wscc_rset.R", local = TRUE)
  
  ##
  # WC WSCC RSet
  source("./iServer/wc_wscc_bval.R", local = TRUE)
  
}
