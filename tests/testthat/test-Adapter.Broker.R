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