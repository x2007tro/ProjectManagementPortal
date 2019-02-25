##
# Initalize instructions
##
tasks <- reactive({
  
  ##
  # Read instructions
  ##
  
  ##
  # wc wscc rset
  withProgress(
    message = 'Reading data',
    detail = 'This may take a while...', value = 0, 
    {
      rset_res <- ParseInstructions(fp = input$gloconf_tmp1)
    }
  )
  
  ##
  # wc wscc ben val
  withProgress(
    message = 'Reading data',
    detail = 'This may take a while...', value = 0, 
    {
      bval_res <- ParseInstructions(fp = input$gloconf_tmp3)
    }
  )
  
  ##
  # enter the next project
  ##
  
  
  ##
  # complie final list
  inst <- list()
  inst$wc$wscc$rset <- rset_res
  inst$wc$wscc$ben_val <- bval_res
  
  return(inst)
})