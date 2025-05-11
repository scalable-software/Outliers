#' IQR Utility Services
#'
#' @description
#' `IQR.Service()` returns a set of utility functions that can be used to determine the inter quartile range from quartiles of a sample data set.
#' * The first function: `IQR.from.quartiles`, calculates and returns the inter quartile range (IQR) from quartiles.
#' * The second function: `IQR.from.sample`, calculates and returns the inter quartile range (IQR) from a sample data set.
#' 
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `IQR.from.quartiles(quartiles)`
#' * `IQR.from.sample(sample)`
#' @export
IQR.Service <- \(broker) {
  validate <- IQR.Validator()

  services <- list()
  services[['IQR.from.quartiles']] <- \(quartiles) {
    quartiles |> validate[['quartiles']]()
    quartiles |> broker[['IQR.from.quartiles']]()
  }
  services[['IQR.from.sample']]    <- \(sample) {
    sample |> validate[['sample']]()
    sample |> broker[['IQR.from.sample']]()
  }
  return(services)
}