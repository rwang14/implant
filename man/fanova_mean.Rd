\name{fanova_mean}
\alias{fanova_mean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fitting Functional ANOVA Models
%%  ~~function to do ... ~~
}
\description{This function is used for fitting fanova models using B-Spline basis expansion. The model performed by this function is constructed by a general functional model plus a penalty term for the second derivative of the spline basis function. The estimated penalty parameter, labmda, can be obtained by GCV (generalized cross validation).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fanova_mean(Y.na.mat, X, tt, formula, K.int = 6,
            order = 4, lower = -10, upper = 15)
}

\arguments{
  \item{Y.na.mat}{ A n by t matrix of response variable (the extracted features), where n is the number of observations (for example, in the study of plant growth curve, each plant id would be an observation ), and t is the number of observation time points. In fact, the value of t should match the length of another argument shown below called "tt".

If a measurement of an observed object (e.g., the height of a plant) is missing on a particular date shown in tt, the value should be filled by “NA” in the Y.na.mat matrix. In a word, the ith row of this matrix represents the values of the response varable of the ith observation at t different observation time points.
}

  \item{X}{ A n by r dataframe of explanatory variables, where n is the number of observations and r is the number of explanatory variables.
}
  \item{tt}{ A t by 1 vector, in which elements imply the observation days.
}
  \item{formula}{An object of class "formula", which specifies the model to use.
}
  \item{K.int}{A positive integer, which refers to the number of interior knots.
}
  \item{order}{A positive integer, which refers to the order of the polynomial.
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
  \item{lower}{Lower bound of the possible values of the smoothing parameter, lambda.
%%
}
  \item{upper}{Upper bound of the possible values of the smoothing parameter, lambda.
%%     ~~Describe \code{upper} here~~
}
}
\details{This function can help users perform functional anova models, by assuming that each variable is a continuous function
( in general, a function of time t). We use B-Spline as the basis function to expand each variable.

For example, the intercept term of a functional anova model, mu(t), will be expanded as

mu(t) = Sigma_\{j = 1 to K\}beta_\{mu,j\}B_\{u,j\}(t),

where beta_\{mu,j\} is a coefficient and B_\{u,j\}(t) is an order u B-spline basis function. u is defined by the argument "order" in this function. With another argument "K.int" (i.e., the number of interior knots) being defined, we can know the value of K, the rank of spline expansion for mu(t), according to the relationship K = K.int + order.

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
data_new = read.csv(system.file("extdata", "data.csv",package = "implant", mustWork = TRUE))
#The first column records the positions of the observations from the original dataset, can be ignored
Y = data_new[,-c(1:3)]
#This step is to factorize each factor
X1 = as.factor(data_new$Genotype)
X2 = as.factor(data_new$Block)
X = data.frame(X1,X2)
formula = "~ X[,1]+X[,2]"
tt = seq(from = 0, to = 44, by = 2)
fit = fanova_mean(Y.na.mat = Y, X = X, tt = tt, formula, K.int = 6, order = 4, lower = -10, upper = 15)
fit$lambda
fit$est_fun
}
