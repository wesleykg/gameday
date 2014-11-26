#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The name of your team
#' @return Logical \code{TRUE} if \code{team} has a NHL game today,
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")
gday <- function(team = "canucks"){
  url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
                 Sys.Date(), '.jsonp')
  grepl(team, RCurl::getURL(url), ignore.case=TRUE)
}
