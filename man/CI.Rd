\name{CI}
\alias{CI}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Estimating a linear combination of treatment effects and obtaining its confidence regions in functional data analysis
%%  ~~function to do ... ~~
}
\description{This function is used for estimating a linear combination of treatment effects and its confidence regions in functional data analysis.It can be used for testing for the significance of the linear comination of effects.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
CI(fit, L, alpha)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fit}{an object of output obtained by function "fanova".
}
  \item{L}{a numeric contrast vector corresponding to the design matrix in "fanova", which specifies the linear combination of the parameters of interest. Users can use the design matrix output from the function fanova( ), to idenfity the value of L. See the example part for details.
%%     ~~Describe \code{x} here~~
}
\item{alpha}{a positive small number between 0 and 1. 1-alpha gives the confidence level. In default, alpha = 0.05.
}
}
\details{We can estimate a linear combination of treatment effects and its confidence regions with the function \eqn{``CI (fit, L \ldots)}", where \eqn{fit} is the output from "\eqn{fanova (\ldots)}", and \eqn{L} is a contrast vector under the Fanova model specifying the linear combination of the parameters of interest. The parameter estimation \eqn{\hat{\beta}} (see the detail part in the help documentation for function ``fanova( )") is implemented by the function "\eqn{fanova ( \ldots)}" in our package. By specifying the linear vector \eqn{L}, the estimated linear combination of effects at time \eqn{t} is:
\deqn{\hat{\tau}(t) = L\otimes B'(t) \hat{\beta},}
where ``\eqn{\otimes}" is the Kronecker product, and \eqn{B(t) = (B_{d,1}(t), B_{d,2}(t), \ldots, B_{d,K}(t))'.} Here d is the order of the B-spline basis function and K is the rank of the B-spline basis function. More details can be found in the help documentation for function ``fanova".

In the example part, we study the relationship between the plant sizes and treatments using functional data models. Let \eqn{y_i(t)} be the size of the ith plant measured at time \eqn{t}, where \eqn{i = 1,\ldots,9}. We treat genotype and block as fixed effects. There are 3 different genotypes \eqn{(1,2,3)} and 3 blocks \eqn{(1,2,3)} in this study. We can use \eqn{G_i= (G_{ik})_{k=2}^{3}} as the categorical indicator of the ith plant genotype. Specifically, \eqn{G_{ik}} is set to one if the plant has the kth genotype; otherwise, \eqn{G_{ik}=0}.
%For example, if the ith plant has the 2nd genotype, then  \eqn{G_i = (0, 1, 0)}. And \eqn{Gi}s being zeros represents the \eqn{1st} genotype, which is treated as the baseline.
Similarly, \eqn{P_i = (P_{ik})_{k=2}^3} is defined to represent the block that the ith plant belongs to, and the first block is set as the baseline. The model can be written as:

\deqn{y_i(t_{ij}) = \mu(t_{ij})+ \sum_{k=2}^{3} G_{ik} g_k(t_{ij})+\sum_{k=2}^3 P_{ik}p_k(t_{ij}) +\epsilon_i(t_{ij}),}
where \eqn{\mu(t)} is the growth function of the plant with the 1st genotype (Genotype 1) from the 1st block, \eqn{g_k(t)}s are the genotype effect functions, \eqn{p_k(t)}s are the fixed block effect functions, and the residuals \eqn{\epsilon_i(t)}s are modeled by independent random processes with mean zeros. To be more specific, \eqn{\mu(t) = \sum_{v=1}^{K}\beta_{\mu,v}B_{d,v}(t)} , where \eqn{\{B_{d,v}(t)\}_{v = 1}^{K}} are order \eqn{d} B-spline basis functions, and \eqn{\{\beta_{\mu,v}\}_{v = 1}^{K}} are the corresponding coefficients. \eqn{g_{k}(t) = \sum_{v=1}^{K}\beta_{g_k,v}B_{d,v}(t)}, and \eqn{\{\beta_{g_k,v}\}_{v = 1}^{K}} are the corresponding coefficients. Similarly, \eqn{p_{k}(t) = \sum_{v=1}^{K}\beta_{p_k,v}B_{d,v}(t)} , where \eqn{\{\beta_{p_k,v}\}_{v = 1}^{K}} are the corresponding coefficients.
%where \eqn{t_{i,j}} refers the observation time j for ith observation. y is the plant size, \eqn{G (\cdot)} is the indicator variable for genotype and \eqn{P (\cdot)} is the indicator variable for block. \eqn{\epsilon} is a random process with mean being zero. We use \eqn{\mu(t), g(t)} and \eqn{p(t)} to denote the baseline growth function, the genotype effect function, and the block effect function, respectively. %The parameter estimation is implemented by the function "\eqn{fanova ( \ldots)}" in our package.
Using the function \eqn{CI (\ldots)}, we can estimate a linear combination of treatment effects, including estimating the average growth curve of a particular genotype over all the blocks. In the example part, we use this function to estimate the average growth curve of Genotype 1 over three blocks.
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

\seealso{\code{\link{fanova}}
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
#fit the model
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
#We want to estimate the growth curve of genotype 1 averaging over three blocks,
#that is, we are interested in the 1st, the 4th and the 5th column of the design matrix.
#Therefore, we can define:
L1 = c(1, 0, 0, 1/3, 1/3)
ci1 = CI(fit = fit, L = L1, alpha = 0.05)
plot(tt,ci1$trt,type = "l")
lines(tt,ci1$lb, col = "blue")
lines(tt,ci1$ub, col = "blue")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
