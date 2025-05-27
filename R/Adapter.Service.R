Adapter.Service <- \(broker) {
  validate <- Adapter.Validator()

  services <- list()
  services[['extract.sample']] <- \(data, column) {
    data |> validate[['exist']]()
    
    data |> broker[['extract.sample']](column)
  }
  return(services)
}