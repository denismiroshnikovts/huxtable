% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/properties-cell.R
\name{markdown}
\alias{markdown}
\alias{markdown<-}
\alias{set_markdown}
\alias{map_markdown}
\title{Format cell content as markdown}
\usage{
markdown(ht)
markdown(ht) <- value
set_markdown(ht, row, col, value = TRUE)
map_markdown(ht, row, col, fn)
}
\arguments{
\item{ht}{A huxtable.}

\item{row}{A row specifier. See \link{rowspecs} for details.}

\item{col}{An optional column specifier.}

\item{fn}{A mapping function. See \link{mapping-functions} for details.}

\item{value}{A logical vector or matrix.

Set to \code{NA} to reset to the default, which is \code{FALSE}.}
}
\value{
\code{markdown()} returns the \code{markdown} property.
\code{set_markdown()} returns the modified huxtable.
}
\description{
Cells where the markdown property is \code{TRUE} will be rendered as
\href{https://commonmark.org/help/}{markdown}.
}
\details{
Markdown is currently implemented for HTML, Word, Powerpoint, RTF, LaTeX and
on-screen display. Word requires the \code{ftExtra} package.

Most formats use \href{https://commonmark.org}{commonmark}, with the
"strikethrough" extension enabled.

The following features are intended to work:
\itemize{
\item bold and italic text
\item strikethrough (write \verb{~~text~~} to strike through text).
\item hyperlinks
}

There are some quirks:
\itemize{
\item Paragraph-level properties (e.g. lists) won't work in Word.
\item Strikethrough will probably not work in Word.
\item To make lists work in LaTeX, set \code{\link[=width]{width()}} and ensure \code{\link[=wrap]{wrap()}} is \code{TRUE}.
\item Inline images in RTF work using the INCLUDEPICTURE field type.
}

If you try to use markdown tables, then seek psychiatric help.
}
\examples{

jams[3, 2] <- "~2.10~ **Sale!** 1.50"
set_markdown(jams, 3, 2)

}
\seealso{
\code{\link[=set_markdown_contents]{set_markdown_contents()}}, a shortcut function.
}
