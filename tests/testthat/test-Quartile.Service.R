describe("Given Quartile.Service",{
  it("exist",{
    Quartile.Service |> expect.exist()
  })
})

describe("When services <- Quartile.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- Quartile.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contains 'first'",{
    # GIVEN
    services <- Quartile.Service()

    # THEN
    services[['first']] |> expect.exist()
  })
  it("then services contains 'third'",{
    # GIVEN
    services <- Quartile.Service()

    # THEN
    services[['third']] |> expect.exist()
  })
})

describe("When input |> service[['first']]()",{
  it("then the first quartile of the input sample is returned",{
    # GIVEN
    quartile <- Quartile.Service()

    # WHEN
    input <- 1000 |> rnorm(10,5)

    # THEN
    quartile.first <- input |> quantile(0.25)

    input |> quartile[['first']]() |> expect.equal(quartile.first)
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    quartile <- Quartile.Service()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL."

    input |> quartile[['first']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    quartile <- Quartile.Service()

    # WHEN
    input <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> quartile[['first']]() |> expect.error(error.message)
  })
})

describe("When input |> service[['third']]()",{
  it("then the third quartile of the input sample is returned",{
    # GIVEN
    quartile <- Quartile.Service()

    # WHEN
    input <- 1000 |> rnorm(10,5)

    # THEN
    quartile.third <- input |> quantile(0.75)

    input |> quartile[['third']]() |> expect.equal(quartile.third)
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    quartile <- Quartile.Service()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL."

    input |> quartile[['third']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when data is not numeric",{
    # GIVEN
    quartile <- Quartile.Service()

    # WHEN
    input <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> quartile[['third']]() |> expect.error(error.message)
  })
})