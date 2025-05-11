describe("Given Outlier.Service", {
  it("exist",{
    Outlier.Service |> expect.exist()
  })
})

describe("Given services <- Outlier.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- Outlier.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contains 'extract' service",{
    # GIVEN
    services <- Outlier.Service()

    # THEN
    services[['extract']] |> expect.exist()
  })
  it("then outlier.services contains 'remove' service",{
    # GIVEN
    services <- Outlier.Service()

    # THEN
    services[['remove']] |> expect.exist()
  })
})

describe("When input |> service[['extract']]()",{
  it("then the outlier in input should be returned",{
    # GIVEN
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    input    <- 1000 |> rnorm(10,5)

    # WHEN
    boundary.upper <- input |> boundary[['upper']]()
    boundary.lower <- input |> boundary[['lower']]()

    expected.outliers <- input[input < boundary.lower | input > boundary.upper]
    actual.outliers   <- input |> service[['extract']]()

    # THEN
    actual.outliers |> expect.equal(expected.outliers)
  })
  it("then an exception is thrown when input is NULL",{
    # GIVEN
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    
    # WHEN
    input   <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"
    input |> service[['extract']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    
    # WHEN
    input   <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."
    input |> service[['extract']]() |> expect.error(error.message)
  })
  it("then an exception should be thrown when medcouple is out of range",{
    # Given
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    set.seed(42)

    # When
    input <- skewed_data <- rgamma(1000, shape = 0.1, rate = 0.1)

    # Then
    warning.message <- 'medcouple is out of range: -0.6 > MC > 0.6'
    input |> service[['extract']]() |> expect.warning(warning.message)
  })
})

describe("When input |> service[['remove']]()",{
  it("then the outlier in input should be removed",{
    # GIVEN
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    input    <- 1000 |> rnorm(10,5)

    # WHEN
    boundary.upper <- input |> boundary[['upper']]()
    boundary.lower <- input |> boundary[['lower']]()

    expected.outliers <- input[input >= boundary.lower & input <= boundary.upper]
    actual.outliers   <- input |> service[['remove']]()

    # THEN
    actual.outliers |> expect.equal(expected.outliers)
  })
  it("then an exception is thrown when input is NULL",{
    # Given
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    
    # When
    input   <- NULL

    # Then
    error.message <- "Argument.NULL: 'sample' cannot be NULL"
    input |> service[['remove']]() |> expect.error(error.message)
  })
  it("then an exception is thrown when input is not numeric",{
    # GIVEN
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    
    # WHEN
    input   <- ''

    # THEN
    error.message <- "Type.Mismatch: Got 'character' but expected 'numeric'."
    input |> service[['remove']]() |> expect.error(error.message)
  })
  it("then an exception should be thrown when medcouple is out of range",{
    # GIVEN
    boundary <- Boundary.Service()
    service  <- boundary |> Outlier.Broker() |> Outlier.Service()
    set.seed(42)

    # WHEN
    input <- skewed_data <- rgamma(1000, shape = 0.1, rate = 0.1)

    # THEN
    warning.message <- 'medcouple is out of range: -0.6 > MC > 0.6'
    input |> service[['remove']]() |> expect.warning(warning.message)
  })
})