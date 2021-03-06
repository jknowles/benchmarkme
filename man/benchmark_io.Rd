% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/benchmark_io.R
\name{benchmark_io}
\alias{benchmark_io}
\alias{bm_write_io}
\alias{bm_read_io}
\title{IO benchmarks}
\usage{
benchmark_io(runs = 3, size = c(5, 50, 200), tmpdir = tempdir(),
  verbose = TRUE, parallel = FALSE)

bm_write_io(runs = 3, size = 5, tmpdir = tempdir(), verbose = TRUE)

bm_read_io(runs = 3, size = 5, tmpdir = tempdir(), verbose = TRUE)
}
\arguments{
\item{runs}{Number of times to run the test. Default 3.}

\item{size}{a number specifying the approximate size of the generated csv. Must be one of
5,  50, 200.}

\item{tmpdir}{a non-empty character vector giving the directory name. Default \code{tempdir()}}

\item{verbose}{Default TRUE.}

\item{parallel}{default \code{NULL}. The default is single threaded performance.
An integer value greater than zero will use multiple cores.}
}
\description{
Benchmarking reading and writing a csv file (containing random numbers).
The tests are essentially \code{write.csv(x)} and \code{read.csv(...)} where \code{x} is a data frame.
Of \code{size}MB.
}
