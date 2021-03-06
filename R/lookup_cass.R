#' Search for the cas number associated with a string in the common chemistry database
#' @param search_string name of analyte
#' @return if the string is associated with a cass number in the database, the cass number will be returned; if the string is not associated with a cass number, NA will be returned 
#' @export
lookup_cass <- function(search_string){
  require(httr)
  url <- paste0(
    "https://commonchemistry.cas.org/api/search?q=",
    search_string
  )
  r <- httr::GET(url)
  if (r$status_code == 200){
    a <- httr::content(r, "parsed")
    if (length(a$results)==1){
      cas <- a$result[[1]]$rn
    }
  } else {
    print("cass number not found")
    print(paste("status code:", r$status_code))
    return(NA)
  }
  return(cas)
}
