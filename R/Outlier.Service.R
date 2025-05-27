#' Outlier Service
#' 
#' @description
#' This service provides methods to extract and remove outliers from a sample based on specified boundaries.
#'
#' @param broker A Outlier.Broker instance that calculate the boundaries for outlier detection.
#' @return A list containing two functions: `extract` and `remove`.
#'  - `extract`: Extracts outliers from the sample.
#'  - `remove`: Removes outliers from the sample.
#'
Outlier.Service <- \(broker) {
  validate <- Outlier.Validator()

  services <- list()
  services[['extract']] <- \(sample) {
    sample |> validate[['sample']]()
    sample |> broker[['extract']]()
  }
  services[['remove']] <- \(sample) {
    sample |> validate[['sample']]()

    idx <- sample |> broker[['remove']]()
    sample[idx]
  }
  return(services)
}