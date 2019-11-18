\name{fanova_mean}
\alias{fanova_mean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fanova_mean(Y.na.mat, X, tt, formula, K.int = 6, order = 4, interact = 0, p = 2, d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y.na.mat}{
%%     ~~Describe \code{Y.na.mat} here~~
}
  \item{X}{
%%     ~~Describe \code{X} here~~
}
  \item{tt}{
%%     ~~Describe \code{tt} here~~
}
  \item{formula}{
%%     ~~Describe \code{formula} here~~
}
  \item{K.int}{
%%     ~~Describe \code{K.int} here~~
}
  \item{order}{
%%     ~~Describe \code{order} here~~
}
  \item{interact}{
%%     ~~Describe \code{interact} here~~
}
  \item{p}{
%%     ~~Describe \code{p} here~~
}
  \item{d0}{
%%     ~~Describe \code{d0} here~~
}
  \item{d1}{
%%     ~~Describe \code{d1} here~~
}
  \item{d2}{
%%     ~~Describe \code{d2} here~~
}
  \item{lower}{
%%     ~~Describe \code{lower} here~~
}
  \item{upper}{
%%     ~~Describe \code{upper} here~~
}
}
\details{
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

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Y.na.mat, X, tt, formula, K.int = 6, order = 4, interact = 0, 
    p = 2, d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15) 
{
    data.time = rbind(tt, Y.na.mat)
    T_na = Y.na.mat
    for (i in 1:dim(Y.na.mat)[1]) {
        for (j in 1:dim(Y.na.mat)[2]) {
            if (is.na(Y.na.mat[i, j])) {
                T_na[i, j] = NA
            }
            else {
                T_na[i, j] = data.time[1, j]
            }
        }
    }
    Y = input.list(data = Y.na.mat, Time_na = as.matrix(T_na), 
        p = 0)$Y
    T = input.list(data = Y.na.mat, Time_na = as.matrix(T_na), 
        p = 0)$T
    Y.vec = Reduce(c, Y)
    T.vec = Reduce(c, T)
    n = length(Y)
    order = order
    knots = max(tt) * (1:K.int)/(1 + K.int)
    K = length(knots) + order
    basis = create.bspline.basis(c(0, total.time), K, norder = order)
    design_matrix = NULL
    if (interact == 1) {
        design_matrix = model.matrix(as.formula(paste("~.^", 
            p, sep = "")), data = X)
    }
    if (interact == 0) {
        design_matrix = model.matrix(as.formula(formula), data = X)
    }
    Omega = inprod(basis, basis, d1, d2)
    BS = eval.basis(T[[1]], basis, d0)
    for (i in 2:n) {
        BSnew = eval.basis(T[[i]], basis, d0)
        BS = rbind(BS, BSnew)
    }
    nf = ncol(design_matrix)
    if (nf == 1) {
        BSmat = BS
    }
    if (nf > 1) {
        BSmat = BS
        for (i in 2:nf) {
            BSnew1 = BS
            BSmat = cbind(BSmat, BSnew1)
        }
    }
    m = matrix(NA, nrow = n, ncol = 1)
    for (i in 1:n) {
        m[i] = length(as.numeric(T[[i]]))
    }
    des_X = matrix(NA, nrow = nrow(BSmat), ncol = ncol(BSmat))
    for (j in 1:ncol(design_matrix)) {
        for (i in 1:1) {
            des_X[(1:m[i]), ((j - 1) * K + 1):((j - 1) * K + 
                1):(j * K)] = design_matrix[i, j]
        }
        for (i in 2:nrow(design_matrix)) {
            des_X[(1:m[i]), (1:K)] = design_matrix[i, 1]
            des_X[(sum(m[1:(i - 1)]) + 1):(sum(m[1:i])), ((j - 
                1) * K + 1):(j * K)] = design_matrix[i, j]
        }
    }
    Xmat = des_X * BSmat
    tuning_nointer = function(lower, upper, Omega, Xmat, Y.vec) {
        lam.list = exp(seq(lower, upper, 1))
        gcv = rep(0, length(lam.list))
        for (ii in 1:length(lam.list)) {
            Omega_lam = matrix(0, nrow = ncol(design_matrix) * 
                nrow(Omega), ncol = ncol(design_matrix) * ncol(Omega))
            for (i in 1:ncol(design_matrix)) {
                Omega_lam[((1 + (i - 1) * dim(Omega)[1]):(i * 
                  dim(Omega)[1])), ((1 + (i - 1) * dim(Omega)[2]):(i * 
                  dim(Omega)[2]))] = Omega * lam.list[ii]
            }
            A <- solve(t(Xmat) \%*\% Xmat + Omega_lam)
            Y.vec.hat <- (Xmat \%*\% A) \%*\% (t(Xmat) \%*\% Y.vec)
            diag.mean <- sum(diag(t(Xmat) \%*\% Xmat \%*\% A))/(dim(Xmat)[1])
            gcv[ii] <- mean((Y.vec - Y.vec.hat)^2)/(1 - diag.mean)^2
        }
        ind = which(gcv == min(gcv))
        lam.list[ind]
    }
    lam = tuning_nointer(lower, upper, Omega, Xmat, Y.vec)
    Omegabylam = matrix(0, nrow = ncol(design_matrix) * nrow(Omega), 
        ncol = ncol(design_matrix) * ncol(Omega))
    for (i in 1:ncol(design_matrix)) {
        Omegabylam[((1 + (i - 1) * dim(Omega)[1]):(i * dim(Omega)[1])), 
            ((1 + (i - 1) * dim(Omega)[2]):(i * dim(Omega)[2]))] = Omega * 
            lam
    }
    bhat = solve(t(Xmat) \%*\% Xmat + Omegabylam) \%*\% t(Xmat) \%*\% 
        Y.vec
    S = solve(t(Xmat) \%*\% Xmat + Omegabylam) \%*\% t(Xmat)
    BS = eval.basis(tt, basis, d0)
    m = length(tt)
    para = matrix(0, nrow = m, ncol = ncol(design_matrix))
    for (i in 1:ncol(design_matrix)) {
        para[, i] = BS \%*\% bhat[((i - 1) * K + 1):((i - 1) * 
            K + K)]
    }
    return(list(est_fun = para, lambda = lam, bhat = bhat, S = S, 
        Phi = Xmat, order = order, K = K, total.time = total.time, 
        tps = tt, X = X, Y_na = Y.na.mat, formula = formula, 
        d0 = d0, d1 = d1, d2 = d2))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
