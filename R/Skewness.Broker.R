#' Skewness Utility Broker
#'
#' @description
#' `Skewness.Broker()` returns a set of utility functions that can be used to determine the skewness present in the sample data.
#' * The first function: `medcouple`, calculates and returns the medcouple of a sample data set.
#' 
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `medcouple(data)`
Skewness.Broker <- \() {
  operations <- list()
  operations[['medcouple']] <- \(sample) sample |> robustbase::mc()
  return(operations)
}