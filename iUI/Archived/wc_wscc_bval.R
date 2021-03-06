##
# WC benefit valuation panel
##
tp_wc_wscc_bval <- tabPanel(
  "Benefits Valuation",
  
  ##
  # Two tab panels
  ##
  tabsetPanel(
    ##
    # tab 1 - Progress
    tabPanel(
      "Work Progress",
      
      ##
      # Section conf
      fluidRow(
        column(
          width = 12,
          
          tags$div(
            class = "block_outter_frame",
            tags$h3(
              class = "block_title",
              "Configuration"
            ),
            tags$div(
              class = "block_inner_frame",
              
              tags$div(class = "proj_conf_div", 
                       textInput("wc_wscc_bval_vy", "Valuation Year", value = lubridate::year(Sys.Date())-1, width = entry_wid_m)),
              tags$div(class = "proj_conf_div", actionButton(class = "btn-primary", "wc_wscc_bval_ret","Retrieve Current Status"))
            )
          )
        )
      ),
      
      ##
      # Section task
      fluidRow(
        column(
          width = 12,
          
          tags$div(
            class = "block_outter_frame",
            tags$h3(
              class = "block_title",
              "Tasks"
            ),
            tags$div(
              class = "block_inner_frame",
              
              ##
              # task output
              uiOutput("wc_wscc_bval_task")
            )
          )
        )
      ),
      
      ##
      # Instruction section
      fluidRow(
        column(
          width = 12,
          
          tags$div(
            class = "block_outter_frame",
            tags$h3(
              class = "block_title",
              "Instructions"
            ),
            tags$div(
              class = "block_inner_frame",
              
              ##
              # task output
              uiOutput("wc_wscc_bval_inst")
            )
          )
        )
      )
    ),
    
    ##
    # tab 2 - Document
    tabPanel(
      "Document"
    )
  )
  
)