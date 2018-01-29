Rprof()
## some code to be profiled
Rprof(NULL)
## stop profiling
summaryRprof()
##"by.total" divides the time spend in each function by the total run time
##"by.self" does the same but first subtracts out time spent in functions above in the call stack