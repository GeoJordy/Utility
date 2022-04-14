#' Combine multiple excel files with identical fields into a master data set
#' @param dir the directory where the excel files live
#' @export
combine_files <- function(){
  files <- list.files(dir)
  for (i in 1:length(files)){
    if (i==1){
      dat <- readxl::read_xlsx(paste0(dir, files[i]))
    }else{
      dat <- rbind(dat, readxl::read_xlsx(paste0(dir, files[i])))
    }
  }
  return(dat)
}
