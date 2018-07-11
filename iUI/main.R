##
# Source all ui files
##
ui_files <- c("wc_wscc_aval", "wc_wscc_rset", "wc_wscc_opeb",
              "otr_pnb_ltd", "otr_pnbdh_dp",
              "conf")
lapply(ui_files, function(f){
  source(paste0("./iUI/", f, ".R"), local = FALSE)
})

##
# Shiny ui
##
mainUI <- fluidPage(theme = shinythemes::shinytheme("simplex"),
  
  # css style
  tags$head(
    includeCSS("pmp_style.css")
  ),
  
  navbarPage(
    "Project Management Portal",
    ##
    # Workers comp tab
    ##
    tabPanel(
      "Workers Compensation",
      navlistPanel(
        ##
        # WSCC related
        "WSCC",
        widths = c(2, 10),
        tp_wc_wscc_aval,
        tp_wc_wscc_rset,
        tp_wc_wscc_opeb,
        
        ##
        # Yukon related
        "Yukon"
      )
    ),
    
    ##
    # Pension
    ##
    # tabPanel(
    #   "Pension",
    # ),
    
    ##
    # Investment
    ##
    # tabPanel(
    #   "Investment"
    # ),
    
    ##
    # Other
    ##
    tabPanel(
      "Other",
      navlistPanel(
        "Project",
        widths = c(2, 10),
        tp_otr_pnb_ltd,
        tp_otr_pnbdh_dp
      )
    ),
    
    ##
    # Configuration
    ##
    tabPanel(
      "Configuration",
      tp_configuration
    )
  )
  # End of navbarpage
)
