#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays on a date
#' and FALSE otherwise
#'
#' You know the problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game on a date.
#' Before you know it you just wasted 15 minutes browsing the latest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The name of your team,
#' @param date The date the game occurred
#' @return Logical \code{TRUE} if \code{team} has a NHL game on the date specified,
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")
gday <- function(team = "canucks", date = Sys.Date()){
  if (internet_connection() != TRUE)
    stop("You aren't connected to the internet, or Google is down; it's likely the former")
  else
  assertthat::assert_that(check_date(date) == TRUE)
  url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
                 date, '.jsonp')
  grepl(team, RCurl::getURL(url), ignore.case=TRUE)
}
