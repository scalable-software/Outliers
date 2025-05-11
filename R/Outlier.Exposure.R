#' Extract outliers 
#' 
#' @description
#' `Outliers.extract()` is a function that extracts outliers from a sample.
#'
#' @param sample A sample from which to extract outliers.
#'  
#' @return A sample with outliers extracted.
#' @export
extract.outliers <- \(sample) sample |> Outlier.Orchestrator()[['extract']]()

#' Remove outliers
#'
#' @description
#' `Outliers.remove()` is a function that removes outliers from a sample.
#'
#' @param sample A sample from which to remove outliers.
#'
#' @return A sample with outliers removed.
#' @export
remove.outliers  <- \(sample) sample |> Outlier.Orchestrator()[['remove']]()
