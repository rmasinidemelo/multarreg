# multarreg
> Methods for multiple target or output regression

**Usage**:

```
library("multtarreg")

# create random data
set.seed(1); x     <- matrix(rnorm(100), ncol = 10)
set.seed(2); x_new <- matrix(rnorm(100), ncol = 10) 
set.seed(3); y     <- matrix(rnorm(30), ncol = 3)

# example
temp <- mtr$new(method = "st")    # instantiate a mutiple target regressor
temp$fit(x, y)                    # regress 
temp$predict(x_new)               # predict
```
