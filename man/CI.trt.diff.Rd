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
\details{
We can test the significance of the treatment effects of interest by constructing the corresponding confidence regions with the function \eqn{``CI.trt.diff (\ldots)"} in the package, i.e., \eqn{CI.trt.diff (fit, j_1, j_2, \ldots)},  where fit is the output from \eqn{"fanova\_mean (\dots)"}", and \eqn{j_1} and \eqn{j_2} specify the columns of the design matrix corresponding to the treatment of interest.

For example, we'd like to study the relationship between the plant sizes and treatments using functional data models. Let \eqn{y_i(t)} be the size of the \eqn{i^{th}} plant measured at time \eqn{t}, where \eqn{i = 1,\ldots,9}. We treat genotype and block as fixed effects. There are 3 different genotypes and 3 blocks in this study. We can use \eqn{\mathbf{G}_i= (G_{ik})_{k=2}^{3}} as the categorical indicator of the \eqn{i^{th}} plant genotype. Specifically, \eqn{G_{ik}} is set to one if the plant has the \eqn{k^{th}} genotype; otherwise, \eqn{G_{ik}=0}. For example, if the \eqn{i^{th}} plant has the \eqn{2^{nd}} genotype, then  \eqn{\mathbf{G}_i = (0, 1, 0)}. And \eqn{G_i}s being zeros represents the \eqn{1^{st}} genotype, which is treated as the baseline. Similarly, \eqn{\mathbf{P_i} = (P_{ik})_{k=2}^3} is defined to indicate the block that the \eqn{i^{th}} plant belongs to, and the first block is set as the baseline. The model can be written as:

\deqn{y_i(t_{ij}) = \mu(t_{ij})+ \sum_{k=2}^{3} G_{ik} g_k(t_{ij})+\sum_{k=2}^3 P_{ik}p_k(t_{ij}) +\epsilon_i(t_{ij}),}
where \eqn{\mu(t)}is the growth function of the plant with the \eqn{1^{st}} genotype (Genotype A) from the \eqn{1^{st}} block, \eqn{g_k(t)}s are the genotype effect functions, \eqn{p_k(t)}s are the fixed block effect functions, and the residuals \eqn{\epsilon_i(t)}s are modeled by independent random processes with mean zeros.
%where \eqn{t_{i,j}} refers the observation time j for ith observation. y is the plant size, \eqn{G (\cdot)} is the indicator variable for genotype and \eqn{P (\cdot)} is the indicator variable for block. \eqn{\epsilon} is a random process with mean being zero. We use \eqn{\mu(t), g(t)} and \eqn{p(t)} to denote the baseline growth function, the genotype effect function, and the block effect function, respectively.

The parameter estimation is implemented by the function "\eqn{fanova\_mean ( )}" in our package. The confidence region of the block effect function \eqn{p_3(\cdot)} infers whether there is significant difference in plant size between block 1 and block 3, given the same plant genotype.

We find that, compared to block \eqn{1},  block \eqn{3} does not have significant effect on the size of plants in the early stage of the growth until about the 15th day. As another example, by constructing the confidence regions of the coefficient difference \eqn{g_2(\cdot) - g_3(\cdot)},
we can test whether the plant size has any significant difference over time between the \eqn{2^{nd}} genotype (Genotype B) and the 3rd genotype (Genotyp C) , given the plants belonging to the same block.
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
