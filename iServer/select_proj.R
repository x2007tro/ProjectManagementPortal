##
# Update input
##
observe({
  updateSelectInput(session, "client", choices = names(proj_dir[[input$lob]]))
  updateSelectInput(session, "project", choices = names(proj_dir[[input$lob]][[input$client]]))
})
