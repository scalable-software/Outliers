Adapter.Service <- \(broker) {
  services <- list()
  services[['extract.sample']] <- \(data, column) {
    data |> broker[['extract.sample']](column)
  }
  return(services)
}