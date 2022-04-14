#' Extract value from raster at a specific spatial location
#' @param x x coordinate
#' @param y y coordinate
#' @param z raster object
#' @export
z_from_topo <- function(x, y, topo){
  cell <- raster::extract(
    topo, 
    SpatialPoints(
      cbind(x, y)
    ), 
    cellnumbers=TRUE
  )[1]
  ir <- as.numeric(rowColFromCell(topo, cell)[1])
  ic <- as.numeric(rowColFromCell(topo, cell)[2])
  return(
    topo[ir, ic]
  )
}