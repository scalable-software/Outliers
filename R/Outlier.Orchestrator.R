Outlier.Orchestrator <- \() {
  service <- Boundary.Service() |> 
    Outlier.Broker() |>
    Outlier.Service()

  orchestrations <- list()
  orchestrations[['extract']] <- \(sample) sample |> service[['extract']]()
  orchestrations[['remove']]  <- \(sample) sample |> service[['remove']]()
  return(orchestrations)
}