describe("Given Adapter.Server", {
  it("Exist",{
    Adapter.Service |> expect.exist()
  })
})

describe("Given services <- Adapter.Service()",{
  it("then services is a list",{
    # GIVEN
    services <- Adapter.Service()

    # THEN
    services |> expect.list()
  })
  it("then services contains 'extract.sample' service", {
    # GIVEN
    services <- Adapter.Service()

    # THEN
    services[['extract.sample']] |> expect.exist()
  })
})

describe("Given input |> service[['extract.sample']](column)",{
  it("then sample input is returned based on specified column in data data.frame",{
    # GIVEN
    service <- Adapter.Broker() |> Adapter.Service()

    # WHEN
    data   <- data.frame(a = 1:5, b = 6:10)
    column <- 'a'

    actual <- data |> service[['extract.sample']](column)

    # THEN
    expected <- data[[column]]
    actual |> expect.equal(expected)
  })
  it("then an exception is thrown if input is NULL",{
    # GIVEN
    service <- Adapter.Broker() |> Adapter.Service()

    # WHEN
    input   <- NULL
    column <- 'c'

    # THEN
    error.message <- "Argument.NULL: 'input' cannot be NULL."
    input |> service[['extract.sample']](column) |> expect.error(error.message)
  })
  it("then an exception is thrown if column is NULL", {
    # GIVEN
    service <- Adapter.Broker() |> Adapter.Service()

    # WHEN
    input  <- data.frame(a = 1:5, b = 6:10)
    column <- NULL

    # THEN
    error.message <- "Argument.NULL: 'input' cannot be NULL."
    input |> service[['extract.sample']](column) |> expect.error(error.message)
  })
})