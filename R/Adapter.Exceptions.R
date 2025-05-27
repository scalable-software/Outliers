Adapter.Exceptions <- \() {
  exceptions <- list()
  exceptions[['type.mismatch']] <- \(invoke, actual = NULL, type = NULL) {
    if (invoke) stop("Type.Mismatch: Got '", actual, "' but expected '",type,"'.", call. = FALSE)
  }
  exceptions[['column.invalid']] <- \(invoke, column = NULL) {
    if (invoke) stop("Column.Invalid: Column name '", column, "' is invalid", call. = FALSE)
  }
  exceptions[['argument.NULL']] <- \(invoke, name = NULL) {
    if(invoke) stop("Argument.NULL: '",name ,"' cannot be NULL.", call. = FALSE)
  }
  return(exceptions)
}