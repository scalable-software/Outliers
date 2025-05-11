#' Scaling Utility Services
#'
#' @description
#' `Scaling.Service()` returns a pair of utility functions that is used to calculate a scaling factor as part of outlier detection:
#' * The first function: `upper`, calculates and returns the upper scaling factor based on the medcouple value.
#' * The second function: `lower`, calculates and returns the lower scaling factor based on the medcouple value.
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `upper(medcouple)`
#' * `lower(medcouple)`
#' @export
Scaling.Service <- \(broker) {
  validate <- Scaling.Validator()

  services <- list()
  services[['upper']] <- \(medcouple) {
    medcouple |> validate[['medcouple']]()
    medcouple |> broker[['upper']]()
  }
  services[['lower']] <- \(medcouple) {
    medcouple |> validate[['medcouple']]()   
    medcouple |> broker[['lower']]()
   }
  return(services)
}