\name{HighProbability-internal}
\alias{HighProbability-internal}
\alias{reject.null}
\title{ For programmers only. (Not to be called by the user.) }
\description{
  Indicates whether to reject null hypotheses based on p-values and significance levels.
}
\usage{
reject.null(.alpha, .pval)
}
\arguments{
  \item{.alpha}{ Vector of significance levels. }
  \item{.pval}{ Vector of p-values. }
}
\details{
  None.
}
\value{
  Return value is a matrix (.pval by rows and .alpha by columns), simplified to a vector if length(.alpha) == 1.
}
\references{ None. }
\author{ David R. Bickel (\email{bickel@prueba.info}, \url{davidbickel.com}) }
\note{ This function is global for compatibility with S-PLUS. }

\seealso{ This function is used by \code{\link{alternative.probable}} and \code{\link{alternative.beneficial}}. }

\keyword{ htest }
\keyword{ nonparametric }
