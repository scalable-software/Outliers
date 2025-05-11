#' Outlier Validator
#' 
#' @description
#' `Outlier.Validator()` is an internal function that returns a set of validators used by `Outlier.Validation()` service.
#' * The first validator: `sample`, validates the sample data provided for analysis.
#' * The second validator: `exist`, checks if the sample data is not NULL.
#' * The third validator: `is.numeric`, checks if the sample data is numeric.
#' * The fourth validator: `is.medcouple.in.range`, checks if the medcouple of the sample data is in the range of -0.6 to 0.6.
#' @usage NULL
#' @returns A `list` of validators:
#' * `sample()`
#' * `exist()`
#' * `is.numeric()`
#' * `is.medcouple.in.range()`
#' @export
Outlier.Validator <- \() {
  exception <- Outlier.Exceptions()
  warnings  <- Outlier.Warnings()

  skewness  <- Skewness.Broker() |> Skewness.Service()

  validators <- list()
  validators[['sample']] <- \(sample) {
    sample |> validators[['exist']]()
    sample |> validators[['is.numeric']]()
    sample |> validators[['is.medcouple.in.range']]()
    
    return(sample)
  }
  validators[['exist']] <- \(sample) {
    sample |> is.null() |> exception[['argument.NULL']]()
    return(sample)
  }
  validators[['is.numeric']] <- \(sample) {
    sample |> is.numeric() |> isFALSE() |> exception[['type.mismatch']](class(sample))
    return(sample)
  }
  validators[['is.medcouple.in.range']] <- \(sample) {
    medcouple <- sample |> skewness[['medcouple']]()

    (medcouple > 0.6)  |> warnings[['out.of.range']]()
    (medcouple < -0.6) |> warnings[['out.of.range']]()
  
    return(sample)
  }
  return(validators)
}