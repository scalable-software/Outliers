#' IQR Utility Broker
#'
#' @description
#' `IQR.Broker()` returns a set of utility functions that can be used to determine the inter quartile range from quartiles of a sample data set.
#' * The first function: `IQR.from.quartiles`, calculates and returns the inter quartile range (IQR) from quartiles.
#' * The second function: `IQR.from.sample`, calculates and returns the inter quartile range (IQR) from a sample data set.
#' 
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `IQR.from.quartiles(quartiles)`
#' * `IQR.from.sample(sample)`
IQR.Broker <- \() {
  quartile <- Quartile.Broker() |> Quartile.Service()
  
  validate <- IQR.Validator()

  operations <- list()
  operations[['IQR.from.quartiles']] <- \(quartiles) {
    quartiles[['third']] - quartiles[['first']]
  }
  operations[['IQR.from.sample']]    <- \(sample) {
    quartiles <- list()
    quartiles[['first']] <- sample |> quartile[['first']]()
    quartiles[['third']] <- sample |> quartile[['third']]()

    quartiles |> operations[['IQR.from.quartiles']]()
  }
  return(operations)
}