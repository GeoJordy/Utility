#' The function maps data from one set to another using a lookup table
#' @param dat vector to be mapped
#' @param map data.frame with two columns defining the mapping
#' @example 
#' ab_map(
#'   c(1,2,3,1,2,3),
#'   data.frame(c(1, 2, 3), c("cat", "dog", "dog"))
#' )
#' @export
ab_map <- function(dat, map){
  for (i in 1:nrow(map)){
    dat[dat==map[i,1]] <- map[i,2]
  }
  return(dat)
}