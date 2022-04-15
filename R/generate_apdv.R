#' Generate apdv file for EVS
#' @param data data.frame to be converted to aidv format for use in EVS; names(data)==c("x", "y", "z", "result_name_1", "result_name_2", ... ,"boring")
#' @param base_elevation ground elevation at sample location
#' @param elevation_units elevation units; defaults to "ft"
#' @param result_units vector length must be equal to the number of analytes
#' @param fp_out file path to output apdv file
#' @examples 
#' data <- data.frame(
#'    x = c(1,2),
#'    y = c(3,4),
#'    z = c(5, 6),
#'    Analyte1 = c(2, 1),
#'    Analyte2 = c(3, 5),
#'    boring = c("a1", "b1"),
#'    surface_elevation = c(0, 1)
#' )
#' base_elevation <- 4
#' elevation_units <- "feet"
#' result_units <- c("ug/l", "ug/l")
#' fp_out <- "my_data.apdv"
#' generate_apdv(data, base_elevation, elevation_units, result_units, fp_out)
#' @export
generate_apdv <- function(
    data,
    base_elevation,
    elevation_units="ft",
    result_units,
    fp_out
){
  # some basic data checks 
  data <- dplyr::arrange(data, boring, z)
  data[is.na(data)] <- "missing"
  names_result <- names(data)[4:(ncol(data)-2)]
  names_result[1] <- paste0("@@", names_result[1])
  n_samples <- nrow(data)
  n_analytes <- length(names_result)
  cat(
    "x",  "y", "z", names_result, "boring", "surface_elevation", 
    paste0("\n", "Elevation ", elevation_units),
    paste0("\n", n_samples), n_analytes, result_units,
    sep = "\t",
    file = fp_out
  )
  cat(
    paste0("\n",  paste0(apply(data, 1, paste, collapse = "\t"), collapse = "\n")),
    file = fp_out,
    append = T
  )
}
