describe("Given Adapter.Broker", {
  it("Exist",{
    Adapter.Broker |> expect.exist()
  })
})

describe("Given adaptations <- Adapter.Broker()",{
  it("then adaptations is a list",{
    # GIVEN
    adaptations <- Adapter.Broker()

    # THEN
    adaptations |> expect.list()
  })
   it("then adaptations contain 'extract.sample' adaptation",{
    # GIVEN
    adaptations <- Adapter.Broker()

    # THEN
    adaptations[['extract.sample']] |> expect.exist()
  })
})

describe("Given data |> adaptation[['extract.sample']]()",{
  it("then sample data is returned based on specified column in data data.frame",{
    # GIVEN
    adaptations <- Adapter.Broker()

    # WHEN
    data   <- data.frame(a = 1:5, b = 6:10)
    column <- 'a'

    actual <- data |> adaptations[['extract.sample']](column)

    # THEN
    expected <- data[[column]]
    actual |> expect.equal(expected)
  })
})