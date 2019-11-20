##
# Read instructions
##
withProgress(
  message = 'Reading data',
  detail = 'This may take a while...', value = 0,
  {
    projects <- lapply(1:length(proj_dir), function(i){
      tmp <- lapply(1:length(proj_dir[[i]]), function(j){
        tmp <- lapply(1:length(proj_dir[[i]][[j]]), function(z){
          return(ParseInstructions(fp = proj_dir[[i]][[j]][[z]]))
        })
        names(tmp) <- names(proj_dir[[i]][[j]])
        return(tmp)
      })
      names(tmp) <- names(proj_dir[[i]])
      return(tmp)
    })
    names(projects) <- names(proj_dir)
    
    ##
    # read improvement tables
    imp_tbls <- lapply(1:length(proj_dir), function(i){
      tmp <- lapply(1:length(proj_dir[[i]]), function(j){
        tmp <- lapply(1:length(proj_dir[[i]][[j]]), function(z){
          return(ParseImpTables(fp = proj_dir[[i]][[j]][[z]]))
        })
        names(tmp) <- names(proj_dir[[i]][[j]])
        return(tmp)
      })
      names(tmp) <- names(proj_dir[[i]])
      return(tmp)
    })
    names(imp_tbls) <- names(proj_dir)
  }
 )
