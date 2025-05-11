#' Quartile Utility Services
#'
#' @description
#' `Quartile.Service()` returns a set of utility functions that can be used to analyze data:
#' * The first function: `first`, calculates and returns the 25th percentile of a sample data set.
#' * The second function: `third`, calculates and returns the 75th percentile of a sample data set.
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `first(data)`
#' * `third(data)`
Quartile.Broker <- \() {
  services <- list()
  services[['first']] <- \(sample) sample |> stats::quantile(0.25)
  services[['third']] <- \(sample) sample |> stats::quantile(0.75)
  return(services)
}