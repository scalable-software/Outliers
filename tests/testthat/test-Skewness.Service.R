describe("Given Skewness.Service",{
  it("Exist",{
    Skewness.Service |> expect.exist()
  })
})

describe("When services <- Skewness.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- Skewness.Broker() |> Skewness.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contains 'medcouple'",{
    # GIVEN
    services <- Skewness.Broker() |> Skewness.Service()

    # THEN
    services[['medcouple']] |> expect.exist()
  })
})

describe("When input |> service[['medcouple']]()",{
  it("then the medcouple of the sample number are returned",{
    # GIVEN
    service <- Skewness.Broker() |> Skewness.Service()

    input <- 1000 |> rnorm(10,5)

    output.expected <- input |> robustbase::mc()

    # WHEN
    output.actual <- input |> service[['medcouple']]()
    
    # THEN
    output.actual |> expect.equal(output.expected)
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    service <- Skewness.Broker() |> Skewness.Service()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL."
    input |> service[['medcouple']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    service <- Skewness.Broker() |> Skewness.Service()

    # WHEN
    input <- "a"

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."
    
    input |> service[['medcouple']]() |> expect.error(error.message)
  })
})