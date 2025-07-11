![License: CC BY-NC-SA 4.0](https://flat.badgen.net/static/license/CC-BY-NC-SA-4.0/green)

# Outlier Detection Utility

Outliers are those samples which falls above the `upper` boundary or below the `lower` boundary where,
the `upper` boundary equals `1.5` times the `IQR` above the 75'th percentile and the `lower` boundary equals `1.5` times the `IQR` below the 25'th percentile. To support `outlier` detection in non-symmetrical distributions, the `medcouple` estimator is used when calculating the `upper` and `lower` boundaries.

> Medcouple, a robust concept and estimator of skewness.
> The medcouple is defined as a scaled median difference of the left and right half of the distribution,
> and hence not based on the third moment as the classical skewness

See [here](https://rstudio-pubs-static.s3.amazonaws.com/601843_7f35a3a2ece14fc8b52c65ffc013cdb8.html) for more details.

Two utilities are included in this package:

1. Extracting outliers from a data sample
2. Remove outliers from a data sample

## Installation

1. Use `devtools` to install the package from GitHub:

```r
devtools::install_github("scalable-software/Outliers")
```

## Use Case Examples

1. Extracting outliers from a data sample

```r
library(Outliers)
outliers <- 1000 |> rnorm(10,5) |> extract.outliers()
```

2. Remove outliers from a data sample

```r
library(Outliers)
clean <- 1000 |> rnorm(10,5) |> remove.outliers()
```
