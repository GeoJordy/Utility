#' Function returns month associated with a POSIXct data
#' @param date POSIXct date
#' @export
get_month <- function(date){
  as.numeric(as.character(date, format="%m"))
}
#' Function returns year associated with a POSIXct data
#' @param date POSIXct date
#' @export
get_year <- function(date){
  as.numeric(as.character(date, format="%Y"))
}