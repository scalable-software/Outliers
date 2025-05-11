describe("Given Scaling.Broker", {
  it("exist",{
    Scaling.Broker |> expect.exist()
  })
})

describe("Given operations <- Scaling.Broker()",{
  it("then operations is a list",{
    # GIVEN
    operations <- Scaling.Broker()

    # THEN
    operations |> expect.list()
  })
  it("then operations contains 'upper' operation",{
    # GIVEN
    operations <- Scaling.Broker()

    # THEN
    operations[['upper']] |> expect.exist()
  })
  it("then operations contains 'lower' operation",{
    # GIVEN
    operations <- Scaling.Broker()

    # THEN
    operations[['lower']] |> expect.exist()
  })
})

describe("When medcouple |> operation[['upper']]()",{
  it("then exp(-4*medcouple) is returned if medcouple >= 0",{
    # GIVEN
    operation <- Scaling.Broker()
    medcouple <- 1

    # When
    actual.result <- medcouple |> operation[['upper']]()

    # THEN
    expected.result <- exp(-4*medcouple)
    actual.result |> expect.equal(expected.result)
  })
  it("then exp(-3*medcouple) is returned if medcouple < 0",{
    # GIVEN
    operation <- Scaling.Broker()
    medcouple <- -1

    # When
    actual.result <- medcouple |> operation[['upper']]()

    # THEN
    expected.result <- exp(-3*medcouple)
    actual.result |> expect.equal(expected.result)
  })
})

describe("When medcouple |> services[['lower']]()",{
  it("then exp(3*medcouple) is returned if medcouple >= 0",{
    # GIVEN
    service <- Scaling.Broker()
    medcouple <- 1

    # When
    actual.result <- medcouple |> service[['lower']]()

    # THEN
    expected.result <- exp(3*medcouple)
    actual.result |> expect.equal(expected.result)
  })
  it("then exp(4*medcouple) is returned if medcouple < 0",{
    # GIVEN
    service <- Scaling.Broker()
    medcouple <- -1

    # When
    actual.result <- medcouple |> service[['lower']]()

    # THEN
    expected.result <- exp(4*medcouple)
    actual.result |> expect.equal(expected.result)
  })
})