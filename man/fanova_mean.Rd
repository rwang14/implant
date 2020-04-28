\name{fanova_mean}
\alias{fanova_mean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fitting Functional ANOVA Models
%%  ~~function to do ... ~~
}
\description{This function is to fit fanova models by B-Spline basis expansion with a penalty term on the second derivative of the spline basis function. The penalty parameter, labmda, is chosen by GCV (generalized cross validation).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fanova_mean(Y.na.mat, X, tt, formula, K.int = 6,
            order = 4, lower = -10, upper = 15)
}

\arguments{
  \item{Y.na.mat}{an n by t matrix of response variable (the extracted features), where each row contains the time series data of an observation, and each column contains all the observations at a given time. Here n is the number of biological units of the study (for example, in the study of plant growth curve, n is the number of plants and t is the number of observation time points. Any missing observation is filled by "NA" in the matrix. For example, if a measurement of plant is missing for plant i on date j, the (i,j) component in Y.na.mat should be filled by "NA".
}

  \item{X}{an n by r dataframe or matrix of explanatory variables, where n is the number of observations and r is the number of explanatory variables.
}
  \item{tt}{a t by 1 vector, with the same length as the rows in Y.na.mat. Each element implies the observation date.
}
  \item{formula}{An object of class "formula", which specifies the model to use.
}
  \item{K.int}{A positive integer, which refers to the number of interior knots of the B-spline.
}
  \item{order}{A positive integer, which refers to the order of the B-spline. In default, order = 4, which implies that we use a cubic polynomial to connect each two adjacent knots.
%%     ~~Describe \code{order} here~~
}

  %\item{d0}{
%%     ~~Describe \code{d0} here~~
 %A non-negative integer. 0 if you want to evaluate the original basis function,
 %1 for the first derivative and 2 for the second derivatives of the basis function.
%}
  %\item{d1}{A non-negative integer. For the original function, use 2. For the second derivatives, use 4.
%%     ~~Describe \code{d1} here~~
%}
  %\item{d2}{A non-negative integer. For the original function, use 2. For the second derivatives, use 4.
%%     ~~Describe \code{d2} here~~
%}
  \item{lower}{Lower bound for the possible values of the smoothing parameter, lambda, used in GCV.
%%
}
  \item{upper}{Upper bound for the possible values of the smoothing parameter, lambda, used in GCV.
%%     ~~Describe \code{upper} here~~
}
}
\details{This function performs functional anova anlaysis. We use B-Spline as the basis function to expand the coefficient of each variable.

For example, the intercept term of a functional anova model, mu(t), will be expanded as

mu(t) = sum_\{j = 1 to K\}beta_\{mu,j\}B_\{u,j\}(t),

where beta_\{mu,j\} is the coefficient for B_\{u,j\}(t), and B_\{u,j\}(t) is an order u B-spline basis function. u is given by the argument "order" in this function. With another argument "K.int" (i.e., the number of interior knots) being defined, we can obtain K, the rank of spline expansion for mu(t), according to the relationship K = K.int + order.

%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{est_fun}{
A t by q matrix of the estimates of the functional parameters, where t is the number of observation time points, and q is the number of columns of the design matrix. The ijth element represents the estimated functional parameter of the jth variable of the design matrix at the ith observation time point.(i.e., bhat_j(t_i)).

For example, if your model includes two categorical variables without interaction terms, each categorical variable contains two levels. Your model will be: y(t) = b_0(t)+b_1(t)X1+b_2(t)X2+e(t). In this case, q = 3. This means your output "est_fun" will be constructed by 3 columns, and the columns repesent b_0hat(t), b_1hat(t) and b_2hat(t), respectively.
}
\item{bhat}{
A q by K numeric vector, in which contains all the estimated parameters (i.e., betahat), where q is the number of columns of the design matrix, and K is the rank of the spline expansion.
}
\item{lambda}{The estimated penalty parameter, obatined using GCV.
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
fit = fanova_mean(Y.na.mat = Y, X = X, tt = tt, formula,
                  K.int = 6, order = 4, lower = -10, upper = 15)
fit$est_fun
}
