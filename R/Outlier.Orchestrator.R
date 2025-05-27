Outlier.Orchestrator <- \() {
  service <- 
    Boundary.Broker()  |>
    Boundary.Service() |> 
    Outlier.Broker()   |>
    Outlier.Service()

  orchestrations <- list()
  orchestrations[['extract']] <- \(sample) {
    idx <- sample |> service[['extract']]()
    sample[idx]
  }
  orchestrations[['remove']]  <- \(sample) sample |> service[['remove']]()
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