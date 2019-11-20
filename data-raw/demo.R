load_all()
data_new = read.csv(system.file("extdata", "data.csv",package = "implant", mustWork = TRUE))
Y.na.mat = data_new[,-c(1:3)]
tt = seq(from = 0, to = 44,by = 2)
X = data_new[,c(2:3)]
#This step is to factorize each factor
X1 = as.factor(unlist(X[,1]))
X2 = as.factor(unlist(X[,2]))
X = data.frame(X1,X2)
formula = toString("~ X[,1]+X[,2]")
fit = fanova_mean(Y.na.mat, X, tt = tt, formula, K.int = 6, order = 4, d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15)
fit$lambda
fit$est_fun
