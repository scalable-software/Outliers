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
  it("then validators contains 'is.data.frame' validator",{
    # GIVEN
    adapters <- Adapter.Validator()

    # THEN
    adapters[['is.data.frame']] |> expect.exist()
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
  it("then input should be returned if input is numeric",{
    # GIVEN
    validate <- Adapter.Validator()

    # WHEN
    input <- data.frame()

    # THEN
    input |> validate[['is.data.frame']]() |> expect.equal(input)
  })
})