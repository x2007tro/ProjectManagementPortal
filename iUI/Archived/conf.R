##
# Data upload tabPanel
##
tp_configuration <- tabPanel(
  "Configuration",
  
  navlistPanel(
    "Line of Business",
    widths = c(2, 10),
    
    ##
    # Workers comp
    tabPanel(
      "Workers Comp",
      
      ##
      # Client
      tabsetPanel(
        
        ##
        # WSCC
        tabPanel(
          "WSCC",
          
          ##
          # Rate setting section
          fluidRow(
            column(
              width = 12,
              
              tags$div(
                class = "block_outter_frame",
                tags$h3(
                  class = "block_title",
                  "Rate Setting"
                ),
                tags$div(
                  class = "block_inner_frame",
                  
                  ##
                  # Real content starts here
                  tags$div(class = "gloconf_div", textInput("gloconf_tmp1", "WSCC RSet Instruction", value = wc_wscc_rs_ipt_fp, width = entry_wid_l)),
                  tags$div(class = "gloconf_div", textInput("gloconf_tmp2", "WSCC Rset Output", value = wc_wscc_rs_opt_loc, width = entry_wid_l)),
                  tags$div(class = "gloconf_div", textInput("gloconf_tmp3", "WSCC Ben Val Instruction", value = wc_wscc_bval_ipt_fp, width = entry_wid_l)),
                  tags$div(class = "gloconf_div", textInput("gloconf_tmp4", "WSCC Ben Val Output", value = wc_wscc_bval_opt_loc, width = entry_wid_l))
                )
              )
            )
          )
          
          
        ),
        
        ##
        # Yukon
        tabPanel(
          "Yukon"
        )
      )
    ),
    
    tabPanel(
      "Other",
      
      ##
      # Project/Client
      tabsetPanel(
        
        tabPanel(
          "PNB LTD"
        ),
        
        ##
        #
        tabPanel(
          "PNB DoH Drug Plan"
        )
        
      )
      
    )
  )
)
