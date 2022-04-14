#' View a color or a set of color overlays
#' @param cols a list of color overlays (see example)
#' @example
#' see_col(
#'  list(
#'    rgb(0, 0, 0, 1),
#'    rgb(1, 0, 0, 0.2)
#'  )
#' )
#' @export
see_col <- function(cols){
  require(grid)
  grid.newpage()
  pushViewport(
    viewport(
      xscale = c(0,100), 
      yscale = c(0,100)
    )
  )
  for (i in 1:length(cols)){
    grid.rect(gp=gpar(fill=cols[[i]]))
  }
}