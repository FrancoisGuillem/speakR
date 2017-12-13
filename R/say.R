#' Tell R to say something !
#'
#' Give the function a message and R will pronounce it. Do not forget to turn on
#' your speakers!
#'
#' @details
#' R cannot speak by itself. The function uses speech synthesis implemented in
#' modern web browsers. In Rstudio, it uses the viewer panel. In other settings,
#' it attemps to open the default web browser.
#'
#' @param message A character string.
#' @param voice Voice name.
#'
#' @return
#' Does not return anything. The function is only used for its side effect.
#'
#' @examples
#' say("Hello world")
#'
#' @export
say <- function(message, voice = NULL) {
  print(sayWidget(message, voice))
  invisible()
}

#' a "HTMLwidget" that says something
#'
#'
#' @inheritParams say
#' @param elementId Id of the HTML element that contains the widget.
#'
#' @import htmlwidgets
#'
#' @export
sayWidget <- function(message, voice = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    message = as.character(message),
    voice = voice
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'say',
    x,
    width = 0,
    height = 0,
    package = 'speakR',
    elementId = elementId
  )
}

#' Shiny bindings for sayWidget
#'
#' Output and render functions for using say within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a sayWidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name say-shiny
#'
#' @export
sayOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'say', width, height, package = 'speakR')
}

#' @rdname say-shiny
#' @export
renderSay <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sayOutput, env, quoted = TRUE)
}
