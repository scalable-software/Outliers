describe("Given Outlier.Validator", {
  it("Exist",{
    Outlier.Validator |> expect.exist()
  })
})

describe("When validators <- Outlier.Validator()",{
  it("then validators is a list",{
    # GIVEN
    validators <- Outlier.Validator()

    # THEN
    validators |> expect.list()
  })
  it("then validators contains 'sample' validator",{
    # GIVEN
    validators <- Outlier.Validator()

    # THEN
    validators[['sample']] |> expect.exist()
  })
  it("then validators contains 'exist' validator",{
    # GIVEN
    validators <- Outlier.Validator()

    # THEN
    validators[['exist']] |> expect.exist()
  })
   it("then validators contains 'is.numeric' validator",{
    # GIVEN
    validators <- Outlier.Validator()

    # THEN
    validators[['is.numeric']] |> expect.exist()
  })
  it("then outlier.validators contains 'is.medcouple.in.range' validator",{
    # GIVEN
    validators <- Outlier.Validator()

    # THEN
    validators[['is.medcouple.in.range']] |> expect.exist()
  })
})

describe("When input |> validate[['sample']]()",{
  it("then an exception should be thrown when input is null",{
    # GIVEN
    validate <- Outlier.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.massage <- "Argument.NULL: 'sample' cannot be NULL" 
    input |> validate[['sample']]() |> expect.error(error.massage) 
  })
  it("then an exception should be thrown when input is not numeric",{
    # GIVEN
    validate <- Outlier.Validator()

    # WHEN
    input <- ''

    # THEN
    error.massage <- "Type.Mismatch: Got 'character' but expected 'numeric'."
    input |> validate[['sample']]() |> expect.error(error.massage)
  })
  it("then an warning should be thrown when input is not in range",{
    # GIVEN
    validate <- Outlier.Validator()
    set.seed(42)

    # WHEN
    input <- skewed_data <- rgamma(1000, shape = 0.1, rate = 0.1)

    # THEN
    warning.massage <- 'medcouple is out of range: -0.6 > MC > 0.6'
    input |> validate[['sample']]() |> expect.warning(warning.massage)
  })

})

describe("When input |> validate[['exist']]()",{
  it("then an exception should be thrown when input is null",{
    # GIVEN
    validate <- Outlier.Validator()

    # WHEN
    input <- NULL

    # THEN
    error.massage <- "Argument.NULL: 'sample' cannot be NULL" 
    input |> validate[['exist']]() |> expect.error(error.massage) 
  })
  it("then no exception should be thrown when input is not null",{
    # GIVEN
    validate <- Outlier.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validate[['exist']]() |> expect.no.error()
  })
  it("then input should be returned if input is not null",{
    # Given
    validate <- Outlier.Validator()

    # When
    input <- 1

    # Then
    input |> validate[['exist']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.numeric']]()",{
  it("then an exception should be thrown when input is null",{
    # GIVEN
    validate <- Outlier.Validator()

    # WHEN
    input <- ''

    # THEN
    error.massage <- "Type.Mismatch: Got 'character' but expected 'numeric'."
    input |> validate[['is.numeric']]() |> expect.error(error.massage)
  })
  it("then no exception should be thrown when input is not null",{
    # GIVEN
    validate <- Outlier.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validate[['is.numeric']]() |> expect.no.error()
  })
  it("then input should be returned if input is numeric",{
    # GIVEN
    validate <- Outlier.Validator()

    # WHEN
    input <- 1

    # THEN
    input |> validate[['is.numeric']]() |> expect.equal(input)
  })
})

describe("When input |> validate[['is.medcouple.in.rage']]()",{
  it("then an exception should be thrown when medcouple is out of range",{
    # GIVEN
    validate <- Outlier.Validator()
    set.seed(42)

    # WHEN
    input <- skewed_data <- rgamma(1000, shape = 0.1, rate = 0.1)

    # THEN
    warning.massage <- 'medcouple is out of range: -0.6 > MC > 0.6'
    input |> validate[['is.medcouple.in.range']]() |> expect.warning(warning.massage)
  })
})