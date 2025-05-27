Outlier.Orchestrator <- \() {
  service <- 
    Boundary.Broker()  |>
    Boundary.Service() |> 
    Outlier.Broker()   |>
    Outlier.Service()

  adapter <-
    Adapter.Broker() |> 
    Adapter.Service()

  orchestrations <- list()
  orchestrations[['extract']] <- \(input, name) {
    if(input |> is.data.frame()) 
      input[input |> adapter[['extract.sample']](name) |> service[['extract']](),]
    else 
      input[input |> service[['extract']]()]
    
  }
  orchestrations[['remove']]  <- \(sample, name) sample[sample |> service[['remove']]()]
  return(orchestrations)
}

#' Outlier Orchestrator
#' 
#' @description
#' `Outlier.Orchestrator()` is a function that orchestrates the outlier detection process.
#'
#' @return A list containing two functions: `extract` and `remove`.
#'  - `extract`: Extracts outliers from the sample.
#'  - `remove`: Removes outliers from the sample.
#'
#' @export
Orchestrator <- Outlier.Orchestrator