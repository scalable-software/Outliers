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
#' @examples
#' IQR <- IQR.Service()
#' 
#' iqr <-
#'   1000 |> rnorm(10,5) |> IQR[['IQR.from.sample']]()
#' 
#' rm(iqr)
#' @export
IQR.Service <- \() {
  quartile <- Quartile.Service()
  
  validate <- IQR.Validator()

  services <- list()
  services[['IQR.from.quartiles']] <- \(quartiles) {
    quartiles |> validate[['quartiles']]()

    quartiles[['third']] - quartiles[['first']]
  }
  services[['IQR.from.sample']]    <- \(sample) {
    sample |> validate[['sample']]()

    quartiles <- list()
    quartiles[['first']] <- sample |> quartile[['first']]()
    quartiles[['third']] <- sample |> quartile[['third']]()

    quartiles |> services[['IQR.from.quartiles']]()
  }
  return(services)
}