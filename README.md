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

**Methods**:

- single_target (done)

TODO:

- mtrs
- mtrs_extended
- rc
- rcCV
- nnet

----

**License**: GPL-3

**Contribution**: Suggestions and PR are welcome! [A survey on multi-output regression by Hanen Borchani et al](oa.upm.es/id/eprint/40804/contents) seems to be a good start point.
