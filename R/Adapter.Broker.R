Adapter.Broker <- \() {
  adaptations <- list()
  adaptations[['extract.sample']] <- \(data, column) {
    data[[column]]
  }
  return(adaptations)
}