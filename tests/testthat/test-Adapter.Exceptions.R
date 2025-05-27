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

describe("When input |> exception[['type.mismatch']]()",{
  it("then no exception is thrown when input is FALSE",{
    # GIVEN
    exception <- Adapter.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['type.mismatch']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is TRUE",{
    # GIVEN
    exception <- Adapter.Exceptions()

    # WHEN
    input <- TRUE
    type  <- "character"

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> exception[['type.mismatch']](type) |> expect.error(error.message)
  })
})