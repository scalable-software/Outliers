#' Scaling Utility Broker
#'
#' @description
#' `Scaling.Broker()` returns a pair of utility functions that is used to calculate a scaling factor as part of outlier detection:
#' * The first function: `upper`, calculates and returns the upper scaling factor based on the medcouple value.
#' * The second function: `lower`, calculates and returns the lower scaling factor based on the medcouple value.
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `upper(medcouple)`
#' * `lower(medcouple)`
Scaling.Broker <- \() {
  services <- list()
  services[['upper']] <- \(medcouple) {
    adjustments <- list()
    adjustments[[1]] <- \(medcouple) exp(-3*medcouple)
    adjustments[[2]] <- \(medcouple) exp(-4*medcouple)
    
    medcouple |> adjustments[[(medcouple >= 0) + 1]]()
  }
  services[['lower']] <- \(medcouple) {
    adjustments <- list()
    adjustments[[1]] <- \(medcouple) exp(4*medcouple)
    adjustments[[2]] <- \(medcouple) exp(3*medcouple)
    
    medcouple |> adjustments[[(medcouple >= 0) + 1]]()
   }
  return(services)
}