% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Scaling.Exceptions.R
\name{Scaling.Exceptions}
\alias{Scaling.Exceptions}
\title{Scaling Exceptions}
\value{
A \code{list} of exceptions:
\itemize{
\item \code{argument.NULL()}
\item \code{type.mismatch()}
}
}
\description{
\code{Scaling.Exceptions()} is an internal function that returns a set of exceptions used by \code{Scaling.Validation()} service.
\itemize{
\item The first exception: \code{argument.NULL}, indicates to the user that no sample data have to provided for analysis.
\item The second exception: \code{type.mismatch}, indicates to the user that the sample data provided is not numerical data.
}
}
