#' IQR Exceptions
#'
#' @description
#' `IQR.Exceptions()` is an internal function that returns a set of exceptions used by `IQR.Validation()` service.
#' * The first exception: `argument.NULL`, indicates to the user that no input argument was provided but required.
#' * The second exception: `type.mismatch`, indicates to the user that the input is not of the correct data type.
#' * The third exception: `property.missing`, indicates to the user that the input is missing a property.
#' @usage NULL
#' @returns A `list` of exceptions: 
#' * `argument.NULL()`
#' * `type.mismatch()`
#' * `property.missing()`
IQR.Exceptions <- \(){
  exceptions <- list()
  exceptions[['argument.NULL']]    <- \(invoke) {
    if(invoke) stop("Argument.NULL: 'sample' cannot be NULL.", call. = FALSE)
  }
  exceptions[['type.mismatch']]    <- \(invoke, actual = NULL) {
    if (invoke) stop("Type.Mismatch: Got '", actual, "' but expected 'numeric'.", call. = FALSE)
  }
  exceptions[['property.missing']] <- \(invoke, property = NULL) {
    if (invoke) stop("Property.Missing: '",property,"'.", call. = FALSE)
  }
  return(exceptions)
}