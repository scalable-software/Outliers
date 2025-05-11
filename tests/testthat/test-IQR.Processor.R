describe("Given IQR.Processor",{
  it("exist",{
    # GIVEN
    IQR.Processor |> expect.exist()
  })
})

describe("When processors <- IQR.Processor()",{
  it("then processors is a list",{
    # GIVEN
    processors <- IQR.Processor()

    # THEN
    processors |> expect.list()
  })
  it("then processors contains IQR processor",{
    # GIVEN
    processors <- IQR.Processor()

    # THEN
    processors[['IQR']] |> expect.exist()
  })
})

describe("When input |> processor[['IQR']]()",{
  it("then no exception is thrown if input is numeric",{
    # GIVEN
    processors <- IQR.Service() |> IQR.Processor()
    
    # When 
    input <- 1000 |> rnorm(10,5)

    # THEN
    input |> processors[['IQR']]() |> expect.no.error()
  })
  it("then the IQR is returned if input is numeric",{
    # GIVEN
    processors <- IQR.Service() |> IQR.Processor()

    quartile   <- Quartile.Broker() |> Quartile.Service()

    input <- 1000 |> rnorm(10,5)

    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    expected.IQR <- (quartiles[['third']] - quartiles[['first']])

    # When
    actual.IQR <- input |> processors[['IQR']]()

    # THEN
    actual.IQR |> expect.equal(expected.IQR)
  })
  it("then no exception is thrown if input is a list",{
    # GIVEN
    processors <- IQR.Service() |> IQR.Processor()

    quartile   <- Quartile.Broker() |> Quartile.Service()

    input <- 1000 |> rnorm(10,5)

    # When
    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    # THEN
    quartiles |> processors[['IQR']]() |> expect.no.error()
  })
  it("then the IQR is returned if input is a list with first and third quartile",{
    # GIVEN
    processors <- IQR.Service() |> IQR.Processor()

    quartile   <- Quartile.Broker() |> Quartile.Service()

    input <- 1000 |> rnorm(10,5)

    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    expected.IQR <- (quartiles[['third']] - quartiles[['first']])

    # When
    actual.IQR <- quartiles |> processors[['IQR']]()

    # THEN
    actual.IQR |> expect.equal(expected.IQR)
  })
})