describe("Given Scaling.Service", {
  it("exist",{
    Scaling.Service |> expect.exist()
  })
})

describe("Given services <- Scaling.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- Scaling.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contains 'upper' service",{
    # GIVEN
    services <- Scaling.Service()

    # THEN
    services[['upper']] |> expect.exist()
  })
  it("then services contains 'lower' service",{
    # GIVEN
    services <- Scaling.Service()

    # THEN
    services[['lower']] |> expect.exist()
  })
})

describe("When medcouple |> services[['upper']]()",{
  it("then exp(-4*medcouple) is returned if medcouple >= 0",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- 1

    # When
    actual.result <- medcouple |> service[['upper']]()

    # THEN
    expected.result <- exp(-4*medcouple)
    actual.result |> expect.equal(expected.result)
  })
  it("then exp(-3*medcouple) is returned if medcouple < 0",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- -1

    # When
    actual.result <- medcouple |> service[['upper']]()

    # THEN
    expected.result <- exp(-3*medcouple)
    actual.result |> expect.equal(expected.result)
  })
  it("then an exception should be thrown if input is NULL",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- NULL

    # THEN
    error.message <- "Argument.NULL: 'medcouple' cannot be NULL"
    medcouple |> service[['upper']]() |> expect.error(error.message)
  })
  it("then an exception should be thrown if input is not Numeric",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- ""

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."
    medcouple |> service[['upper']]() |> expect.error(error.message)
  })
})

describe("When medcouple |> services[['lower']]()",{
  it("then exp(3*medcouple) is returned if medcouple >= 0",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- 1

    # When
    actual.result <- medcouple |> service[['lower']]()

    # THEN
    expected.result <- exp(3*medcouple)
    actual.result |> expect.equal(expected.result)
  })
  it("then exp(4*medcouple) is returned if medcouple < 0",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- -1

    # When
    actual.result <- medcouple |> service[['lower']]()

    # THEN
    expected.result <- exp(4*medcouple)
    actual.result |> expect.equal(expected.result)
  })
  it("then an exception should be thrown if input is NULL",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- NULL

    # THEN
    error.message <- "Argument.NULL: 'medcouple' cannot be NULL"
    medcouple |> service[['lower']]() |> expect.error(error.message)
  })
  it("then an exception should be thrown if input is not Numeric",{
    # GIVEN
    service <- Scaling.Service()
    medcouple <- ""

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."
    medcouple |> service[['lower']]() |> expect.error(error.message)
  })
})