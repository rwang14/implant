\name{CI.trt.diff}
\alias{CI.trt.diff}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Constructing confidence regions for specific treatment effect
%%  ~~function to do ... ~~
}
\description{This is a special case of the function "CI.trt"
in this package. This function is easier to use when studying the difference between
two specific treatments/genotype, without specifying the linear combination needed in "CI.trt".
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
  \item{j1}{A positive integer, specifying the columns of the design matrix
  corresponding to one treatment of interest.
%%     ~~Describe \code{j1} here~~
}
  \item{j2}{A positive integer, specifying the columns of the design matrix
  corresponding to the other treatment of interest.
%%     ~~Describe \code{j2} here~~
}
  \item{alpha}{A positive small number between 0 and 1. 1-alpha gives the confidence level.
%%     ~~Describe \code{alpha} here~~
}
}
\details{For example, you model is constructed by b0(t)+b1(t)X1+b2(t)X2
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

\seealso{{ \code{\link{fanova_mean}}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#load the data
data_new = read.csv(system.file("extdata","data.csv",
                                 package = "implant", mustWork = TRUE))
#The first three columns of data_new refer to the original position of the observations from the
#original dataset, genotype and block, respectively
Y = data_new[,-c(1:3)]
#This step is to factorize each factor
Genotype = as.factor(data_new$Genotype)
Block = as.factor(data_new$Block)
X = data.frame(Genotype,Block)
formula = "~ Genotype+Block"
tt = seq(from = 0, to = 44,by = 2)
#fit anova
fit = fanova_mean(Y.na.mat = Y, X = X, tt = tt, formula, K.int = 6, order = 4, lower = -10, upper = 15)
ci_diff = CI.trt.diff(fit = fit,j1 = 5, j2 = 4, alpha = 0.05)
plot(tt,ci_diff$trt,type = "l")
lines(tt,ci_diff$lb, col = "blue")
lines(tt,ci_diff$ub, col = "blue")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
