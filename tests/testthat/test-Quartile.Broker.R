describe("Given Quartile.Broker",{
  it("exist",{
    Quartile.Broker |> expect.exist()
  })
})

describe("When operations <- Quartile.Broker()",{
  it("then operations is a list",{
    # GIVEN
    operations <- Quartile.Broker()

    # THEN
    operations |> expect.list()
  })
  it("then operations contains 'first'",{
    # GIVEN
    operations <- Quartile.Broker()

    # THEN
    operations[['first']] |> expect.exist()
  })
  it("then services contains 'third'",{
    # GIVEN
    operations <- Quartile.Broker()

    # THEN
    operations[['third']] |> expect.exist()
  })
})

describe("When input |> operation[['first']]()",{
  it("then the first quartile of the input sample is returned",{
    # GIVEN
    operation <- Quartile.Broker()

    # WHEN
    input <- 1000 |> rnorm(10,5)

    # THEN
    quartile.first <- input |> quantile(0.25)

    input |> operation[['first']]() |> expect.equal(quartile.first)
  })
})

describe("When input |> operation[['third']]()",{
  it("then the third quartile of the input sample is returned",{
    # GIVEN
    operation <- Quartile.Broker()

    # WHEN
    input <- 1000 |> rnorm(10,5)

    # THEN
    quartile.third <- input |> quantile(0.75)

    input |> operation[['third']]() |> expect.equal(quartile.third)
  })
})