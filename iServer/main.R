#
# Shiny server
#
mainServer <- function(input, output, session) {

  ##
  # Data initialization
  ##
  source("./iServer/data_init.R", local = TRUE)

  ##
  # Render main UI
  ##
  output$main_output <- renderUI({
    
    navlistPanel(
      "Project Portal",
      widths = c(2, 10),
      
      do.call(
        navbarMenu,
        c('Line of Business', 
          
          # level 1: line of business
          lapply(1:length(projects), function(i){
            tabPanel(
              title = names(projects)[i],
              
              # level 2: clients
              do.call(
                tabsetPanel,
                c(id = paste0('l2t', i),
                  lapply(1:length(projects[[i]]), function(j){
                    tabPanel(
                      title = names(projects[[i]])[j],
                      
                      # level 3: Projects
                      do.call(
                        tabsetPanel,
                        c(id = paste0('l3t', i), 
                          lapply(1:length(projects[[i]][[j]]), function(z){
                            tasks <- projects[[i]][[j]][[z]]
                            tabPanel(
                              title = paste0(names(projects[[i]][[j]])[z]),
                              
                              ##
                              # start render content
                              ##

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
                                        
                                        ### replace yyyy and actual year
                                        # task_i_tmp <- gsub("yyyy-2", as.numeric(input[[paste0('input',i,j,z)]])-2, task_i)
                                        # task_i_tmp <- gsub("yyyy-1", as.numeric(input[[paste0('input',i,j,z)]])-1, task_i_tmp)
                                        # task_i_tmp <- gsub("yyyy+1", as.numeric(input[[paste0('input',i,j,z)]])+1, task_i_tmp)
                                        # task_i_tmp <- gsub("yyyy+2", as.numeric(input[[paste0('input',i,j,z)]])+2, task_i_tmp)
                                        # task_i <- gsub("yyyy", as.numeric(input[[paste0('input',i,j,z)]]), task_i_tmp)
                                        # 
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
                                                        tags$div(class = "task_div", textInput(paste0("stp",i,j,z), label = "Step", value = step_k, width = entry_wid_s)),
                                                        tags$div(class = "task_div", textInput(paste0("tsk",i,j,z), label = "Task", value = task_k, width = entry_wid_xl)),
                                                        tags$div(class = "task_div", textInput(paste0("act",i,j,z), label = "Action", value = action_k, width = entry_wid_m)),
                                                        tags$div(class = "task_div", id = "instr_div", tags$a(id = "instr_a", href=paste0("#comt",i,j,z), "Instructions"))

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
                                      lapply(1:length(tasks), function(k){
                                        
                                        ##
                                        # Process data, create year and month data
                                        step_k <- tasks[[k]]$step
                                        comt_k <- tasks[[k]]$comt
                                        fcomt_k <- tasks[[k]]$fcomt
                                        
                                        ##
                                        # Main task section
                                        fluidRow(
                                          column(
                                            width = 12,
                                            
                                            tags$div(
                                              style = "border-bottom:1px solid gray;",
                                              
                                              ##
                                              # meat here
                                              if(tasks[[k]]$step == "#") {
                                                
                                                tags$h4(class = "task_cat_div", tasks[[k]]$task)
                                                
                                              } else {
                                                
                                                tagList(
                                                  tags$div(class = "task_div", textInput(paste0("inst_stp",i,j,z), label = "Step", value = step_k, width = entry_wid_s)),
                                                  tags$div(
                                                    class = "inst_div",
                                                    id = paste0("comt", i,j,z),
                                                    lapply(1:length(comt_k), function(j){
                                                      if(comt_k[j] == "") tags$p("None") else tags$p(comt_k[j])
                                                    })
                                                  ),
                                                  tags$div(
                                                    class = "inst_div",
                                                    id = paste0("fcomt", i,j,z),
                                                    lapply(1:length(fcomt_k), function(j){
                                                      if(comt_k[j] == "") tags$p("None") else tags$p(fcomt_k[j])
                                                    })
                                                  )
                                                )
                                                
                                              }
                                            )
                                          )
                                        )
                                        
                                      })
                                    )
                                  )
                                )
                              )
                              
                            )}) 
                        ) 
                      ) # end of level 3 do.call
                      
                    )})
                )
              ) # end of level 2 do.call
              
            )
          })
        )
      ), # end of level 3 do.call
      
      tabPanel(
        "Configurations"
      )
    ) # end of navbarpage
    
  })
}
