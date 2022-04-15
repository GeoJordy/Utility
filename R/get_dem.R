#' Pull in DEM from Amazon Web Services
#' @param df data.frame of x and y coordinates 
#' @param epsg epsg code for coordinate pair
#' @export
get_dem <- function(df, epsg){
  dem <- elevatr::get_elev_raster(
    locations = df,
    prj = CRS(paste0("+init=epsg:", crs))
  )
  return(dem)
}
#' Get elevation at a set of points using Amazon Web Services
#' @param df data.frame of x and y coordinates 
#' @param epsg epsg code for coordinate pair
#' @export
get_elevation_point <- function(df, epsg){
  dem <- elevatr::get_elev_point(
    locations = df,
    prj = CRS(paste0("+init=epsg:", crs))
  )
  return(dem)
}