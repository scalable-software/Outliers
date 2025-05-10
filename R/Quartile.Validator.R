#' Quartile Validator
#'
#' @description
#' `Quartile.Validator()` is an internal function that returns a set of validators used by `Quartile.Service()`.
#' * The first validator: `sample`, checks if the sample data provided is not NULL and is numeric.
#' * The second validator: `exist`, checks if a non-null data argument was provided.
#' * The third validator: `is.numeric`, checks if the data argument provided contains numerical data.
#' @usage NULL
#' @returns A `list` of validators: 
#' * `sample()`
#' * `exist()`
#' * `is.numeric()`
Quartile.Validator <- \() {
  exception <- Quartile.Exceptions()

  validators <- list()
  validators[['sample']]     <- \(sample) {
    sample |> validators[['exist']]()
    sample |> validators[['is.numeric']]()
    return(sample)
  }
  validators[['exist']]      <- \(sample) {
    sample |> is.null() |> exception[['argument.NULL']]()
    return(sample)
  }
  validators[['is.numeric']] <- \(sample) {
    sample |> is.numeric() |> isFALSE() |> exception[['type.mismatch']](class(sample))
    return(sample)
  }
  return(validators)
}