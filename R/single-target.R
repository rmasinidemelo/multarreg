#' @name single_target
#' @title Single target regressions.
#' @description Decompose the multiple target regression into independent univariate regressions.

single_target <- function(x, y, regMethod, ...){

  models <- lapply(1:ncol(y)
                   , function(colNum) regressor(x
                                                , y[[colNum]]
                                                , regMethod = regMethod
                                                , ...
                                                )
                   )
  return(list(models = models))
}

#' @name predict_single_target
#' @title Predict method for single target regressions.
#' @description Predict method for single target regressions.

predict_single_target <- function(object, newdata){
  y_list <- lapply(1:length(object[["models"]])
                   , function(colNum) stats::predict(object[["models"]][[colNum]]
                                                     , newdata
                                                     )
                   )
  data.table::setDF(y_list)
  return(y_list)
}
