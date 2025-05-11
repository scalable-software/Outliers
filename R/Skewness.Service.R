#' Skewness Utility Services
#'
#' @description
#' `Skewness.Service()` returns a set of utility functions that can be used to determine the skewness present in the sample data.
#' * The first function: `medcouple`, calculates and returns the medcouple of a sample data set.
#' 
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `medcouple(data)`
#' @examples
#' skewness <- Skewness.Broker() |> Skewness.Service()
#' 
#' skewness.medcouple <-
#'   1000 |> rnorm(10,5) |> skewness[['medcouple']]()
#' 
#' rm(skewness.medcouple)
#' @export
Skewness.Service <- \(broker) {
  validate <- Skewness.Validator()

  services <- list()
  services[['medcouple']] <- \(sample) {
    sample |> validate[['sample']]()
    sample |> broker[['medcouple']]()
  }
  return(services)
}