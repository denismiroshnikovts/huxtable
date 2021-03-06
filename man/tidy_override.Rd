% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/huxreg.R
\name{tidy_override}
\alias{tidy_override}
\alias{tidy_replace}
\alias{tidy.tidy_override}
\alias{glance.tidy_override}
\alias{nobs.tidy_override}
\title{Change a model's \code{tidy} output}
\usage{
tidy_override(x, ..., glance = list(), extend = FALSE)

tidy_replace(x, tidied, glance = list())

\method{tidy}{tidy_override}(x, ...)

\method{glance}{tidy_override}(x, ...)

\method{nobs}{tidy_override}(object, ...)
}
\arguments{
\item{x}{A model with methods defined for \code{\link[generics:tidy]{generics::tidy()}} and/or \code{\link[generics:glance]{generics::glance()}}.}

\item{...}{In \code{tidy_override}, columns of statistics to replace \code{tidy} output. In
\code{tidy} and \code{glance} methods, arguments passed on to the underlying model.}

\item{glance}{A list of summary statistics for \code{glance}.}

\item{extend}{Logical: allow adding new columns to \code{tidy(x)}?}

\item{tidied}{Data frame to replace the result of \code{tidy(x)}.}

\item{object}{A \code{tidy_override} object.}
}
\value{
An object that can be passed in to \code{huxreg}.
}
\description{
Use \code{tidy_override} and \code{tidy_replace} to provide your own p values,
confidence intervals etc. for a model.
}
\details{
\code{tidy_override} allows you to replace some columns of \code{tidy(x)} with your own data.

\code{tidy_replace} allows you to replace the result of \code{tidy(x)} entirely.
}
\examples{
if (! requireNamespace("broom", quietly = TRUE)) {
  stop("Please install 'broom' to run this example.")
}

lm1 <- lm(mpg ~ cyl, mtcars)
fixed_lm1 <- tidy_override(lm1,
      p.value = c(.04, .12),
      glance = list(r.squared = 0.99))
huxreg(lm1, fixed_lm1)

if (requireNamespace("nnet", quietly = TRUE)) {
  mnl <- nnet::multinom(gear ~ mpg, mtcars)
  tidied <- broom::tidy(mnl)
  mnl4 <- tidy_replace(mnl, tidied[tidied$y.level == 4, ])
  mnl5 <- tidy_replace(mnl, tidied[tidied$y.level == 5, ])
  huxreg(mnl4, mnl5, statistics = "nobs")
}

}
