##
# Select project
tp_select_proj <- tabPanel(
  "Select project",
  
  tabsetPanel(
    tabPanel(
      "Main",
      fluidRow(
        column(
          12,
          selectInput("lob", "Line of Business", choices = names(proj_dir), selectize = TRUE, multiple = FALSE),
          selectInput("client", "Client", choices = names(proj_dir[[1]]), selectize = TRUE, multiple = FALSE),
          selectInput("project", "Project", choices = names(proj_dir[[1]][[1]]), selectize = TRUE, multiple = FALSE)
        )
      )
    )
  )
  
)