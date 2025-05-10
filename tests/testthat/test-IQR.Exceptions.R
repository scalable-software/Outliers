describe("Given IQR.Exceptions",{
  it("exist",{
    # GIVEN
    IQR.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- IQR.Exceptions()",{
  it("then exception is a list",{
    # GIVEN
    exceptions <- IQR.Exceptions()

    # THEN
    exceptions |> expect.exist()
  })
  it("then exceptions contains 'argument.NULL' exception",{
    # GIVEN
    exceptions <- IQR.Exceptions()

    # THEN
    exceptions[['argument.NULL']] |> expect.exist()
  })
  it("then exceptions contains 'type.mismatch' exception",{
    # GIVEN
    exceptions <- IQR.Exceptions()

    # THEN
    exceptions[['type.mismatch']] |> expect.exist()
  })
  it("then exceptions contains 'property.missing' exception",{
    # GIVEN
    exceptions <- IQR.Exceptions()

    # THEN
    exceptions[['property.missing']] |> expect.exist()
  })
})

describe("When input |> exception[['argument.NULL']]()",{
  it("then no exception is thrown if input is FALSE",{
    # GIVEN
    exception <- IQR.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['argument.NULL']]() |> expect.no.error()
  })
  it("then argument.NULL exception is thrown if input is TRUE",{
    # GIVEN
    exception <- IQR.Exceptions()

    # WHEN
    input <- TRUE
    argument <- "sample"

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"
    input |> exception[['argument.NULL']](argument) |> expect.error(error.message)
  })
})

describe("When input |> exception[['type.mismatch']]()",{
  it("then no exception is thrown if input is FALSE",{
    # GIVEN
    exception <- IQR.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['type.mismatch']]() |> expect.no.error()
  })
  it("then type.mismatch exception is thrown if input is TRUE",{
    # GIVEN
    exception <- IQR.Exceptions()

    # WHEN
    input <- TRUE
    actual  <- "character"
    expected <- "numeric"

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> exception[['type.mismatch']](actual, expected) |> expect.error(error.message)
  })
})

describe("When input |> exception[['property.missing']]()",{
  it("then no exception is thrown if input is FALSE",{
    # GIVEN
    exception <- IQR.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exception[['property.missing']]() |> expect.no.error()
  })
  it("then property.missing exception is thrown if input is TRUE",{
    # GIVEN
    exception <- IQR.Exceptions()

    # WHEN
    input <- TRUE
    property <- "first"

    # THEN
    error.message <- "Property.Missing: 'first'."
    input |> exception[['property.missing']](property) |> expect_error(error.message)
  })
})
