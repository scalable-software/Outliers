Adapter.Validator <- \() {
  exceptions <- Adapter.Exceptions()

  validators <- list()
  validators[['exist']]           <- \(input) {
    input |> is.null() |> exceptions[['argument.NULL']]('input')
    return(input)
  }
  validators[['is.data.frame']]   <- \(input) {
    input |> is.data.frame() |> isFALSE() |> exceptions[['type.mismatch']](class(input), 'data.frame')
    return(input)
  }
  validators[['is.valid.column']] <- \(input, column) {
    input[[column]] |> is.null() |> exceptions[['column.invalid']](column)
    return(input)
  }
  return(validators)
}