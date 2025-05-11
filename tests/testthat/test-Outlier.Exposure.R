describe("Given extract.outliers",{
  it("exist",{
    extract.outliers  |> expect.exist()
  })
})

describe("Given remove.outliers",{
  it("exist",{
    remove.outliers  |> expect.exist()
  })
})

describe("When input |> Outliers.extract()",{
  it("then the outlier in input should be returned",{
    # Given
    orchestration <- Outlier.Orchestrator()
    input   <- 1000 |> rnorm(10,5)

    expected.outliers <- input |> orchestration[['extract']]()
    # When
    actual.outliers   <- input |> extract.outliers()

    # Then
    actual.outliers |> expect.equal(expected.outliers)
  })
})

describe("When input |> Outliers.remove()",{
  it("then the outlier in input should be removed",{
    # Given
    orchestration <- Outlier.Orchestrator()
    input   <- 1000 |> rnorm(10,5)

    expected.output <- input |> orchestration[['remove']]()

    # When
    actual.output   <- input |> remove.outliers()

    # Then
    actual.output |> expect.equal(expected.output)
  })
})