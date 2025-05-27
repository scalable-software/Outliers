Adapter.Exceptions <- \() {
  exceptions <- list()
  exceptions[['type.mismatch']] <- \(invoke, actual = NULL, type = NULL) {
    if (invoke) stop("Type.Mismatch: Got '", actual, "' but expected '",type,"'.", call. = FALSE)
  }
  return(exceptions)
}