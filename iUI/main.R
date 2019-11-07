##
# Source all ui files
##
ui_files <- c("select_proj", "display_proj")
lapply(ui_files, function(f){
  source(paste0("./iUI/", f, ".R"), local = FALSE)
})

##
# Shiny ui
##
mainUI <- fluidPage(theme = shinythemes::shinytheme("darkly"),
  
  # css style
  tags$head(
    includeCSS("pmp_style.css")
  ),
  
  # main output
  navlistPanel(
    "Project Portal",
    widths = c(2, 10),
    tp_select_proj,
    tp_display_proj
  )

)
