Adapter.Validator <- \() {
  exceptions <- Adapter.Exceptions()

  validators <- list()
  validators[['is.data.frame']] <- \(input) {
    input |> is.data.frame() |> isFALSE() |> exceptions[['type.mismatch']](class(input), 'data.frame')
    return(input)
  }
  return(validators)
}