Adapter.Service <- \(broker) {
  validate <- Adapter.Validator()

  services <- list()
  services[['extract.sample']] <- \(data, column) {
    data   |> validate[['exist']]()
    column |> validate[['exist']]()

    data   |> validate[['is.data.frame']]()
    data   |> validate[['is.valid.column']](column)
    
    data |> broker[['extract.sample']](column)
  }
  return(services)
}