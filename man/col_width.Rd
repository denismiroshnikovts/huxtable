% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/properties-row-col.R
\name{col_width}
\alias{col_width}
\alias{col_width<-}
\alias{set_col_width}
\title{Set the width of table columns}
\usage{
col_width(ht)
col_width(ht) <- value
set_col_width(ht, col, value)
}
\arguments{
\item{ht}{A huxtable.}

\item{col}{A col specifier. See \link{rowspecs} for details.}

\item{value}{Numeric or character vector.. Set to \code{NA} to reset to the default,
which is \code{NA}.}
}
\value{
\code{col_width()} returns the \code{col_width} property.
\code{set_col_width()} returns the modified huxtable.
}
\description{
Numeric column widths are treated as proportions of the table width.
Character widths must be valid CSS or LaTeX dimensions.
}
\details{
In LaTeX, if you specify a column width, but set \code{wrap} to \code{FALSE} and have
cells which overrun, then you may have problems with table position and with
background colours in other cells. The workaround is to adjust the width, so
that your cells no longer overrun.
}
\examples{

col_width(jams) <-  c(.2, .8)
col_width(jams)
jams$Notes <- c("Notes",
      "This year's finest", "", "")
jams
set_col_width(jams, c(.4, .5, .1))
}
\seealso{
Other table measurements: 
\code{\link{height}()},
\code{\link{row_height}()},
\code{\link{width}()}
}
\concept{table measurements}
