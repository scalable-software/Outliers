#' IQR Processor
#'
#' @description
#' `IQR.Processor()` is an internal function that returns a processor used to calculate then `IQR`.
#' The processor includes dynamic dispatching to support different input types.
#' * The first processor: `IQR.from.quartiles`, calculates the IQR from the first and third quartiles.
#' * The second processor: `IQR.from.sample`, calculates the IQR from the sample data.
#' 
#' @param service IQR.Service instance injected into the processor.
#' @returns A `list` of processors: 
#' * `IQR()`
#' @export
IQR.Processor <- \(service) {
  processors <- list()
  processors[['IQR']] <- \(input) {
    services <- list()
    services[[1]] <- \(input) input |> service[['IQR.from.quartiles']]()
    services[[2]] <- \(input) input |> service[['IQR.from.sample']]()

    input |> services[[(input |> is.numeric()) + 1]]() 
  }
  return(processors)
}