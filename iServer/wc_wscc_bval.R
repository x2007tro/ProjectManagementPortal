##
# Handle wscc bval functions
##

##
# Task section
##
output$wc_wscc_bval_task <- renderUI({
  
  ##
  # data
  tasks <- tasks()$wc$wscc$ben_val
  
  lapply(1:length(tasks), function(i){
    
    ##
    # Process data, create year and month data
    step_i <- tasks[[i]]$step
    task_i <- tasks[[i]]$task
    action_i <- tasks[[i]]$action
    
    task_i_tmp <- gsub("yyyy-2", as.numeric(input$wc_wscc_bval_vy)-2, task_i)
    task_i_tmp <- gsub("yyyy-1", as.numeric(input$wc_wscc_bval_vy)-1, task_i_tmp)
    task_i_tmp <- gsub("yyyy+1", as.numeric(input$wc_wscc_bval_vy)+1, task_i_tmp)
    task_i_tmp <- gsub("yyyy+2", as.numeric(input$wc_wscc_bval_vy)+2, task_i_tmp)
    task_i <- gsub("yyyy", as.numeric(input$wc_wscc_bval_vy), task_i_tmp)
    
    fluidRow(
      column(
        width = 12,
        
        tags$div(
          style = "border-bottom:1px solid gray;",
          
          ##
          # Main task section
          fluidRow(
            column(
              width = 12,
              
              tags$div(
                
                ##
                # meat here
                if(step_i == "#") {
                  tagList(
                    tags$h4(class = "task_cat_div", tasks[[i]]$task) 
                  )
                } else {
                  tagList(
                    tags$div(class = "task_div", textInput(paste0("wc_wscc_bval_stp",i), label = "Step", value = step_i, width = entry_wid_s)),
                    tags$div(class = "task_div", textInput(paste0("wc_wscc_bval_tsk",i), label = "Task", value = task_i, width = entry_wid_xl)),
                    tags$div(class = "task_div", textInput(paste0("wc_wscc_bval_act",i), label = "Action", value = action_i, width = entry_wid_m)),
                    tags$div(class = "task_div", textInput(paste0("wc_wscc_bval_sta",i), label = "Status", value = "", width = entry_wid_m)),
                    tags$div(class = "task_div", id = "instr_div", tags$a(id = "instr_a", href=paste0("#wc_wscc_bval_comt",i), "Instructions")),
                    tags$div(class = "task_div", actionButton(class = "btn-primary", paste0("wc_wscc_bval_con_note_save",i), label = "Save", width = entry_wid_s)),
                    tags$div(class = "task_div", textOutput(paste0("wc_wscc_bval_task_msg", i)))
                  )
                }
              )
            )
          ),
          
          ##
          # Analyst comment section
          fluidRow(
            column(
              width = 12,
              
              tags$div(
                
                ##
                # meat here
                if(tasks[[i]]$step != "#"){
                  tagList(
                    tags$div(class = "task_div", textInput(paste0("wc_wscc_bval_ana_note",i), label = "Analyst Comment", value = "", width = entry_wid_xl))
                  )
                }
                
              )
            )
          ),
          
          
          ##
          # Consultant comment section
          fluidRow(
            column(
              width = 12,
              
              tags$div(
                
                ##
                # meat here
                if(tasks[[i]]$step != "#"){
                  tagList(
                    tags$div(class = "task_div", textInput(paste0("wc_wscc_bval_con_note",i), label = "Consultant Comment", value = "", width = entry_wid_xl))
                  )
                }
                
              )
            )
          )
          
          
        )
      )
    )
    
  })
})

##
# Retrieve current status
##
observeEvent(input$wc_wscc_bval_ret, {
  ##
  # Update values if progress found
  outfp <- paste0(input$gloconf_tmp4, rs_prg_fn, input$wc_wscc_bval_vy, ".csv")
  if(file.exists(outfp)){
    # Update fields
    dataset <- read.csv(outfp, header = TRUE, stringsAsFactors = FALSE)
    lapply(1:nrow(dataset), function(i){
      local({
        updateTextInput(session = session, inputId = paste0("wc_wscc_bval_sta",i), value = dataset[i, "Status"])
        updateTextInput(session = session, inputId = paste0("wc_wscc_bval_ana_note",i), value = dataset[i, "AnalystComment"])
        updateTextInput(session = session, inputId = paste0("wc_wscc_bval_con_note",i), value = dataset[i, "ConsultantComment"])
      })
    })
  }
})


##
# Instruction section
##
output$wc_wscc_bval_inst <- renderUI({
  
  ##
  # data
  tasks <- tasks()$wc$wscc$ben_val
  
  lapply(1:length(tasks), function(i){
    
    ##
    # Process data, create year and month data
    step_i <- tasks[[i]]$step
    comt_i <- tasks[[i]]$comt
    fcomt_i <- tasks[[i]]$fcomt
    
    ##
    # Main task section
    fluidRow(
      column(
        width = 12,
        
        tags$div(
          style = "border-bottom:1px solid gray;",
          
          ##
          # meat here
          if(tasks[[i]]$step == "#") {
            
            tags$h4(class = "task_cat_div", tasks[[i]]$task)
          
          } else {
            
            tagList(
              tags$div(class = "task_div", textInput(paste0("wc_wscc_bval_inst_stp",i), label = "Step", value = step_i, width = entry_wid_s)),
              tags$div(
                class = "inst_div",
                id = paste0("wc_wscc_bval_comt", i),
                lapply(1:length(comt_i), function(j){
                  if(comt_i[j] == "") tags$p("None") else tags$p(comt_i[j])
                })
              ),
              tags$div(
                class = "inst_div",
                id = paste0("wc_wscc_bval_fcomt", i),
                lapply(1:length(fcomt_i), function(j){
                  if(comt_i[j] == "") tags$p("None") else tags$p(fcomt_i[j])
                })
              )
            )
            
          }
        )
      )
    )
    
  })
  
})

##
# Handle save progress
##
observe({
  
  tasks <- tasks()$wc$wscc$ben_val
  n <- length(tasks)
  lapply(1:n, function(i){
    
    ##
    # Listen to save commend
    observeEvent({
      input[[paste0("wc_wscc_bval_con_note_save", i)]]
    },{
      
      ##
      # Initialize data.frame
      res_df <- data.frame(
        Step = as.character(),
        Task = as.character(),
        Action = as.character(),
        Status = as.character(),
        AnalystComment = as.character(),
        ConsultantComment = as.character(),
        stringsAsFactors = FALSE
      )
      
      ##
      # Write to df
      for(j in 1:n){
        if(tasks[[j]]$step != "#"){
          res_df[j, "Step"] <- input[[paste0("wc_wscc_bval_stp",j)]]
          res_df[j, "Task"] <- input[[paste0("wc_wscc_bval_tsk",j)]]
          res_df[j, "Action"] <- input[[paste0("wc_wscc_bval_act",j)]]
          res_df[j, "Status"] <- input[[paste0("wc_wscc_bval_sta",j)]]
          res_df[j, "AnalystComment"] <- input[[paste0("wc_wscc_bval_ana_note",j)]]
          res_df[j, "ConsultantComment"] <- input[[paste0("wc_wscc_bval_con_note",j)]]
        } else {
          res_df[j, "Step"] <- "#"
        }
      }
      
      ##
      # Remove unwanted df
      res_df <- res_df[!is.na(res_df$Step),]
      
      ##
      # save to CSV file
      outfp <- paste0(input$gloconf_tmp2, rs_prg_fn, input$wc_wscc_bval_rsy, ".csv")
      if(file.exists(outfp)) file.remove(outfp)
      write.csv(res_df, file = outfp, row.names = FALSE)
      
      ##
      # output message
      if(file.exists(outfp)) msg <- "File saved!" else msg <- "File not saved!"
      output[[paste0("wc_wscc_bval_task_msg", i)]] <- renderText({ msg })
    })
    
  })
  
})