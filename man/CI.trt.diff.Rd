\name{CI.trt.diff}
\alias{CI.trt.diff}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Testing the significance of the treatment effects of interest by
constructing the corresponding confidence regions.
%%  ~~function to do ... ~~
}
\description{This function can be used for testing the significance of the treatment effects of interest by
constructing the corresponding confidence regions. In fact, it is a special case of the function "CI.trt"
in this package. This function is more efficient and more easy to use when testing the difference between
two treatments.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
CI.trt.diff(fit, j1, j2, alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fit}{An object of output obtained by function "fanova_mean".
%%     ~~Describe \code{fit} here~~
}
  \item{j1}{A positive integer, which indicates the columns of the design matrix
  corresponding to the treatment of interest.
%%     ~~Describe \code{j1} here~~
}
  \item{j2}{A positive integer, which indicates the columns of the design matrix
  corresponding to the treatment of interest.
%%     ~~Describe \code{j2} here~~
}
  \item{alpha}{A positive small number, which is the probability of making type I error. e.g., if you want to calculate
the 0.95 confidence band, take alpha = 0.05.
%%     ~~Describe \code{alpha} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
fit = fanova_mean(Y.na.mat = Y, X = X,
                  tt = seq(from = 0, to = 44, by = 2),
                  formula = toString("~ X[,1]+X[,2]"),
                  K.int = 6, order = 4,
                  d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15)

ci_diff = CI.trt(fit = fit,j1 = 5, j2 = 4, alpha = 0.05)
plot(tt,ci_diff$trt,type = "l")
lines(tt,ci_diff$lb, col = "blue")
lines(tt,ci_diff$ub, col = "blue")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
