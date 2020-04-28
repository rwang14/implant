\name{CI.trt}
\alias{CI.trt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Estimating a linear combination of treatment effects and obtaining its confidence regions in FANOVA
%%  ~~function to do ... ~~
}
\description{This function is used for estimating a linear combination of treatment effects and its confidence regions in functional data analysis.
Moreover, it can be used for testing the difference between two treatments.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
CI.trt(fit, L, alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fit}{an object of output obtained by function "fanova_mean".
}
  \item{L}{a numeric contrast vector corresponding to the design matrix in "fanova_mean", which specifies the linear combination of the parameters of interest.
%%     ~~Describe \code{x} here~~
}
\item{alpha}{a positive small number between 0 and 1. 1-alpha gives the confidence level.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{trt}{
a t by 1 vector giving the estimated linear combination of coefficients at t observation time points.
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

\seealso{\code{\link{fanova_mean}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#load the data
data_new = read.csv(system.file("extdata","data.csv",
                                 package = "implant", mustWork = TRUE))
Y = data_new[,-c(1:3)]
#This step is to factorize each factor
X1 = as.factor(data_new$Genotype)
X2 = as.factor(data_new$Block)
X = data.frame(X1,X2)
formula = "~ X[,1]+X[,2]"
tt = seq(from = 0, to = 44, by = 2)
fit = fanova_mean(Y.na.mat = Y, X = X,
                  tt = tt,
                  formula = formula,
                  K.int = 6, order = 4)
L1 = c(1,0,0,1/3,1/3)
ci1 = CI.trt(fit = fit, L = L1, alpha = 0.05)
plot(tt,ci1$trt,type = "l")
lines(tt,ci1$lb, col = "blue")
lines(tt,ci1$ub, col = "blue")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
