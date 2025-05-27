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
  it("then exceptions contains 'argument.NULL' exception",{
    # GIVEN
    exceptions <- Adapter.Exceptions()

    # THEN
    exceptions[['argument.NULL']] |> expect.exist()
  })
  it("then exceptions contains 'type.mismatch' exception",{
    # GIVEN
    exceptions <- Adapter.Exceptions()

    # THEN
    exceptions[['type.mismatch']] |> expect.exist()
  })
  it("then exceptions contains 'column.invalid' exception",{
    # GIVEN
    exceptions <- Adapter.Exceptions()

    # THEN
    exceptions[['column.invalid']] |> expect.exist()
  })
})

describe("When input |> exception[['argument.NULL']]()",{
  it("then no exception is thrown when input is FALSE",{
    # GIVEN
    exception <- Adapter.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['argument.NULL']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is TRUE",{
    # GIVEN
    exception <- Adapter.Exceptions()

    # WHEN
    input <- TRUE
    name  <- "sample"

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL."

    input |> exception[['argument.NULL']](name) |> expect.error(error.message)
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

    actual   <- "boolean"
    expected <- "character"

    # THEN
    error.message <- "Type.Mismatch: Got 'boolean' but expected 'character'."

    input |> exception[['type.mismatch']](actual, expected) |> expect.error(error.message)
  })
})

describe("When input |> exception[['column.invalid']]()",{
  it("then no exception is thrown when input is FALSE",{
    # GIVEN
    exception <- Adapter.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['column.invalid']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is TRUE",{
    # GIVEN
    exception <- Adapter.Exceptions()

    # WHEN
    input <- TRUE

    column <- "invalid_column"

    # THEN
    error.message <- "Column.Invalid: Column name 'invalid_column' is invalid"

    input |> exception[['column.invalid']](column) |> expect.error(error.message)
  })
})