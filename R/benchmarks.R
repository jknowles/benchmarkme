run_benchmarks = function(bm, runs, verbose, parallel) {
  if(is.logical(parallel) && !parallel) {
    results = lapply(bm, do.call, list(runs=runs, verbose=verbose), 
                     envir = environment(run_benchmarks))
    results = Reduce("rbind", results)
    results$cores = 0
  } else {
    results = lapply(bm, bm_parallel, 
                      runs = runs, verbose = verbose, cores = parallel)
    results = Reduce("rbind", results)
  }
  
  
  class(results) = c("ben_results", class(results))
  results
}

#' Available benchmarks
#' 
#' The function returns the available benchmarks
#' @export
#' @examples 
#' get_available_benchmarks()
get_available_benchmarks = function() {
  c("benchmark_std", "benchmark_prog", "benchmark_matrix_cal", 
    "benchmark_matrix_fun", "benchmark_io")
}

#' @inheritParams benchmark_std
#' @rdname bm_prog_fib
#' @export
benchmark_prog = function(runs = 3, verbose = TRUE, parallel = FALSE) {
  bm = c("bm_prog_fib", "bm_prog_gcd", "bm_prog_hilbert", 
         "bm_prog_toeplitz", "bm_prog_escoufier")
  if(verbose)
    message("# Programming benchmarks (5 tests):")
  
  run_benchmarks(bm, runs, verbose, parallel)
}

#' @inheritParams benchmark_std
#' @rdname bm_matrix_cal_manip
#' @export
benchmark_matrix_cal = function(runs = 3, verbose = TRUE, parallel = FALSE) {
  bm =  c("bm_matrix_cal_manip","bm_matrix_cal_power", "bm_matrix_cal_sort", 
           "bm_matrix_cal_cross_product", "bm_matrix_cal_lm")
  if(verbose)
    message("# Matrix calculation benchmarks (5 tests):")
  
  run_benchmarks(bm, runs, verbose, parallel)
}

#' @inheritParams benchmark_std
#' @rdname bm_matrix_fun_fft
#' @export
benchmark_matrix_fun = function(runs = 3, verbose = TRUE, parallel = FALSE) {
  bm = c("bm_matrix_fun_cholesky", "bm_matrix_fun_determinant",
         "bm_matrix_fun_eigen", "bm_matrix_fun_fft",
         "bm_matrix_fun_inverse")
  if(verbose)
    message("# Matrix function benchmarks (5 tests):")
  run_benchmarks(bm, runs, verbose, parallel)  
}


