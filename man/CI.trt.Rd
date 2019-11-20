\name{CI.trt}
\alias{CI.trt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Estimating a linear combination of treatment effects and obtaining its confidence regions
%%  ~~function to do ... ~~
}
\description{This function is used for estimating a linear combination of treatment effects and its confidence regions.
Moreover, it can be used to test the coefficient of the difference between two treatments.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
CI.trt(fit,L,alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fit}{An object of output obtained by function "fanova_mean".
}
  \item{L}{A numeric contrast vector which specifies the linear combination of the parameters of interest.
%%     ~~Describe \code{x} here~~
}
\item{alpha}{ A positive small number, which is the probability of making type I error. e.g., if you want to calculate
the 0.95 confidence band, take alpha = 0.05.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{trt}{
A t by 1 vector which includes the estimated mean of the treatment mean at different observation time points.
}
\item{ub}{
A t by 1 vector which indicates the upper bound of the (1-alpha) confidence band at different time points.
}
\item{lb}{A t by 1 vector which indicates the lower bound of the (1-alpha) confidence band at different time points.
}
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
fit = fanova_mean(Y.na.mat = Y.na.mat, X = X,
                  tt = seq(from = 0, to = 44, by = 2),
                  formula = toString("~ X[,1]+X[,2]"),
                  K.int = 6, order = 4,
                  d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15)
L1 = c(1,0,0,1/3,1/3)
ci1 = CI.trt(fit = fit, L = L1, alpha = 0.05)
plot(tt,ci1$trt,type = "l")
lines(tt,ci1$lb, col = "blue")
lines(tt,ci1$ub, col = "blue")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
