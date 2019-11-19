library(plumber)
r <- plumb("plumber.R")
r$run(port = as.numeric(Sys.getenv('PORT')), host = "0.0.0.0")