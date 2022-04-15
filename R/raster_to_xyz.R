#' Convert raster data to an xyz point cloud
#' @param fp_raster file path of input raster
#' @param fp_out file path of output point cloud
#' @export
raster_to_xyz <- function(fp_raster, fp_out){
  raster_in <- raster::raster(fp_raster)
  raster_in <- raster::aggregate(raster_in, fact=10)
  xyz <- raster::rasterToPoints(raster_in)
  write.table(
    xyz,
    file = fp_out,
    col.names=F,
    row.names = F
  )
}