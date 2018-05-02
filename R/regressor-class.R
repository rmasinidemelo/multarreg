#' @name regressor
#' @title regressor class
#' @description Thin wrapper over caret's train to create base regressors for quick use

regressor <- function(x, y, regMethod,  ...){

  arguments <- list(...)
  if(is.null(arguments[["tuneLength"]])){
    arguments[["tuneLength"]] <- 1L
  }

  if(is.null(arguments[["trControl"]])){
    arguments[["trControl"]] <- caret::trainControl(method = "none")
  }

  set.seed(1)
  trained <- do.call(caret::train
                     , c(list(x        = x
                              , y      = y
                              , method = regMethod
                              )
                          , arguments
                         )
                     )


  out <- list(reg = trained)
  class(out) <- "regressor"
  return(out)
}

#' @name predict.regressor
#' @title predict.regressor
#' @description predict.regressor

predict.regressor <- function(object, newdata, ...){
  return( stats::predict(object[["reg"]], newdata) )
}
