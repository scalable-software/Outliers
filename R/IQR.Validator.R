#' IQR Validator
#'
#' @description
#' `IQR.Validator()` is an internal function that returns a set of validators used by `IQR.Service()`.
#' * The first validator: `sample`, checks if the sample data provided is not NULL and is numeric.
#' * The second validator: `quartiles`, checks if the quartiles is not NULL, a list and has first and third quartiles.
#' * The third validator: `exist`, checks if a non-null data argument was provided.
#' * The fourth validator: `is.numeric`, checks if the data argument provided contains numerical data.
#' * The fifth validator: `is.list`, checks if the data argument provided is a list.
#' * The sixth validator: `has.first.quartile`, checks if the quartiles list has a first quartile property.
#' * The seventh validator: `has.third.quartile`, checks if the quartiles list has a third quartile property.
#' @usage NULL
#' @returns A `list` of validators: 
#' * `sample()`
#' * `quartiles()`
#' * `exist(argument)`
#' * `is.numeric()`
#' * `is.list()`
#' * `has.first.quartile()`
#' * `has.third.quartile()`
IQR.Validator <- \(){
  exception <- IQR.Exceptions()
  
  validators <- list()
  validators[['sample']]             <- \(sample) {
    sample |> validators[['exist']]('sample')
    sample |> validators[['is.numeric']]()
    return(sample)
  }
  validators[['quartiles']]          <- \(quartiles) {
    quartiles |> validators[['exist']]('quartiles')
    quartiles |> validators[['is.list']]()
    quartiles |> validators[['has.first.quartile']]()
    quartiles |> validators[['has.third.quartile']]()
    return(quartiles)
  }
  validators[['exist']]              <- \(data, argument = NULL) {
    data |> is.null() |> exception[['argument.NULL']](argument)
    return(data)
  }
  validators[['is.numeric']]         <- \(sample) {
    sample |> is.numeric() |> isFALSE() |> exception[['type.mismatch']](class(sample), 'numeric')
    return(sample)
  }
  validators[['is.list']]            <- \(quartiles) {
    quartiles |> is.list() |> isFALSE() |> exception[['type.mismatch']](class(quartiles), 'list')
    return(quartiles)
  }
  validators[['has.first.quartile']] <- \(quartiles) {
    quartiles[['first']] |> is.null() |> exception[['property.missing']]('first')
    return(quartiles)
  }
  validators[['has.third.quartile']] <- \(quartiles) {
    quartiles[['third']] |> is.null() |> exception[['property.missing']]('third')
    return(quartiles)
  }
  return(validators)
}