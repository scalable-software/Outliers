describe("Given Boundary.Broker", {
  it("Exist",{
    Boundary.Broker |> expect.exist()
  })
})

describe("Given operations <- Boundary.Broker()",{
  it("then operations is a list",{
    # GIVEN
    operations <- Boundary.Broker()

    # THEN
    operations |> expect.list()
  })
  it("then operations contain 'upper' operation",{
    # GIVEN
    operations <- Boundary.Broker()

    # THEN
    operations[['upper']] |> expect.exist()
  })
  it("then operations contain 'lower' operation",{
    # GIVEN
    operations <- Boundary.Broker()

    # THEN
    operations[['lower']] |> expect.exist()
  })
})

describe("Given input |> operation[['upper']]()",{
  it("then an upper boundary should be returned",{
    # GIVEN
    quartile <- Quartile.Broker() |> Quartile.Service()
    range    <- IQR.Broker()      |> IQR.Service() |> IQR.Processor()
    skewness <- Skewness.Broker() |> Skewness.Service()
    scale    <- Scaling.Broker()  |> Scaling.Service()

    operation <- Boundary.Broker()
    input   <- 1000 |> rnorm(10,5)

    # When
    expected.boundary <- 
      (input |> quartile[['third']]()) + 1.5 * 
      (input |> range[['IQR']]()) * 
      (input |> skewness[['medcouple']]() |> scale[['upper']]()) 

    actual.boundary <- input |> operation[['upper']]()

    # THEN
    actual.boundary |> expect.equal(expected.boundary)
  })
})

describe("Given input |> operation[['lower']]()",{
  it("then a lower boundary should be returned",{
    # GIVEN
    quartile <- Quartile.Broker() |> Quartile.Service()
    range    <- IQR.Broker()      |> IQR.Service() |> IQR.Processor()
    skewness <- Skewness.Broker() |> Skewness.Service()
    scale    <- Scaling.Broker()  |> Scaling.Service()

    operation <- Boundary.Broker()
    input   <- 1000 |> rnorm(10,5)

    # WHEN
    expected.boundary <- 
      (input |> quartile[['first']]()) - 1.5 * 
      (input |> range[['IQR']]()) * 
      (input |> skewness[['medcouple']]() |> scale[['lower']]()) 

    actual.boundary <- input |> operation[['lower']]()

    # THEN
    actual.boundary |> expect.equal(expected.boundary)
  })
})