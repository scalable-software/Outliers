describe("Given Skewness.Broker",{
  it("Exist",{
    Skewness.Broker |> expect.exist()
  })
})

describe("When operations <- Skewness.Broker()",{
  it("then operations is a list",{
    # GIVEN
    operations <- Skewness.Broker()

    # THEN
    operations |> expect.list()
  })
  it("then operations contains 'medcouple'",{
    # GIVEN
    operations <- Skewness.Broker()

    # THEN
    operations[['medcouple']] |> expect.exist()
  })
})

describe("When input |> operation[['medcouple']]()",{
  it("then the medcouple of the sample number are returned",{
    # GIVEN
    operation <- Skewness.Broker()

    input <- 1000 |> rnorm(10,5)

    output.expected <- input |> robustbase::mc()

    # WHEN
    output.actual <- input |> operation[['medcouple']]()
    
    # THEN
    output.actual |> expect.equal(output.expected)
  })
})