describe("Given Boundary.Validator",{
  it("exist",{
    Boundary.Validator |> expect.exist()
  })
})

describe("When validators <- Boundary.Validator()",{
  it("then validators is a list",{
    # GIVEN
    validators <- Boundary.Validator()

    # THEN
    validators |> expect.list()
  })
  it("then validators contains 'sample'",{
    # GIVEN
    validators <- Boundary.Validator()

    # THEN
    validators[['sample']] |> expect.exist()
  })
  it("then validators contains 'exist'",{
    # GIVEN
    validators <- Boundary.Validator()

    # THEN
    validators[['exist']] |> expect.exist()
  })
  it("then validators contains 'is.numeric'",{
    # GIVEN
    validators <- Boundary.Validator()

    # THEN
    validators[['is.numeric']] |> expect.exist()
  })
})

describe("When input |> validator[['sample']]()",{
  it("then no exception is thrown when input exist and is numeric",{
    # GIVEN
    validator <- Boundary.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validator[['sample']]() |> expect.no.error()
  })
  it("then an exception is thrown when input exists",{
    # GIVEN
    validator <- Boundary.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL."

    input |> validator[['sample']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    validator <- Boundary.Validator()

    # WHEN
    input <- 'a'

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> validator[['sample']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['exist']]()",{
  it("then no exception is thrown when input is not NULL",{
    # GIVEN
    validator <- Boundary.Validator()

    # WHEN
    input <- ''

    # THEN
    input |> validator[['exist']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    validator <- Boundary.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"

    input |> validator[['exist']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['is.numeric']]()",{
  it("then no exception is thrown when input is numeric",{
    # GIVEN
    validator <- Boundary.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validator[['is.numeric']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    validator <- Boundary.Validator()

    # WHEN
    input <- 'a'

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> validator[['is.numeric']]() |> expect.error(error.message)
  })
})