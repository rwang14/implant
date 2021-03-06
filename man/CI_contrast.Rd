\name{CI_contrast}
\alias{CI_contrast}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Constructing confidence regions for specific treatment effect in functional data analysis
%%  ~~function to do ... ~~
}
\description{This is a special case of the function "CI"
in this package. This function is easier to use when studying the difference between
two specific treatments/genotype, without specifying the linear combination needed in "CI".
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
CI_contrast(fit, j1, j2, alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fit}{An object of output obtained by function "fanova".
%%     ~~Describe \code{fit} here~~
}
  \item{j1}{A positive integer, specifying the columns of the design matrix
  corresponding to one treatment of interest. Users can use the design matrix output from the function fanova( ), to idenfity the value of j1. See the example part for details.
%%     ~~Describe \code{j1} here~~
}
  \item{j2}{A positive integer different from j1. It specifies the columns of the design matrix
  corresponding to the other treatment of interest. Users can use the design matrix output from the function fanova( ), to idenfity the value of j2. See the example part for details.
%%     ~~Describe \code{j2} here~~
}
  \item{alpha}{A positive small number between 0 and 1. 1-alpha gives the confidence level. In default, alpha = 0.05.
%%     ~~Describe \code{alpha} here~~
}
}
\details{
We can test the significance of the treatment effects of interest by constructing the corresponding confidence regions with the function \eqn{``CI\_contrast (fit, j1, j2, \ldots)}", where \eqn{fit} is the output from "\eqn{fanova ( )}", and \eqn{j1} and \eqn{j2} specify the columns of the design matrix corresponding to the treatments of interest. This is the simplified version of ```\eqn{CI\_contrast}" by setting the j1th and j2th elements of L being 1 and -1, and all other elements beign 0.

%For example, we'd like to study the relationship between the plant sizes and treatments using functional data models. Let \eqn{y_i(t)} be the size of the ith plant measured at time \eqn{t}, where \eqn{i = 1,\ldots,9}. We treat genotype and block as fixed effects. There are 3 different genotypes \eqn{(A,B,C)} and 3 blocks \eqn{(1,2,3)} in this study. We can use \eqn{Gi= (G_{ik})_{k=2}^{3}} as the categorical indicator of the ith plant genotype. Specifically, \eqn{G_{ik}} is set to one if the plant has the kth genotype; otherwise, \eqn{G_{ik}=0}. For example, if the ith plant has the 2nd genotype, then  \eqn{Gi = (0, 1, 0)}. And \eqn{Gi}s being zeros represents the \eqn{1st} genotype, which is treated as the baseline. Similarly, \eqn{Pi = (P_{ik})_{k=2}^3} is defined to indicate the block that the ith plant belongs to, and the first block is set as the baseline. The model can be written as:

%\deqn{y_i(t_{ij}) = \mu(t_{ij})+ \sum_{k=2}^{3} G_{ik} g_k(t_{ij})+\sum_{k=2}^3 P_{ik}p_k(t_{ij}) +\epsilon_i(t_{ij}),}
%where \eqn{\mu(t)} is the growth function of the plant with the 1st genotype (Genotype A) from the 1st block, \eqn{g_k(t)}s are the genotype effect functions, \eqn{p_k(t)}s are the fixed block effect functions, and the residuals \eqn{\epsilon_i(t)}s are modeled by independent random processes with mean zeros.
%where \eqn{t_{i,j}} refers the observation time j for ith observation. y is the plant size, \eqn{G (\cdot)} is the indicator variable for genotype and \eqn{P (\cdot)} is the indicator variable for block. \eqn{\epsilon} is a random process with mean being zero. We use \eqn{\mu(t), g(t)} and \eqn{p(t)} to denote the baseline growth function, the genotype effect function, and the block effect function, respectively.

%The parameter estimation is implemented by the function "\eqn{fanova ( \ldots)}" in our package. The confidence region of the block effect function \eqn{p_2(t)} infers whether there is significant difference in plant size between block 1 and block 2, given the same plant genotype. Let C be a \eqn{K\times (p\times K)} coefficient matrix of the \eqn{jth} dummy variable, where \eqn{K = 10} (the rank of spline basis function, see function ``\eqn{fanova( )}".) and \eqn{p = 5}. Those \eqn{1}s in the \eqn{ith} row locates in the \eqn{((j-1) \times K+i)}th column. Since we are interested in the effect of the second block, i.e., \eqn{j = 4}. Hence, \eqn{\hat{\beta}_{p_2} = C\hat{\beta}}. The variance of \eqn{\hat{P}_{2}(t) = B'(t)\hat{\beta}_{p_2} = B'(t)CSy(t)} is:
%\deqn{
%Var({\hat{P}_{2}(t)}) = {B'(t)CS\Sigma_eS'C'B(t)},
%}
%where \eqn{\Sigma_e} is the covariance matrix of \eqn{\epsilon}, and \eqn{S} is the hat matrix of \eqn{y(t)}, that is: \eqn{\hat{y}(t) = Sy(t)}. With the variance, we can construct the confidence bands of \eqn{P_{2}(t)} using Z distribution. Notice that the design matrix has 5 columns, and we use the following code to get the confidence region:

%ci_diff = CI_contrast (fit = fit, j1 = 4 , j2 = 1, alpha = 0.05)

%lowerbound = ci_diff$lb

%upperbound = ci_diff$lb

%For more detailed code, see the example below.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{trt}{a t by 1 vector, which refers to the estimated treatment effect, where t is the number of observation time points specified in the argument tt in the function fanova( ).}
\item{lb}{a t by 1 vector, which refers to the lower bound of the (1-alpha) confidence band, where t is the number of observation time points specified in the argument tt in the function fanova( ).}
\item{ub}{a t by 1 vector, which refers to the the upper bound of the (1-alpha) confidence band, where t is the number of observation time points specified in the argument tt in the function fanova( ).}
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

\seealso{{ \code{\link{fanova}}}
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
formula = "~ Genotype + Block"
tt = seq(from = 0, to = 44,by = 2)
#fit anova
fit = fanova(Y.na.mat = Y, X = X, tt = tt, formula, K.int = 6, order = 4, lower = -10, upper = 15)
fit$design_mat
> fit$design_mat
       (Intercept) Genotype2  Genotype  Block2  Block3
1           1          0           1      0      0
2           1          0           0      0      0
3           1          1           0      0      0
4           1          1           0      1      0
5           1          0           1      1      0
6           1          0           0      1      0
7           1          0           1      0      1
8           1          1           0      0      1
9           1          0           0      0      1
#We want to test the significance between block 2 and block 1,
#that is, we are interested in the 1st, the 4th column of the design matrix.
#Therefore, we can define:
ci_diff = CI_contrast(fit = fit, j1 = 4, j2 = 1, alpha = 0.05)
plot(tt,ci_diff$trt,type = "l")
lines(tt,ci_diff$lb, col = "blue")
lines(tt,ci_diff$ub, col = "blue")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
