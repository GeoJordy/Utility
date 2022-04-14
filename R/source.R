#' Function sources all files within a given directory
#' @export
source_dir <- function(){
  dir <- get_dir()
  setwd(dir)
  files <- list.files(dir)
  print(paste0("source_dir(", dir, ")"))
  for (file in files){
    source(file)
  }
}


