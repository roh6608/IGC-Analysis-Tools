#' Barogram Plot
#'
#' @param data data frame from the output of the IGCparse() function
#' @param units string of either "feet" or "metre" to indicate what units the altitude values should be
#'
#' @return ggplot2 object
#' @export
#'
#' @examples df <- IGCparse("2021-02-05-XCS-AAA-03.igc")
#' barogram(df,"metre")
#'
barogram <- function(data,alt_unit){
  if(alt_unit == "metre"){
  ggplot2::ggplot(data = data) +
      geom_line(mapping = aes(x = time/60, y = press_alt, colour = "Pressure Altitude")) +
      geom_line(mapping = aes(x = time/60, y = GNSS_alt, colour = "GNSS Altitude")) +
      labs(title = "Barogram", x = "Time (min)", y = "Altitude (m)", colour = "Legened")
  }
  else{
    ggplot2::ggplot(data = data) +
      geom_line(mapping = aes(x = time/60, y = press_alt*3.281, colour = "Pressure Altitude")) +
      geom_line(mapping = aes(x = time/60, y = GNSS_alt*3.281, colour = "GNSS Altitude")) +
      labs(title = "Barogram", x = "Time (min)", y = "Altitude (ft)", colour = "Legened")

  }
}

