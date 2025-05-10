#' Scaling Exceptions
#'
#' @description
#' `Scaling.Exceptions()` is an internal function that returns a set of exceptions used by `Scaling.Validation()` service.
#' * The first exception: `argument.NULL`, indicates to the user that no sample data have to provided for analysis.
#' * The second exception: `type.mismatch`, indicates to the user that the sample data provided is not numerical data.
#' @usage NULL
#' @returns A `list` of exceptions: 
#' * `argument.NULL()`
#' * `type.mismatch()`
Scaling.Exceptions <- \() {
  exceptions <- list()
  exceptions[['argument.NULL']] <- \(invoke) {
    if(invoke) stop("Argument.NULL: 'medcouple' cannot be NULL.", call. = FALSE)
  }
  exceptions[['type.mismatch']] <- \(invoke, actual = NULL) {
    if (invoke) stop("Type.Mismatch: Got '", actual, "' but expected 'numeric'.", call. = FALSE)
  }
  return(exceptions)
}