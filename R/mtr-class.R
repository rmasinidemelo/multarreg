#' mtr
#'
#' A class for multiple target regression.
#'
#' @section Usage:
#' \preformatted{
#' set.seed(1)
#' x <- matrix(rnorm(100), ncol = 10)
#' set.seed(2)
#' y <- matrix(rnorm(30), ncol = 3)
#'
#' temp <- mtr$new(regMethod = "lm")
#' temp$fit(x, y)
#' temp$predict(x)
#' }
#'
#' @section Arguments:
#' \describe{
#'   \item{mtr}{The mtr class.}
#'   \item{more}{documentation required TODO.}
#' }
#'
#' @section Details:
#' some details.
#'
#' @name mtr
#' @examples
#' set.seed(1)
#' x <- matrix(rnorm(100), ncol = 10)
#' set.seed(2)
#' y <- matrix(rnorm(30), ncol = 3)
#'
#' temp <- mtr$new(regMethod = "lm")
#' temp$fit(x, y)
#' temp$predict(x)
#'
NULL

#' @export

mtr <- R6::R6Class(
  classname = "mtr",

  # define initiation
  public = list(

    method    = NULL,
    regMethod = NULL,
    trainArgs = NULL,
    arguments = NULL,
    fitModel  = NULL,

    initialize = function(method = "st", regMethod = "glmnet", trainArgs = NULL, ...) {

      self$method    <- method
      self$regMethod <- regMethod
      self$trainArgs <- trainArgs
      self$arguments <- list(...)
    },

    # define the fitting process
    fit = function(x, y, ...) {

      stopifnot(inherits(x, c("matrix", "data.frame")))
      stopifnot(!anyNA(x))
      if(inherits(x, "matrix")){
        stopifnot(is.numeric(x))
        x <- as.data.frame(x)
      }

      stopifnot(inherits(y, c("matrix", "data.frame")))
      stopifnot(!anyNA(y))
      if(inherits(y, "matrix")){
        stopifnot(is.numeric(y))
        y <- as.data.frame(y)
      } else {
          stopifnot(all(vapply(y, is.numeric, logical(1))))
      }

      stopifnot(nrow(x) == nrow(y))

      private$n_col <- ncol(x)
      self$fitModel <- switch(
        self$method
        , st = single_target(x, y, self$regMethod)
        # add new methods here
      )
    },

    # define the predict process
    predict = function(x) {

      stopifnot(inherits(x, c("matrix", "data.frame")))
      stopifnot(!anyNA(x))
      if(inherits(x, "matrix")){
        stopifnot(is.numeric(x))
        x <- as.data.frame(x)
      }
      stopifnot(ncol(x) == private$n_col)

      result <- switch(
        self$method
        , st = predict_single_target(self$fitModel, x)
        # add new methods here
      )

      if(inherits(x, "matrix")){
        result <- as.matrix(result)
      }

      return(result)
    }
  ),
  private = list(
    n_col = NULL
  )
)
