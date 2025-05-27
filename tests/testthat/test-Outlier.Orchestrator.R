describe("Given Outlier.Orchestrator",{
  it("exist",{
    Outlier.Orchestrator |> expect.exist()
  })
})

describe("When orchestrations <- Outlier.Orchestrator()",{
  it("then orchestrations is a list",{
    # Given
    orchestrations <- Outlier.Orchestrator()
    
    # Then
    orchestrations |> expect.list()
  })
  it("then orchestrations contains 'extract' orchestration",{
    # Given
    orchestrations <- Outlier.Orchestrator()
    
    # Then
    orchestrations[['extract']] |> expect.exist()
  })
  it("then orchestrations contains 'remove' orchestration",{
    # Given
    orchestrations <- Outlier.Orchestrator()
    
    # Then
    orchestrations[['remove']] |> expect.exist()
  })
})


describe("When input |> orchestration[['extract']]()",{
  it("then the outlier in input should be returned from numeric vector",{
    # Given
    service <- Boundary.Broker() |> Boundary.Service()

    orchestration <- Outlier.Orchestrator()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> service[['upper']]()
    boundary.lower <- input |> service[['lower']]()

    expected.outliers <- input[input < boundary.lower | input > boundary.upper]
    actual.outliers   <- input |> orchestration[['extract']]()

    # Then
    actual.outliers |> expect.equal(expected.outliers)
  })
  it("then the outlier in input should be returned from a data.frame",{
    # Given
    service <- 
      Boundary.Broker()  |>
      Boundary.Service() |> 
      Outlier.Broker()   |>
      Outlier.Service()


    adapter <-
      Adapter.Broker() |> 
      Adapter.Service()

    orchestration <- Outlier.Orchestrator()

    column <- 'value'

    input <- 1000 |> rnorm(10,5) |> data.frame() |> setNames(column)

    expected.outliers <- input[input |> 
      adapter[['extract.sample']](column) |> 
      service[['extract']](),]

    # When
    actual.outliers <- input |> orchestration[['extract']](column)

    # Then
    actual.outliers |> expect.equal(expected.outliers)
  })
})

describe("When input |> orchestration[['remove']]()",{
  it("then the outlier in input should be removed",{
    # Given
    service <- Boundary.Broker() |> Boundary.Service()

    outlier.orchestration <- Outlier.Orchestrator()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> service[['upper']]()
    boundary.lower <- input |> service[['lower']]()

    expected.outliers <- input[input >= boundary.lower & input <= boundary.upper]
    actual.outliers   <- input |> outlier.orchestration[['remove']]()

    # Then
    actual.outliers |> expect_equal(expected.outliers)
  })
})