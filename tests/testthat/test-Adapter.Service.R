describe("Given Adapter.Server", {
  it("Exist",{
    Adapter.Service |> expect.exist()
  })
})

describe("Given services <- Adapter.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- Adapter.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contains 'extract.sample' service", {
    # GIVEN
    services <- Adapter.Service()

    # THEN
    services[['extract.sample']] |> expect.exist()
  })
})