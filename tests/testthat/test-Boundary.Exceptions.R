describe("Given Boundary.Exceptions",{
  it("exist",{
    Boundary.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Boundary.Exceptions()",{
  it("then exceptions is a list",{
    # GIVEN
    exceptions <- Boundary.Exceptions()

    # THEN
    exceptions |> expect.list()
  })
  it("then exceptions contains 'argument.NULL'",{
    # GIVEN
    exceptions <- Boundary.Exceptions()

    # THEN
    exceptions[['argument.NULL']] |> expect.exist()
  })
  it("then exceptions contains 'type.mismatch'",{
    # GIVEN
    exceptions <- Boundary.Exceptions()

    # THEN
    exceptions[['type.mismatch']] |> expect.exist()
  })
})

describe("When input |> exception[['argument.NULL']]()",{
  it("then no exception is thrown when input is FALSE",{
    # GIVEN
    exception <- Boundary.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['argument.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is TRUE",{
    # GIVEN
    exception <- Boundary.Exceptions()

    # WHEN
    input <- TRUE

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL."

    input |> exception[['argument.NULL']]() |> expect.error(error.message)
  })
})

describe("When input |> exception[['type.mismatch']]()",{
  it("then no exception is thrown when input is FALSE",{
    # GIVEN
    exception <- Boundary.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['type.mismatch']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is TRUE",{
    # GIVEN
    exception <- Boundary.Exceptions()

    # WHEN
    input <- TRUE
    type  <- "character"

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> exception[['type.mismatch']](type) |> expect.error(error.message)
  })
})