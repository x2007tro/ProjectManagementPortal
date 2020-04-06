##
# Display project
output$task_output <- renderUI({
  
  tasks <- projects[[input$lob]][[input$client]][[input$project]]
  
  tabsetPanel(
    tabPanel(
        "What to do now",
        
        ##
        # Client Code
        fluidRow(
          column(
            width = 12,
            tags$h3(
              class = "client_block_title",
              paste0(input$lob, " - ", input$client, " - ", input$project)
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
                lapply(1:length(tasks), function(k){
                  
                  ##
                  # Process data, create year and month data
                  step_k <- tasks[[k]]$step
                  task_k <- tasks[[k]]$task
                  action_k <- tasks[[k]]$action
                  comt_k <- tasks[[k]]$comt
                  fcomt_k <- tasks[[k]]$fcomt

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
                              if(step_k == "#") {
                                tagList(
                                  tags$h4(class = "task_cat_div", tasks[[k]]$task) 
                                )
                              } else {
                                tagList(
                                  tags$div(class = "task_div", textInput(paste0("stp",k), label = "Step", value = step_k, width = entry_wid_s)),
                                  tags$div(class = "task_div", textInput(paste0("tsk",k), label = "Task", value = task_k, width = entry_wid_xl)),
                                  tags$div(class = "task_div", textInput(paste0("act",k), label = "Action", value = action_k, width = entry_wid_m)),
                                  tags$div(
                                    class = "inst_div",
                                    id = paste0("comt", k),
                                    lapply(1:length(comt_k), function(j){
                                      if(comt_k[j] == "") tags$p("None") else tags$p(comt_k[j])
                                    })
                                  ),
                                  tags$div(
                                    class = "inst_div",
                                    id = paste0("fcomt", k),
                                    lapply(1:length(fcomt_k), function(j){
                                      if(comt_k[j] == "") tags$p("None") else tags$p(fcomt_k[j])
                                    })
                                  )
                                  # add more tag here
                                )
                              }
                            )
                          )
                        )
                        
                      )
                    )
                  )
                  
                })
                
              )
            )
          )
        )
    ),
    
    tabPanel(
      "What to do later",
      
      ##
      # Client Code
      fluidRow(
        column(
          width = 12,
          tags$h3(
            class = "client_block_title",
            paste0(input$lob, " - ", input$client, " - ", input$project)
          )
        )
      ),
      
      DT::dataTableOutput("imp_tbl")
    )
  )
  
})

output$imp_tbl <- DT::renderDataTable({
  res <- imp_tbls[[input$lob]][[input$client]][[input$project]]

  DT::datatable(
    res, 
    options = list(
      pageLength = 20,
      orderClasses = TRUE,
      searching = TRUE,
      paging = TRUE
    ) 
  ) %>%
    DT::formatStyle(
      c("Job ID", "Name", "Description", "Change Category", "Priority", "Status", "Entry Date", "Completion Date"),
      #fontWeight = "bold",
      color = "black"
    )
})
  