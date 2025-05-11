#' Boundary Service
#'
#' @description
#' `Boundary.Service()` is a function that returns a set of services used to calculate the upper and lower boundaries for outlier detection.
#' It uses the inter quartile range (IQR) method and the skewness of the data to determine the boundaries.
#' 
#' @usage NULL
#' @returns A `list` of services:
#' * `upper()`: Calculates the upper boundary for outlier detection.
#' * `lower()`: Calculates the lower boundary for outlier detection.
#' 
#' @export
Boundary.Service <- \(broker) {
  validate <- Boundary.Validator()
  
  services <- list()
  services[['upper']] <- \(sample) {
    sample |> validate[['sample']]()
    sample |> broker[['upper']]()
  }
  services[['lower']] <- \(sample) {
    sample |> validate[['sample']]()
    sample |> broker[['lower']]()
  }
  return(services)
}