#' Function for formatting analytical chemistry results
#' @param RESULT numeric vector of analytical chemistry results
#' @param DETECT_FLAG vector that whether or not the result lies beneath a detection limit; possible values are "N" and "Y"
#' @param DETECT_LIMIT the detection limits associate with the samples
#' @return returns a character vector compatible with EVS 
#' @export
result_to_text <- function(RESULT, DETECT_FLAG, DETECT_LIMIT){
  RESULT <- as.character(RESULT)
  RESULT[DETECT_FLAG == "N"] <- paste0("<", DETECT_LIMIT[DETECT_FLAG == "N"]/2)
  return(RESULT)
}