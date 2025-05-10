describe("GIVEN IQR.Validator",{
  it("exist",{
    IQR.Validator |> expect.exist()
  })
})

describe("When validators <- IQR.Validator()",{
  it("then validators is a list",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators |> expect.list()
  })
  it("then validators contains 'sample' validator",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators[['sample']] |> expect.exist()
  })
  it("then validators contains 'quartiles' validator",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators[['quartiles']] |> expect.exist()
  })
  it("then validators contains 'exist' validator",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators[['exist']] |> expect.exist()
  })
  it("then validators contains 'is.numeric' validator",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators[['is.numeric']] |> expect.exist()
  })
  it("then validators contains 'is.list' validator",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators[['is.list']] |> expect.exist()
  })
  it("then validators contains 'has.first.quartile' validator",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators[['has.first.quartile']] |> expect.exist()
  })
  it("then validators contains 'has.third.quartile' validator",{
    # GIVEN
    validators <- IQR.Validator()

    # THEN
    validators[['has.third.quartile']] |> expect.exist()
  })
})

describe("When input |> validator[['sample']]()",{
  it("then no exception is thrown when input is numeric",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validator[['sample']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"
    input |> validator[['sample']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'"
    input |> validator[['sample']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['quartiles']]()",{
  it("then no exception is thrown when input is list with first and third properties",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list(first = 1, third = 2)

    # THEN
    input |> validator[['quartiles']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'quartiles' cannot be NULL"
    input |> validator[['quartiles']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not a list",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'list'"
    input |> validator[['quartiles']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input does not have first property",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list(third = 2)

    # THEN
    error.message <- "Property.Missing: 'first'"
    input |> validator[['quartiles']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input does not have third property",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list(first = 1)

    # THEN
    error.message <- "Property.Missing: 'third'"
    input |> validator[['quartiles']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['exist']]()",{
  it("then no exception is thrown when input is not NULL",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- ''

    # THEN
    input |> validator[['exist']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- NULL
    argument <- "sample"

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"

    input |> validator[['exist']](argument) |> expect.error(error.message)
  })
})

describe("When input |> validator[['is.numeric']]()",{
  it("then no exception is thrown when input is number",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validator[['is.numeric']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is string",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'"
    input |> validator[['is.numeric']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['is.list']]()",{
  it("then no exception is thrown when input is list",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list()

    # THEN
    input |> validator[['is.list']]() |> expect.no.error()
  })
  it("then an exception is thrown when input is not a list",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- 8

    # THEN
    error.message <- "Type.Mismatch: Got 'numeric' but expected 'list'"
    input |> validator[['is.list']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['has.first.quartile']]()",{
  it("then no exception is thrown when input has first member",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list(first = 8)

    # THEN
    input |> validator[['has.first.quartile']]() |> expect.no.error()
  })
  it("then an exception is thrown when input has no first member",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list()

    # THEN
    error.message <- "Property.Missing: 'first'"
    input |> validator[['has.first.quartile']]() |> expect.error(error.message)
  })
})

describe("When input |> validator[['has.third.quartile']]()",{
  it("then no exception is thrown when input has third member",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list(third = 8)

    # THEN
    input |> validator[['has.third.quartile']]() |> expect.no.error()
  })
  it("then an exception is thrown when input has no third member",{
    # GIVEN
    validator <- IQR.Validator()

    # WHEN
    input <- list()

    # THEN
    error.message <- "Property.Missing: 'third'"
    input |> validator[['has.third.quartile']]() |> expect.error(error.message)
  })
})