describe("Given Adapter.Broker", {
  it("Exist",{
    Adapter.Broker |> expect.exist()
  })
})

describe("Given operations <- Adapter.Broker()",{
  it("then operations is a list",{
    # GIVEN
    operations <- Adapter.Broker()

    # THEN
    operations |> expect.list()
  })
})