#' Climb Plot
#'
#' @param data data frame from the output of the IGCparse() function
#' @param rate_unit string of either "knots", "m/s" or "feet/min" to indicate units for climb rate
#'
#' @return ggplot2 object
#' @export
#'
#' @examples df <- IGCparse("2021-02-05-XCS-AAA-03.igc")
#'climb_plot(df,"knots")
#'
#'
climb_plot <- function(data,rate_unit){
  fit <- lm(data$press_alt ~ poly(data$time,85, raw = T))
  data$fit_alt <- fitted(fit)

  deriv_coef<-function(x) {
    x <- coef(x)
    stopifnot(names(x)[1]=="(Intercept)")
    y <- x[-1]
    stopifnot(all(grepl("^poly", names(y))))
    px <- as.numeric(gsub("poly\\(.*\\)","",names(y)))
    rr <- setNames(c(y * px, 0), names(x))
    rr[is.na(rr)] <- 0
    rr
  }

  data$fit_climb <- model.matrix(fit) %*% matrix(deriv_coef(fit), ncol=1)

  if(rate_unit == "knots"){
    ggplot(data = data) +
      geom_line(mapping = aes(x = time/60, y = climb_rate_press*1.944, colour = "Actual")) +
      geom_line(mapping = aes(x = time/60, y = fit_climb*1.944, colour = "Smoothed")) +
      labs(title = "Climb Plot", x = "Time (min)", y = "Climb Rate (kts)", colour = "Legend") +
      ylim(-30,30)
  }
  else if(rate_unit == "feet/min"){
    ggplot(data = data) +
      geom_line(mapping = aes(x = time/60, y = climb_rate_press*197, colour = "Actual")) +
      geom_line(mapping = aes(x = time/60, y = fit_climb*197, colour = "Smoothed")) +
      labs(title = "Climb Plot", x = "Time (min)", y = "Climb Rate (feet/min)", colour = "Legend") +
      ylim(-3000,3000)
  }
  else{
    ggplot(data = data) +
      geom_line(mapping = aes(x = time/60, y = climb_rate_press, colour = "Actual")) +
      geom_line(mapping = aes(x = time/60, y = fit_climb, colour = "Smoothed")) +
      labs(title = "Climb Plot", x = "Time (min)", y = "Climb Rate (m/s)", colour = "Legend") +
      ylim(-15,15)

  }
}
