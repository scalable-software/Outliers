describe("GIVEN IQR.Broker",{
  it("exist",{
    IQR.Broker |> expect.exist()
  })
})

describe("When operations <- IQR.Broker()",{
  it("then operations is a list",{
    # GIVEN
    operations <- IQR.Broker()

    # THEN
    operations |> expect.list()
  })
  it("then operations contains 'IQR.from.quartiles' operation",{
    # GIVEN
    operations <- IQR.Broker()

    # THEN
    operations[['IQR.from.quartiles']] |> expect.exist()
  })
  it("then operations contains 'IQR.from.sample' operations",{
    # GIVEN
    operations <- IQR.Broker()

    # THEN
    operations[['IQR.from.sample']] |> expect.exist()
  })
})

describe("WHEN input |> operation[['IQR.from.quartiles']]()",{
  it("then the IQR is returned if input is a list with first and third",{
    # GIVEN
    operation <- IQR.Broker()

    quartile <- Quartile.Broker() |> Quartile.Service()
    sample <- 1000 |> rnorm(10,5)

    quartiles <- list()
    quartiles[['first']] <- sample |> quartile[['first']]()
    quartiles[['third']] <- sample |> quartile[['third']]()

    # WHEN
    actual.IQR <- quartiles |> operation[['IQR.from.quartiles']]()

    # THEN
    expected.IQR <- (quartiles[['third']] - quartiles[['first']])
    actual.IQR |> expect.equal(expected.IQR)
  })
})

describe("When input |> operation[['IQR.from.sample']]()",{
  it("then the IQR is returned if input is numeric",{
    # GIVEN
    operation  <- IQR.Broker()
    quartile <- Quartile.Broker() |> Quartile.Service()

    input <- 1000 |> rnorm(10,5)
    
    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    # WHEN
    actual.IQR <- input |> operation[['IQR.from.sample']]()

    # THEN
    expected.IQR <- (quartiles[['third']] - quartiles[['first']])
    actual.IQR |> expect.equal(expected.IQR)
  })
})