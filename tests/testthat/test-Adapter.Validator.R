describe("Given Adapter.Validator", {
  it("Exist",{
    Adapter.Validator |> expect.exist()
  })
})

describe("When validators <- Adapter.Validator()",{
  it("then a list of validators is returned",{
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters |> expect.list()
  })
  it("then validators contains 'exist' validator", {
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters[['exist']] |> expect.exist()
  })
  it("then validators contains 'is.data.frame' validator",{
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters[['is.data.frame']] |> expect.exist()
  })
  it("then validators contains 'is.valid.column' validator",{
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters[['is.valid.column']] |> expect.exist()
  })
})

describe("When input |> validate[['is.data.frame']]()",{
  it("then an exception should be thrown when input is not a data.frame",{
    # GIVEN
    validate <- Adapter.Validator()

    # WHEN
    input <- ''

    # THEN
    error.massage <- "Type.Mismatch: Got 'character' but expected 'data.frame'."
    input |> validate[['is.data.frame']]() |> expect.error(error.massage)
  })
  it("then no exception should be thrown when input is a data.frame",{
    # GIVEN
    validate <- Adapter.Validator()

    # WHEN
    input <- data.frame()

    # THEN
    input |> validate[['is.data.frame']]() |> expect.no.error()
  })
  it("then input should be returned if input is data.frame",{
    # GIVEN
    validate <- Adapter.Validator()

    # WHEN
    input <- data.frame()

    # THEN
    input |> validate[['is.data.frame']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.valid.column']](column)",{
  it("then an exception is thrown when input data.frame has no matching column",{
    # GIVEN
    validate <- Adapter.Validator()

    # WHEN
    input <- data.frame(a = 1:3, b = 4:6)
    column <- 'c'

    # THEN
    expected.error.message <- "Column.Invalid: Column name 'c' is invalid"
    input |> validate[['is.valid.column']](column) |> expect.error(expected.error.message)
  })
  it("then no exception is thrown when input data.frame has matching column",{
    # GIVEN
    validate <- Adapter.Validator()

    # WHEN
    input <- data.frame(a = 1:3, b = 4:6)
    column <- 'a'

    # THEN
    input |> validate[['is.valid.column']](column) |> expect.no.error()
  })
  it("then input is returned when input data.frame has matching column",{
    # GIVEN
    validate <- Adapter.Validator()

    # WHEN
    input <- data.frame(a = 1:3, b = 4:6)
    column <- 'a'

    # THEN
    input |> validate[['is.valid.column']](column) |> expect.equal(input)
  })
})