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
      res <- ParseInstructions(fp = input$gloconf_tmp1)
    }
  )
  
  ##
  # enter the next project
  
  ##
  # complie final list
  inst <- list()
  inst$wc$wscc$rset <- res
  
  return(inst)
})