describe("Given Outlier.Broker", {
  it("exist",{
    Outlier.Broker |> expect.exist()
  })
})

describe("Given operations <- Outlier.Broker() |> Outlier.Service()",{
  it("then operations is a list",{
    # GIVEN
    operations <- Outlier.Broker() |> Outlier.Service()

    # THEN
    operations |> expect.list()
  })
  it("then operations contains 'extract' service",{
    # GIVEN
    operations <- Outlier.Broker() |> Outlier.Service()

    # THEN
    operations[['extract']] |> expect.exist()
  })
  it("then operations contains 'remove' service",{
    # GIVEN
    operations <- Outlier.Broker() |> Outlier.Service()

    # THEN
    operations[['remove']] |> expect.exist()
  })
})

describe("When input |> operation[['extract']]()",{
  it("then the outlier in input should be returned",{
    # GIVEN
    boundary  <- Boundary.Broker() |> Boundary.Service()
    operation <- boundary |> Outlier.Broker()
    input     <- 1000 |> rnorm(10,5)

    # WHEN
    boundary.upper <- input |> boundary[['upper']]()
    boundary.lower <- input |> boundary[['lower']]()

    expected.idx <- (input < boundary.lower | input > boundary.upper) |> which()
    actual.idx   <- input |> operation[['extract']]()

    # THEN
    actual.idx |> expect.equal(expected.idx)
  })
})

describe("When input |> operation[['remove']]()",{
  it("then the outlier in input should be removed",{
    # GIVEN
    boundary <- Boundary.Broker() |> Boundary.Service()
    operation <- boundary |> Outlier.Broker()
    input    <- 1000 |> rnorm(10,5)

    # WHEN
    boundary.upper <- input |> boundary[['upper']]()
    boundary.lower <- input |> boundary[['lower']]()

    expected.idx <- (input >= boundary.lower & input <= boundary.upper) |> which()
    actual.idx   <- input |> operation[['remove']]()

    # THEN
    actual.idx |> expect.equal(expected.idx)
  })
})