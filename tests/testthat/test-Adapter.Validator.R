describe("Given Adapter.Validator", {
  it("Exist",{
    Adapter.Validator |> expect.exist()
  })
})

describe("When validators <- Adapter.Validator()",{
  it("then a list of validators is returned",{
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters |> expect.list()
  })
  it("then validators contains 'is.data.frame' validator",{
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters[['is.data.frame']] |> expect.exist()
  })
})