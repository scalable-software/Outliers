#' Extract outliers 
#' 
#' @description
#' `Outliers.extract()` is a function that extracts outliers from a sample.
#'
#' @param input A vector or data.frame from which to extract outliers.
#' @param name The name of the column in the data.frame which should be used for outlier extraction. If `input` is a vector, this parameter is ignored.
#'  
#' @return A vector or data.frame with outliers.
#' @export
extract.outliers <- \(input, name) input |> Outlier.Orchestrator()[['extract']](name)

#' Remove outliers
#'
#' @description
#' `Outliers.remove()` is a function that removes outliers from a sample.
#'
#' @param input A vector or data.frame from which to remove outliers.
#' @param name The name of the column in the data.frame which should be used for outlier removal. If `input` is a vector, this parameter is ignored.
#'
#' @return A vector or data.frame with no outliers.
#' @export
remove.outliers  <- \(input, name) input |> Outlier.Orchestrator()[['remove']](name)
