#devtools::install_github("rwang14/implant")
library(implant)
#demo1
data_new = read.csv(system.file("extdata", "data.csv",package = "implant", mustWork = TRUE))
#The first column records the positions of the observations from the original dataset, can be ignored
Y = data_new[,-c(1:3)]
#This step is to factorize each factor
Genotype = as.factor(data_new$Genotype)
Block = as.factor(data_new$Block)
X = data.frame(Genotype,Block)
formula = "~ Genotype + Block"
tt = seq(from = 0, to = 44,by = 2)
#fit = fanova(Y.na.mat = Y, X = X, tt = tt, formula, K.int = 6, order = 5, d1 = 4, lower = -10, upper = 15)
fit = fanova(Y.na.mat = Y, X = X, tt = tt, formula, K.int = 6, order = 4, d1 = 2, lower = -10, upper = 15)
#fit$lambda
#fit$est_fun
fit$design_mat
#find the CI to test the difference between  block 2 and block 1
#way 1
ci_diff = CI_contrast(fit = fit, j1 = 5, j2 = 1, alpha = 0.05)
plot(tt,ci_diff$trt,type = "l", ylim = c(-100000, 80000))
lines(tt,ci_diff$lb, col = "green")
lines(tt,ci_diff$ub, col = "blue")
#find the CI to test the difference between  block 2 and block 1
#way 2
ci = CI(fit, L = c(0, 0, 0, 0, 1), alpha = 0.05)
plot(tt,ci$trt, type = "l",ylim = c(-100000, 80000))
lines(tt,ci$ub, col = "green")
lines(tt, ci$lb, col = "blue")

#demo2
data_Xu = read.csv(system.file("extdata", "data_Xu.txt",package = "implant",
                               mustWork = TRUE), sep = "")
water = as.factor(data_Xu$water)
genotype = as.factor(data_Xu$genotype)
X = data.frame(water,genotype)
Y = data_Xu[,c(1:20)]
tt = c(0:15,17:20)
formula = "~water+genotype"
fit = fanova(Y.na.mat = Y, X = X,tt = tt,
                  formula = "~water * genotype"
                  ,K.int = 6, order = 4,lower = -10, upper = 15)
#fit$est_fun
fit$design_mat
#test the interaction term
#way 1
ci = CI(fit, L = c(0, 0, 0, 1), alpha = 0.05)
plot(tt,ci$trt, type = "l",ylim = c(-100000, 80000))
lines(tt,ci$ub, col = "red")
lines(tt, ci$lb, col = "blue")
#way two
ci = CI_contrast(fit, j1 = 4, j2 = 1, alpha = 0.05)
plot(tt,ci$trt, type = "l",ylim = c(-100000, 80000))
lines(tt,ci$ub, col = "red")
lines(tt, ci$lb, col = "blue")



