library(MASS)

simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * corr#elationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}

colnames <-c("N1","N2","N3","N4","E1","E2","E3","E4")

corr <- matrix(data=c(1.00000, 0.767,  0.731,  0.778, -0.351,  -0.316,  -0.296,-0.282,
                      0.767,   1.000,  0.709,  0.738, -0.302,  -0.28,-0.289,-0.254,
                      0.731,   0.709,  1.000,  0.762, -0.356,  -0.3,-0.297,-0.292,
                      0.778,   0.738,  0.762,  1.000, -0.318,  -0.267,-0.296,-0.245,
                      -0.351, -0.302, -0.356, -0.318, 1.000,    0.675,0.634,0.534,
                      -0.316, -0.280, -0.300, -0.267, 0.675,    1.000,0.651,0.593,
                      -0.296, -0.289, -0.297, -0.296, 0.634,    0.651, 1.000,0.566,
                      -0.282, -0.254, -0.292, -0.245, 0.534,    0.593, 0.566, 1.000), nrow=8) 

sd <- c(5.700, 5.600, 6.400, 5.700, 6.000, 6.200, 5.700, 5.600 )

set.seed(123)

simulation(colnames, 250, sd, corr,"case3_8v_2f/neuroticism.csv" )