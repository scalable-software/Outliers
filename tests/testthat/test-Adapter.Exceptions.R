describe("Given Adapter.Exceptions", {
  it("Exist",{
    Adapter.Exceptions |> expect.exist()
  })
})

describe("Given exceptions <- Adapter.Exceptions()", {
  it("then exceptions is a list",{
    # GIVEN
    exceptions <- Adapter.Exceptions()

    # THEN
    exceptions |> expect.list()
  })
  it("then exceptions contains 'type.mismatch' exception",{
    # GIVEN
    exceptions <- Adapter.Exceptions()

    # THEN
    exceptions[['type.mismatch']] |> expect.exist()
  })
})