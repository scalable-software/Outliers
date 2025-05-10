describe("Given Scaling.Validator",{
  it("exist",{
    Scaling.Validator |> expect.exist()
  })
})

describe("When validators <- Scaling.Validator()",{
  it("then validators is a list",{
    # GIVEN
    validators <- Scaling.Validator()

    # THEN
    validators |> expect.list()
  })
  it("then validators contains 'medcouple'",{
    # GIVEN
    validators <- Scaling.Validator()

    # THEN
    validators[['medcouple']] |> expect.exist()
  })
  it("then validators contains 'exist'",{
    # GIVEN
    validators <- Scaling.Validator()

    # THEN
    validators[['exist']] |> expect.exist()
  })
  it("then validators contains 'is.numeric'",{
    # GIVEN
    validators <- Scaling.Validator()

    # THEN
    validators[['is.numeric']] |> expect.exist()
  })
})

describe("When input |> validator[['medcouple']]()",{
  it("then no exception is thrown when input exist and is numeric",{
    # GIVEN
    validator <- Scaling.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validator[['medcouple']]() |> expect.no.error()
  })
  it("then an exception is thrown when input exists",{
    # GIVEN
    validator <- Scaling.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'medcouple' cannot be NULL."

    input |> validator[['medcouple']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    validator <- Scaling.Validator()

    # WHEN
    input <- 'a'

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> validator[['medcouple']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['exist']]()",{
  it("then no exception is thrown when input is not NULL",{
    # GIVEN
    validator <- Scaling.Validator()

    # WHEN
    input <- ''

    # THEN
    input |> validator[['exist']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    validator <- Scaling.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'medcouple' cannot be NULL"

    input |> validator[['exist']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['is.numeric']]()",{
  it("then no exception is thrown when input is numeric",{
    # GIVEN
    validator <- Scaling.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validator[['is.numeric']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    validator <- Scaling.Validator()

    # WHEN
    input <- 'a'

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."

    input |> validator[['is.numeric']]() |> expect.error(error.message)
  })
})