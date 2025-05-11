#' Outlier Broker
#' 
#' @description
#' This service provides methods to extract and remove outliers from a sample based on specified boundaries.
#'
#' @param boundary A Boundary.Service object that defines the upper and lower boundaries for outlier detection.
#' @return A list containing two functions: `extract` and `remove`.
#'  - `extract`: Extracts outliers from the sample.
#'  - `remove`: Removes outliers from the sample.
#'
Outlier.Broker <- \(boundary) {
  operations <- list()
  operations[['extract']] <- \(sample) { 
    boundary.upper <- sample |> boundary[['upper']]()
    boundary.lower <- sample |> boundary[['lower']]()

    sample[sample < boundary.lower | sample > boundary.upper] 
  }
  operations[['remove']] <- \(sample) {
    boundary.upper <- sample |> boundary[['upper']]()
    boundary.lower <- sample |> boundary[['lower']]()

    sample[sample >= boundary.lower & sample <= boundary.upper] 
  }
  return(operations)
}