\name{alternative.probable}
\alias{alternative.probable}
\alias{alternative.beneficial}
\title{alternative.probable and alternative.beneficial}
\description{
  alternative.probable determines which alternative hypotheses have sufficiently high probability of truth. alternative.beneficial determines which alternative hypotheses should be rejected according to a decision-theoretic approach.
}
\usage{
alternative.probable(p.values, min.probability = 0.5, marginal.probability = NULL, plot.relative.gain = FALSE)
alternative.beneficial(p.values, cost.to.benefit = 1, marginal.probability = NULL, plot.relative.gain = FALSE)
}
\arguments{
  \item{p.values}{ A vector of p-values that have not been corrected for multiple comparisons. For example, p-values may be calculated from \code{wilcox.test} or \code{cor.test} for two groups, or from \code{lm} for multiple groups. Alternately, permutation-based p-values (achieved significance levels) may be calculated using \code{sample}. }
  \item{min.probability}{ The lowest posterior probability of an alternative hypothesis for it to be considered true. This probability is conditional on the p-value and thus on the test statistic used to generate the p-value. }
  \item{cost.to.benefit}{ The ratio of the cost of accepting a false alternative hypothesis to the benefit of accepting a true alternative hypothesis. For example, in a microarray study, one may specify the expense of follow up studies needed to investigate a gene that only seems to be differentially expressed, divided by the enonomic or other benefit of finding a gene that really is differentially expressed. }
  \item{marginal.probability}{ A known or estimated lower bound on the proportion of p-values that correspond to true alternative hypotheses. The default action is to estimate and print marginal.probability. Printing may be suppressed by supplying 0 or some other value. }
  \item{plot.relative.gain}{ If TRUE, the relative desirability will be plotted as a function of the significance level. }
}
\details{
  See the following references for details.
}
\value{
  These functions return a logical vector with the same length as p.values. If an element in the vector is TRUE, then the corresponding p-value is low enough to warrant considering its alternative hypothesis true. The vector returned indicates which null hypotheses are considered true and which are considered false, based either on belief (for alternative.probable) or decision (for alternative.beneficial).
}
\references{
Bickel, D. R. (2004) "HighProbability determines which alternative hypotheses are highly probable: Genomic applications include detection of differential gene expression," arXiv.org e-print ID math.PR/0402465, \url{http://arxiv.org/abs/math.PR/0402465}

Bickel, D. R. (2004) "Reliably determining which genes have a high posterior probability of differential expression: Which genes have high objective probabilities of differential expression?" arXiv.org e-print ID math.PR/0402460, \url{http://arxiv.org/abs/math.PR/0402460}

Updated references and documentation may be available through \url{http://www.davidbickel.com}.  }
\author{ David R. Bickel (\email{bickel@prueba.info}, \url{davidbickel.com}) }
\note{ These functions have been tested on both R and S-PLUS. }

\seealso{ \code{\link{t.test}}, \code{\link{wilcox.test}}, \code{\link{cor.test}}, \code{\link{lm}}, \code{\link{sample}} }
\examples{

n.variables <- 1000 # This could be the number of genes on a microarray.
n.individuals <- 5 # This could be the number of microarrays per group.
n.effects <- 100 # This is the number of alternative hypotheses that are true, e.g., number of genes differentially expressed.
x1 <- matrix(c(rnorm(n.effects * n.individuals, mean = 2, sd = 1), rnorm((n.variables - n.effects) * n.individuals, mean = 0, sd = 1)), nrow = n.variables, byrow = TRUE) # Observed data, e.g., logarithms of gene expression ratios, for group 1.
x2 <- matrix(rnorm(n.variables * n.individuals, mean = 0, sd = 1), nrow = n.variables, byrow = TRUE) # The same for group 2.
p.values <- numeric(n.variables)
for(i in 1:n.variables) p.values[i] <- t.test(x1[i, ], x2[i, ])$p.value
is.probable <- alternative.probable(p.values) # Selects which alternative hypotheses are probably true, e.g., which genes are probably differentially expressed.
c(sum(is.probable[1:100]), sum(is.probable[101:1000])) # Numbers of true and false calls of differential expression.
is.probable.95 <- alternative.probable(p.values, min.probability = .95) # To be at least 95% confident of any call of differential expression.
c(sum(is.probable.95[1:100]), sum(is.probable.95[101:1000])) # Smaller numbers of true and false calls of differential expression.
is.beneficial <- alternative.beneficial(p.values, cost.to.benefit = 1)
all.equal(is.beneficial, is.probable)

}

\keyword{ htest }
\keyword{ nonparametric }
