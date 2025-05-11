describe("Given Outlier.Warnings", {
  it("Exist",{
    # GIVEN
    Outlier.Warnings |> expect.exist()
  })
})

describe("When warnings <- Outlier.Warnings()",{
  it("then warnings is a list",{
    # GIVEN
    warnings <- Outlier.Warnings()

    # THEN
    warnings |> expect.list()
  })
  it("then warnings contains 'out.of.range' warning",{
    # GIVEN
    warnings <- Outlier.Warnings()

    # THEN
    warnings[['out.of.range']] |> expect.exist()
  })
})

describe("When input |> warning[['out.of.range']]()",{
  it("then no warning is thrown when input is FALSE",{
    # GIVEN
    warning <- Outlier.Warnings()

    # WHEN
    input <- FALSE

    # THEN
    input |> warning[['out.of.range']]() |> expect.no.warning()
  })
  it("then a warning is thrown when input is TRUE",{
    # GIVEN
    warning <- Outlier.Warnings()

    # WHEN
    input <- TRUE

    # THEN
    warning.message <- "medcouple is out of range: -0.6 > MC > 0.6"
    input |> warning[['out.of.range']]() |> expect.warning(warning.message)
  })
})