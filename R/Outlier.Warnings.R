#' Outlier Warnings
#' 
#' @description
#' `Outlier.Warnings()` is an internal function that returns a set of warnings used by `Outlier.Validation()` service.
#' * The first warning: `out.of.range`, indicates to the user that the medcouple value is out of range.
#' 
#' @usage NULL
#' @returns A `list` of warnings:
#' * `out.of.range()`
#'
Outlier.Warnings <- \() {
  warnings <- list()
  warnings[['out.of.range']] <- \(invoke) {
    if (invoke) {warning('medcouple is out of range: -0.6 > MC > 0.6')}
  }
  return(warnings)
}