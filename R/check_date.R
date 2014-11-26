check_date <- function(date) {
  tryCatch({as.Date(date); TRUE},
                        error = function(err) FALSE)
}
