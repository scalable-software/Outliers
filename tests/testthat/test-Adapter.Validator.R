describe("Given Adapter.Validator", {
  it("Exist",{
    Adapter.Validator |> expect.exist()
  })
})

describe("When validators <- Adapter.Validator()",{
  it("then it returns a list",{
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters |> expect.list()
  })
})