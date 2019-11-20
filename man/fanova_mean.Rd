\name{fanova_mean}
\alias{fanova_mean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fitting functional anova models
%%  ~~function to do ... ~~
}
\description{This function is used for fitting fanova models using B-Spline basis expansion.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fanova_mean(Y.na.mat, X, tt, formula,
            K.int = 6, order = 4,
            d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15)
}

\arguments{
  \item{Y.na.mat}{ A n by t matrix of response variable (the extracted features), where n is the number of observations (in general, plant ids), and t is the number of observation time points. If a measurement of an observed object is missing on a particular date, the value is filled by “NA” in the matrix.
}

  \item{X}{ A n by r matrix, where n is the number of observations and r is the number of explanatory variables.
}
  \item{tt}{ A t by 1 vector, in which elements implie the observation days.
}
  \item{formula}{An object of class "formula", which specifies the model to use.
}
  \item{K.int}{A positive integer, which refers to the number of interior knots.
}
  \item{order}{A positive integer, which refers to the order of the polynomial.
%%     ~~Describe \code{order} here~~
}

  \item{d0}{
%%     ~~Describe \code{d0} here~~
 A non-negative integer. 0 if you want to evaluate the original basis function,
 1 for the first derivative and 2 for the second derivatives of the basis function.
}
  \item{d1}{A non-negative integer. For the original function, use 2. For the second derivatives, use 4.
%%     ~~Describe \code{d1} here~~
}
  \item{d2}{A non-negative integer. For the original function, use 2. For the second derivatives, use 4.
%%     ~~Describe \code{d2} here~~
}
  \item{lower}{Lower bound of the possible values of the smoothing parameter, lambda.
%%
}
  \item{upper}{Upper bound of the possible values of the smoothing parameter, lambda.
%%     ~~Describe \code{upper} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{est_fun}{
A t by q matrix of the estimates, where t is the number of observation time points, and q is the number of columns of the design matrix. The ijth element represents the estimate of the jth variable of the design matrix at the ith observation time point.(i.e. beta.hat_j(t_i))
}
\item{bhat}{
A q by K numeric vector, in which contains all the estimated parameters (i.e., betahat), where q is the number of columns of the design matrix, and K is the rank of the spline expansion.
}
\item{lambda}{The estimated smoothing parameter.
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
fit = fanova_mean(Y.na.mat = Y, X = X,
                  tt = seq(from = 0, to = 44, by = 2),
                  formula = toString("~ X[,1]+X[,2]"),
                  K.int = 6, order = 4,
                  d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15)
para = fit$est_fun
mu.hat.t = para[,1]
}
