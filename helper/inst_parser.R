##
# Parse instruction table into list
##
ParseInstructions <- function(fp){
  
  ##
  # content_df
  #
  # 1.\ Step
  # 2.\ Task
  # 3.\ Action
  # 4.\ Comment
  # 5.\ FurtherComment
  #
  content_df <- as.data.frame(readxl::read_excel(fp, sheet = "Instructions", col_names = TRUE))
  content_df[is.na(content_df)] <- ""
  
  content_list <- lapply(1:nrow(content_df), function(i){
    
    step <- content_df[i, "Step"]
    task <- content_df[i, "Task"]
    action <- content_df[i, "Action"]
    comt <- content_df[i, "Comment"]
    fcomt <- content_df[i, "FurtherComment"]
    
    if(task != ""){
      ##
      # Only process non-empty row
      res <- list(
        step = step,
        task = task,
        action = action,
        comt = ParseComment(comt),
        fcomt = ParseComment(fcomt)
      )
    } else {
      res <- NULL
    }
    
    return(res)
  })
  
  # remove empty list element
  fnl_res <- content_list[!sapply(content_list, is.null)]
  return(fnl_res)
}

##
# Parse comment
##
ParseComment <- function(comt){
  
  if(comt != ""){
    tmp1 <- gsub("\n", "", comt)  # remove '\n'
    tmp2 <- strsplit(tmp1, split = "[#", fixed = TRUE)
    tmp3 <- gsub("#]",".",tmp2[[1]]) 
  } else {
    tmp3 <- comt
  }
  
  return(tmp3)
}

##
# Parse improvement tables
##
ParseImpTables <- function(fp){
  content_df <- as.data.frame(readxl::read_excel(fp, sheet = "Improvements", col_names = TRUE))
  return(content_df)
}