#demo1
data_new = read.csv(system.file("extdata", "data.csv",package = "implant", mustWork = TRUE))
#The first column records the positions of the observations from the original dataset, can be ignored
Y = data_new[,-c(1:3)]
#This step is to factorize each factor
Genotype = as.factor(data_new$Genotype)
Block = as.factor(data_new$Block)
X = data.frame(Genotype,Block)
formula = "~ Genotype+Block"
tt = seq(from = 0, to = 44,by = 2)
fit = fanova(Y.na.mat = Y, X = X, tt = tt, formula, K.int = 6, order = 4, lower = -10, upper = 15)
fit$lambda
fit$est_fun
#find the CI to test the difference between block 2 and block 1
ci_diff = CI.contrast(fit = fit, j1 = 4, j2 = 1, alpha = 0.05)
plot(tt,ci_diff$trt,type = "l", ylim = c(-100000, 80000))
lines(tt,ci_diff$lb, col = "green")
lines(tt,ci_diff$ub, col = "blue")


#demo2
data_Xu = read.csv(system.file("extdata", "data_Xu.txt",package = "implant",
                               mustWork = TRUE), sep = "")
X1 = as.factor(data_Xu$water)
X2 = as.factor(data_Xu$genotype)
X = data.frame(X1,X2)
Y = data_Xu[,c(1:20)]
fit = fanova(Y.na.mat = Y, X = X,tt = c(0:15,17:20),
                  formula = "~X[,1]+X[,2]+X[,1]:X[,2]"
                  ,K.int = 6, order = 4,lower = -10, upper = 15)
fit$est_fun
