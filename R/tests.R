# # tests
# # should convert these to testthat
#
# # single_target ----
# set.seed(1)
# x <- matrix(rnorm(100), ncol = 10)
# if(is.null(colnames(x))){
#     colnames(x) <- paste0("V", 1:ncol(x))
#   }
#
#
# set.seed(2)
# y <- matrix(rnorm(30), ncol = 3)
#
# temp <- single_target(as.data.frame(x), as.data.frame(y), regMethod = "glmnet")
# pred <- predict_single_target(temp, as.data.frame(x))
# is.matrix(pred)
# dim(pred)
#
# temp <- single_target(as.data.frame(x), as.data.frame(y), regMethod = "rf")
# pred <- predict_single_target(temp, as.data.frame(x))
# is.matrix(pred)
# dim(pred)
#
# temp <- single_target(as.data.frame(x), as.data.frame(y), regMethod = "lm")
# pred <- predict_single_target(temp, as.data.frame(x))
# is.matrix(pred)
# dim(pred)
#
# # test mtr ----
# temp <- mtr$new(regMethod = "lm")
# temp$fit(x, y)
# temp$predict(x)
#
# temp <- mtr$new(regMethod = "rf")
# temp$fit(x, y)
# temp$predict(x)
#
# temp <- mtr$new(regMethod = "rf")
# temp$fit(as.data.frame(x), as.data.frame(y))
# temp$predict(x)
# temp$predict(as.data.frame(x))
#
# temp <- mtr$new(regMethod = "rf")
# temp$fit(as.data.frame(x), y)
# temp$predict(x)
# temp$predict(as.data.frame(x))
#
# temp <- mtr$new(regMethod = "rf")
# temp$fit(x, as.data.frame(y))
# temp$predict(x)
# temp$predict(as.data.frame(x))
