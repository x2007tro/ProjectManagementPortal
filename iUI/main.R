##
# Source all ui files
##
# ui_files <- c("wc_wscc_bval", "wc_wscc_rset", "wc_wscc_opeb",
#               "otr_pnb_ltd", "otr_pnbdh_dp",
#               "conf")
# lapply(ui_files, function(f){
#   source(paste0("./iUI/", f, ".R"), local = FALSE)
# })

##
# Shiny ui
##
mainUI <- fluidPage(theme = shinythemes::shinytheme("simplex"),
  
  # css style
  tags$head(
    includeCSS("pmp_style.css")
  ),
  
  # main output
  uiOutput("main_output")

)
