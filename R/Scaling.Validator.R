#' Scaling Validator
#'
#' @description
#' `Scaling.Validator()` is an internal function that returns a set of validators used by `Scaling.Service()`.
#' * The first validator: `medcouple`, checks if the medcouple provided is not NULL and is numeric.
#' * The second validator: `exist`, checks if a non-null medcouple argument was provided.
#' * The third validator: `is.numeric`, checks if the medcouple argument provided contains numerical data.
#' @usage NULL
#' @returns A `list` of validators: 
#' * `medcouple()`
#' * `exist()`
#' * `is.numeric()`
Scaling.Validator <- \() {
  exception <- Scaling.Exceptions()

  validators <- list()
  validators[['medcouple']]     <- \(medcouple) {
    medcouple |> validators[['exist']]()
    medcouple |> validators[['is.numeric']]()
    return(medcouple)
  }
  validators[['exist']]      <- \(medcouple) {
    medcouple |> is.null() |> exception[['argument.NULL']]()
    return(medcouple)
  }
  validators[['is.numeric']] <- \(medcouple) {
    medcouple |> is.numeric() |> isFALSE() |> exception[['type.mismatch']](class(medcouple))
    return(medcouple)
  }
  return(validators)
}