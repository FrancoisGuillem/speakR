#' Display available voices
#'
#' Displays available voices (name and lang of the voice).
#'
#' @return
#' Invisibly returns NULL. The function is only used only for its side effect.
#'
#' @import htmlwidgets
#'
#' @example
#' voices()
#'
#' @export
voices <- function() {

  # forward options using x
  x = list()

  # create widget
  print(
    htmlwidgets::createWidget(
      name = 'voices',
      x,
      width = NULL,
      height = NULL,
      package = 'speakR',
      elementId = NULL
    )
  )

  invisible()
}
