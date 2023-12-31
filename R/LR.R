#'linear_regression
#
#'Get the linear regression parameters
#'
#'@param X predictors values
#'@param Y response values
#'
#'return the least squares estimates in matrix notation
#'
#'@examples
#'linear_regression(X = matrix(rnorm(3*100), nrow = 100, ncol = 3), Y = matrix(rnorm(1*100), nrow = 100, ncol = 1))
#'
#' @export
#'


linear_regression = function (X, Y) {
  X = cbind(rep(1, nrow(X)), X)
  beta_hat = solve(t(X) %*% X) %*% t(X) %*% Y
  err_var = sum((X %*% beta_hat - Y)^2) / (nrow(X) - ncol(X))
  std_err = sqrt(err_var)
  std_err_1 = c()
  for (i in 1:nrow(beta_hat)) {
    std_err_l = c(std_err_l, sqrt(solve((t(X) %*% X))[i,i] * err_var))
  }
  t_val = beta_hat / std_err_1
  p_val = c()
  for (i in 1:nrow(t_val)) {
    p_val = c(p_val, 2 * pt(abs(t_val[i]), df = nrow(X) - ncol(X), lower.tail = FALSE))
  }
  beta_hat = t(beta_hat)
  if (is.null(colnames(X))) {
    nmb_pred = ncol(X)
    colnames(X) = as.character(1:nmb_pred)
    colnames(X) = paste0("x", colnames(X))
  }
  colnames(beta_hat) = c("(Intercept)", colnames(X))
  return(list(coefficients = beta_hat, std_err = std_err_1, t_val = t_val, p_val = p_val))
}



