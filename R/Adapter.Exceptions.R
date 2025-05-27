Adapter.Exceptions <- \() {
  exceptions <- list()
  exceptions[['type.mismatch']] <- \(invoke, actual = NULL) {
    if (invoke) stop("Type.Mismatch: Got '", actual, "' but expected 'numeric'.", call. = FALSE)
  }
  return(exceptions)
}