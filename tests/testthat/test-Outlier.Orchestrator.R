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
  it("then the outlier in input should be returned",{
    # Given
    boundary.service <- Boundary.Service()

    orchestration <- Outlier.Orchestrator()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> boundary.service[['upper']]()
    boundary.lower <- input |> boundary.service[['lower']]()

    expected.outliers <- input[input < boundary.lower | input > boundary.upper]
    actual.outliers   <- input |> orchestration[['extract']]()

    # Then
    actual.outliers |> expect.equal(expected.outliers)
  })
})

describe("When input |> orchestration[['remove']]()",{
  it("then the outlier in input should be removed",{
    # Given
    boundary.service <- Boundary.Service()

    outlier.orchestration <- Outlier.Orchestrator()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> boundary.service[['upper']]()
    boundary.lower <- input |> boundary.service[['lower']]()

    expected.outliers <- input[input >= boundary.lower & input <= boundary.upper]
    actual.outliers   <- input |> outlier.orchestration[['remove']]()

    # Then
    actual.outliers |> expect_equal(expected.outliers)
  })
})