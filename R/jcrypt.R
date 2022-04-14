#' Encrypt or decrypt a character vector
#' @param vec character vector to encrypt
#' @param key encryption/decrytion key
#' @param encrypt encrypts when encrypt==T; decrypts when encrypt==F 
#' @export
jcrypt <- function(vec, key, encrypt=T){
  require(safer)
  if (isTRUE(encrypt)){
    return(unlist(lapply(vec, FUN=encrypt_string, key=key)))
  } else{
    return(unlist(lapply(vec, FUN=decrypt_string, key=key)))
  }
}