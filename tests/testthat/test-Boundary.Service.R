describe("Given Boundary.Service", {
  it("Exist",{
    Boundary.Service |> expect.exist()
  })
})

describe("Given services <- Boundary.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- Boundary.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contain 'upper' service",{
    # GIVEN
    services <- Boundary.Service()

    # THEN
    services[['upper']] |> expect.exist()
  })
  it("then services contain 'lower' service",{
    # GIVEN
    services <- Boundary.Service()

    # THEN
    services[['lower']] |> expect.exist()
  })
})

describe("Given input |> service[['upper']]()",{
  it("then an upper boundary should be returned",{
    # GIVEN
    quartile <- Quartile.Broker() |> Quartile.Service()
    range    <- IQR.Service()     |> IQR.Processor()
    skewness <- Skewness.Broker() |> Skewness.Service()
    scale    <- Scaling.Broker()  |> Scaling.Service()

    service <- Boundary.Service()
    input   <- 1000 |> rnorm(10,5)

    # When
    expected.boundary <- 
      (input |> quartile[['third']]()) + 1.5 * 
      (input |> range[['IQR']]()) * 
      (input |> skewness[['medcouple']]() |> scale[['upper']]()) 

    actual.boundary <- input |> service[['upper']]()

    # THEN
    actual.boundary |> expect.equal(expected.boundary)
  })
  it("then an exception is thrown when input is null",{
    # GIVEN
    service <- Boundary.Service()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"
    input |> service[['upper']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    service <- Boundary.Service()

    # When
    input <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'"
    input |> service[['upper']]() |> expect.error(error.message)
  })
})

describe("Given input |> service[['lower']]()",{
  it("then a lower boundary should be returned",{
    # GIVEN
    quartile <- Quartile.Broker() |> Quartile.Service()
    range    <- IQR.Service()     |> IQR.Processor()
    skewness <- Skewness.Broker() |> Skewness.Service()
    scale    <- Scaling.Broker()  |> Scaling.Service()

    service <- Boundary.Service()
    input   <- 1000 |> rnorm(10,5)

    # WHEN
    expected.boundary <- 
      (input |> quartile[['first']]()) - 1.5 * 
      (input |> range[['IQR']]()) * 
      (input |> skewness[['medcouple']]() |> scale[['lower']]()) 

    actual.boundary <- input |> service[['lower']]()

    # THEN
    actual.boundary |> expect.equal(expected.boundary)
  })
  it("then an exception is thrown when input is null",{
    # GIVEN
    service <- Boundary.Service()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"
    input |> service[['lower']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    service <- Boundary.Service()

    # WHEN
    input <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'"
    input |> service[['lower']]() |> expect.error(error.message)
  })
})