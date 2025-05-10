describe("GIVEN IQR.Service",{
  it("exist",{
    IQR.Service |> expect.exist()
  })
})

describe("WHEN services <- IQR.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- IQR.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contains 'IQR.from.quartiles' service",{
    # GIVEN
    services <- IQR.Service()

    # THEN
    services[['IQR.from.quartiles']] |> expect.exist()
  })
  it("then services contains 'IQR.from.sample' service",{
    # GIVEN
    services <- IQR.Service()

    # THEN
    services[['IQR.from.sample']] |> expect.exist()
  })
})

describe("WHEN input |> service[['IQR.from.quartiles']]()",{
  it("then no exception is thrown if input is a list with first and third properties",{
    # GIVEN
    service <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # WHEN
    input <- list()
    input[['first']] <- data |> quartile[['first']]()
    input[['third']] <- data |> quartile[['third']]()

    # THEN
    input |> service[['IQR.from.quartiles']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is NULL", {
    # GIVEN
    service <- IQR.Service()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'quartiles' cannot be NULL"
    input |> service[['IQR.from.quartiles']]() |> expect_error(error.message)
  })
  it("then an exception is thrown if input has not first property",{
    # GIVEN
    service <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # WHEN
    input <- list()
    input[['third']] <- data |> quartile[['third']]()
  
    # THEN
    error.message <- "Property.Missing: 'first'."
    input |> service[['IQR.from.quartiles']]() |> expect.error(error.message)
  })
  it("then an exception is thrown if input is a list with no third",{
    # GIVEN
    service  <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # WHEN
    input <- list()
    input[['first']] <- data |> quartile[['first']]()
  
    # THEN
    error.message <- "Property.Missing: 'third'."
    input |> service[['IQR.from.quartiles']]() |> expect.error(error.message)
  })
  it("then an exception is thrown if input is a list with no first",{
    # GIVEN
    service  <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # WHEN
    input <- list()
    input[['third']] <- data |> quartile[['third']]()
  
    # THEN
    error.message <- "Property.Missing: 'first'."
    input |> service[['IQR.from.quartiles']]() |> expect.error(error.message)
  })
  it("then the IQR is returned if input is a list with first and third",{
    # GIVEN
    service <- IQR.Service()

    quartile <- Quartile.Service()
    sample <- 1000 |> rnorm(10,5)

    quartiles <- list()
    quartiles[['first']] <- sample |> quartile[['first']]()
    quartiles[['third']] <- sample |> quartile[['third']]()

    # WHEN
    actual.IQR <- quartiles |> service[['IQR.from.quartiles']]()

    # THEN
    expected.IQR <- (quartiles[['third']] - quartiles[['first']])
    actual.IQR |> expect.equal(expected.IQR)
  })
})

describe("WHEN input |> service[['IQR.from.sample']]()",{
  it("then no exception is thrown if input is numeric",{
    # GIVEN
    service <- IQR.Service()

    # WHEN
    input <- 1000 |> rnorm(10,5)

    # THEN
    input |> service[['IQR.from.sample']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is NULL",{
    # GIVEN
    service <- IQR.Service()

    # WHEN
    input <- NULL

    # THEN
    error.message <- "Argument.NULL: 'sample' cannot be NULL"
    input |> service[['IQR.from.sample']]() |> expect_error(error.message)
  })
  it("then an exception is thrown if input is no numeric",{
    # GIVEN
    service <- IQR.Service()

    # WHEN
    input <- list()

    # THEN
    error.message <- "Type.Mismatch: Got 'list' but expected 'numeric'."
    input |> service[['IQR.from.sample']]() |> expect.error(error.message)
  })
  it("then the IQR is returned if input is numeric",{
    # GIVEN
    service  <- IQR.Service()
    quartile <- Quartile.Service()

    input <- 1000 |> rnorm(10,5)
    
    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    # WHEN
    actual.IQR <- input |> service[['IQR.from.sample']]()

    # THEN
    expected.IQR <- (quartiles[['third']] - quartiles[['first']])
    actual.IQR |> expect.equal(expected.IQR)
  })
})