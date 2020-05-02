\name{fanova}
\alias{fanova}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fitting Functional ANOVA Models
%%  ~~function to do ... ~~
}
\description{This function is to fit Fanova models by B-Spline basis expansion with a penalty term on the second derivative of of the estimated functions for the smoothness of the curves. The penalty parameter, \eqn{\lambda}, is chosen by generalized cross validation (GCV).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fanova(Y.na.mat, X, tt, formula, K.int = 6,
            order = 4, d1 = 2, lower = -10, upper = 15)
}

\arguments{
  \item{Y.na.mat}{an n by t matrix of response variable (the extracted features), where each row contains the time series data of an observation, and each column contains all the observations at a given time. Here n is the number of biological units of the study (for example, in the study of plant growth curve, n is the number of plants and t is the number of observation time points. Any missing observation is filled by "NA" in the matrix. For example, if a measurement of plant is missing for plant i on date j, the (i, j) component in Y.na.mat should be filled by "NA".
}

  \item{X}{an n by r dataframe or matrix of explanatory variables, where n is the number of observations and r is the number of explanatory variables.
}
  \item{tt}{a t by 1 vector, with the same length as the rows in Y.na.mat. Each element implies the observation date.
}
  \item{formula}{an object of class "formula", which specifies the model to use.
}
  \item{K.int}{a positive integer, which refers to the number of interior knots of the B-spline.
}
  \item{order}{a positive integer, which refers to the order of the B-spline. In default, order = 4, which implies that we use a cubic polynomial to connect each two adjacent knots.
%%     ~~Describe \code{order} here~~
}
 \item{d1}{a non-negative integer, giving the order of the derivatives of the basis expansion function in the penalty matrix, \eqn{\Omega}. See the "detail"" part. In default, d1 = 2. Note that d1 should be smaller than the order of the basis function.
%%     ~~Describe \code{order} here~~
}
 \item{lower}{lower bound for the possible values of log (smoothing parameter), i.e., \eqn{log (\lambda)}, used in GCV.
%%
}
  \item{upper}{upper bound for the possible values of log (smoothing parameter), i.e., \eqn{log (\lambda)}, used in GCV.
%%     ~~Describe \code{upper} here~~
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
}
\details{Suppose the trait is potentially affected by \eqn{q} factors. Denote by \eqn{l_j}  the number of levels of the jth factor. We define \eqn{X_{ij} = (x_{ij2}, \ldots, x_{ijl_j})'} as the categorical indicators of the jth factor of the ith plant. Specifically,  \eqn{x_{ijk}} is set to one if the jth factor of the ith plant has level ``k"; otherwise, \eqn{x_{ijk} = 0}. In convenience, let \eqn{q = 2} in the help documentation.
%When $x_{ijk}$ are zeros for any $k$, it indicates the $j$th factor level of the $i$th plant is ``$1$".
Denote by \eqn{\otimes} the Kronecker product of matrices. A functional ANOVA model with interactions can be written in the following form:
%Assume that the response variable of our model is one of the phenotypical parameters, e.g., the size of a plant. Let \eqn{y_i(t)} be the size of the ith plant measured at time t, where \eqn{i = 1, \ldots, n} with n the number of plants studied. Suppose the mean of the response variable is influenced by q factors. For \eqn{i\in \{1, ..., n\}, \ j \in \{1, \ldots, q\}}, we define \eqn{{A}_{ij} = (A_{ijk})_{k=2}^{l_j}} as the categorical indicator of the jth factor of the ith plant, where \eqn{l_j} is the number of levels that the jth factor has. Specifically,  \eqn{A_{ijk}} is set to one if the jth factor of the ith plant has level ``k"; otherwise, \eqn{A_{ijk}=0}. When all \eqn{A_{ijk}} are zeros, it indicates the jth factor level of the ith plant is ``\eqn{1}".  A functional multi-way ANOVA model with interactions can be written in the following form:
\deqn{y_i(t) = \mu(t)+ X'_{i1}a_1(t) + X'_{i2}a_2(t) + (X'_{i1}\otimes X'_{i2})a_{1,2}(t) + \epsilon_i(t),}
where \eqn{a_j(t) = (a_{j2}(t), \ldots, a_{jl_j}(t))'} are the treatment effect functions of the jth factor with dimension \eqn{l_j-1}, \eqn{a_{1, 2}(t)} are the pairwise interaction effect functions between the two factors with dimension \eqn{(l_1-1)(l_2-1)}, and \eqn{\epsilon_i(t)}s are temporal dependent random processes with zero means. We have implemented this multi-factor model (\eqn{q\geq 2}) in our package such that researchers can specify the main and interactions effects as needed.
%where \eqn{{a}_j(t)} are the treatment effect functions of the jth factor with dimension \eqn{l_j-1}. \eqn{{a}_{j_1, j_2}(t)} are the pairwise interaction effect functions between factor \eqn{j_1} and \eqn{j_2} with dimension \eqn{(\ell_{j_1}-1)(\ell_{j2}-1)}, and \eqn{{a}_{1,2,...,q}(t)} are the interaction effect functions of all factors with dimensions \eqn{\prod_{j=1}^q (l_{j}-1)}, and \eqn{\epsilon_i(t)}s are independent random processes with zero means. The above genearl model provides a full specification of interactions among factors. In real applications, researchers can build up a simpler model with less interaction terms or even without interactions according to the purpose of the study.
Under the model, we can estimate the temporally varying coefficient functions.%\eqn{{a}_1(\cdot ),\ ...,\ {a}_q(\cdot ),  {a}_{1,2}(t\cdot ),...,} and \eqn{{a}_{1,2,...,q}(\cdot )}.
First, we approximate all of the coefficient functions with rank K splines expansions. For example, \eqn{a_{1k}(t) = \sum_{v=1}^{K}\beta_{jk,v}B_{d,v}(t)} , where \eqn{\{B_{d,v}(t)\}_{v = 1}^{K}\}} are an order \eqn{d} B-spline basis functions, and \eqn{\{\beta_{1k,v}\}_{v = 1}^{K}} are the corresponding coefficients. Let \eqn{\beta_{\mu1}, \beta_{1k}, \beta_{2k}} and \eqn{\beta_{int k1,k2}} denote the k-dimensional vector of the B-spline coefficients for the intercept, the two main factor effects (kth level), and their interaction terms (\eqn{k_1}th and \eqn{k_2}th level), respectively. Let \eqn{\beta = (\beta_{\mu}', \beta_{1,2}', \ldots, \beta_{1l_1}', \beta_{2l_2}', \ldots)} be the vector containing all these coefficients.

To estimate all those coefficients \eqn{\beta} in front of basis functions. We apply the least squares estimation with penalizations on the \eqn{d1th} derivatives of the rank \eqn{K} spline expansion functions to attain smooth estimators. Denoting \eqn{y_i(t_{i,z})} as the measurement for the ith (\eqn{i = 1,...,n}) plant observed at the zth (\eqn{z = 1,...,m}) time point, we minimize the penalized error sum of squares:
\deqn{\sum_{i=1}^{n}\sum_{z = 1}^{m}\{y_i(t_{i,z})-B(t_{i,z})'\beta_{\mu}-\sum_{k=2}^{l_1}X_{i1k}B(t_{i,z})'\beta_{1k}-\sum_{k=2}^{l_2}X_{i2k}B(t_{i,z})'\beta_{2k}}
\deqn{-\sum_{k1 = 2}^{l_1}\sum_{k2=2}^{l_2}X_{i1k1}X_{i2k2}B(t_{i,z})'\beta_{int k1,k2}}
\deqn{+\lambda\beta_{\mu}'\Omega \beta_{\mu} +\sum_{k=2}^{l_1}\lambda \beta_{1k}'\Omega \beta_{1k} +\lambda \sum_{k=2}^{l_2}\beta_{2k}'\Omega\beta_{2k}+ \sum_{k1 = 2}^{l_1} \sum_{k2 = 2}^{l_2} \lambda \beta_{intk1,k2}' \Omega \beta_{intk1,k2}}
%B(t_j)'\beta_{\mu} - G_iB(t_j)'\beta_1 - W_i B(t_j)'\beta_w \}^2 + \lambda_1\beta_{\mu}'\Omega\beta_{\mu} + \lambda_2\beta_{g}'\Omega\beta_{g} + \lambda_3\beta_{w}'\Omega\beta_{w},}
where \eqn{\lambda} is the smoothing parameter, \eqn{\Omega = \int B^{(d1)}(t)\{B^{(d1)}(t)\}'dt} is a penalty matrix, \eqn{B(t) = (B_{d,1}(t), \ldots, B_{d,K}(t))'}, and d1 is the order of the derivitives in the penalty term. We obtain the estimated B-spline coefficient \eqn{\beta} by minimizing the above quantity. The smoothing parameter \eqn{\lambda} is estimated by generalized cross validation (GCV). By plugging \eqn{\hat{\beta}} back to the rank \eqn{K} splines expansions, we get the estimated varying coefficient functions in the model, \eqn{\hat{\beta}_{\mu}(t) = B(t)'\hat{\beta}_{\mu}, \hat{a}_1(t) = B(t)'\hat{\beta}_{1}, \ldots}.
%This function performs functional anova anlaysis. We use B-Spline as the basis function to expand the coefficient of each variable.

%For example, the intercept term of a functional anova model, mu(t), will be expanded as

%mu(t) = sum_\{j = 1 to K\}beta_\{mu,j\}B_\{u,j\}(t),

%where beta_\{mu,j\} is the coefficient for B_\{u,j\}(t), and B_\{u,j\}(t) is an order u B-spline basis function. u is given by the argument "order" in this function. With another argument "K.int" (i.e., the number of interior knots) being defined, we can obtain K, the rank of spline expansion for mu(t), according to the relationship K = K.int + order.

%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{est_fun}{
a \eqn{t} by \eqn{u} matrix of the estimated function of coefficients, where \eqn{t} is the number of observation time points, and \eqn{u} is the number of columns of the design matrix.
%The \eqn{(z,j_l)} element represents the estimated value of the \eqn{j_lth} coefficient at the time \eqn{z} (i.e., \eqn{\hat{a}_{j_l}(t_z)}) in the following example:

For example, if the model includes two categorical variables without interaction terms, each categorical variable contains two levels, the model can be expressed as
\deqn{y(t) = \beta_0(t) + \beta_1(t) X_1 + \beta_2(t) X_2 + \epsilon(t).}
In this case, \eqn{u = 3}. This means your output "est_fun" contains 3 columns, and the columns repesent \eqn{\hat{\beta}_0(t)}, \eqn{\hat{\beta}_1(t)} and \eqn{\hat{\beta}_2(t)}, respectively.
}
\item{bhat}{ a \eqn{(u \times K) \times 1} numeric vector, containing all the estimated ceofficients, \eqn{\hat{\beta}} for the B-spline expansion, where \eqn{u} is the number of columns of the design matrix, and \eqn{K} is the rank of the spline expansion.
}
\item{design_mat}{The design matrix under the model specified in the function. It can be used as reference to help users identify the contrast vector L in the function CI(  ), and the values of j1 and j2 in the function CI_contrast(  ).
}
\item{lambda}{The penalty parameter, obatined by GCV.
}
\item{K}{ The rank of the B-spline basis function. K = number of interior knots + order of the B-spline basis function.
}
\item{...}{Other ouputs are for writing other functions. Users can ignore them.
}

%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{Ramsay, James O., and Silverman, Bernard W. (2005), Functional Data Analysis, 2nd ed., Springer, New York.

Ramsay, James O., Hooker, Giles, and Graves, Spencer (2009) Functional Data Analysis in R and
Matlab, Springer, New York.}
%% ~put references to the literature/web site here ~
\author{
%%  ~~who you are~~
}
\note{The rank of the B-spline basis functions, K, is equal to the order (degree+1) of the spline plus the number of interior knots. To avoid over-fitting, we choose the rank less than half of the number of observation time points, m.
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#load the data
data_new = read.csv(system.file("extdata", "data.csv",
                                 package = "implant", mustWork = TRUE))
#The first three columns of data_new refer to the original position of
#the observations from the original dataset, genotype and block, respectively
Y = data_new[, -c(1:3)]
#This step is to factorize each factor
Genotype = as.factor(data_new$Genotype)
Block = as.factor(data_new$Block)
X = data.frame(Genotype, Block)
formula = "~ Genotype + Block"
tt = seq(from = 0, to = 44, by = 2)
fit = fanova(Y.na.mat = Y, X = X, tt = tt, formula, K.int = 6, order = 4)
fit$lambda
fit$est_fun
}
