#' What happened on this date?
#'
#' This function returns info in a data.frame concerning games played on the date supplied.
#'
#' You know the problem: You're in your office playing Trvial Pursuit: NHL Edition
#' when you suddenly have the urge to cheat and just get this game over with.
#' How will you do it? Is such a thing even possible? Yes!
#' You can now ask R directly, without wasting your time playing a game
#' dreamt up by only the most nefarious Canadian mind.
#'
#' @param date The date of interest
#' @return \code{data.frame} containing data for the date supplied
#' @export
#' @examples
#' scores("2014-11-02")
#' scores("2011-06-15")
scores <- function(date = Sys.Date()) {
  if (internet_connection() != TRUE)
    stop("You aren't connected to the internet, or Google is down; it's likely the former")
  else
  assertthat::assert_that(check_date(date) == TRUE)
  url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
                 date, '.jsonp')
  raw <- RCurl::getURL(url)
  json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
  data <- jsonlite::fromJSON(json)$games
  with(data,
       data.frame(home = paste(htn, htcommon),
                  away = paste(atn, atcommon),
                  home_score = hts,
                  away_score = ats))
}
