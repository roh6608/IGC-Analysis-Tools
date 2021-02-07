#' Time in lift
#'
#' @param data data frame from the output of the IGCparse() function
#' @param launch_type string of either "tow", "winch", "self"
#' @param launch_height numeric height of the launch (in metres), for tow and winch launch height is synonymous with
#' release height, for self launch it is height of launch.
#'
#' @return numeric object of time in lift in decimal hours
#' @export
#'
#' @examples df <- IGCparse("2021-02-05-XCS-AAA-03.igc")
#' time_in_lift(data,"tow",1500)
#'
time_in_lift <- function(data,launch_type,launch_height){
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
  data$time_diff <- c(diff(data$time),NA)

  if(launch_type == "self"){
    data <- data[(data$climb_rate_press > 0),]
    return(sum(data$time_diff)/3600)
  }

  else{
    errorCondition("Under development")
  }

}

