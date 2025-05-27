Adapter.Validator <- \() {
  validators <- list()
  validators[['is.data.frame']] <- \() {}
  return(validators)
}