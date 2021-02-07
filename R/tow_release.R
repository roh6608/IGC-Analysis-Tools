
#' Tow release height
#'
#' @param data data frame from the output of the IGCparse() function
#' @param alt_unit string of either "feet" or "metre" to indicate what units the altitude values should be


#'
#' @return
#' @export
#'
#' @examples
#'
#'

tow_release <- function(data,alt_unit){

}

data <- IGCparse("C:/Projects/IGC-Gliding-Tool/Files/2021-02-06-XCS-AAA-01.igc")

distance <- function(lat1,lon1,lat2,lon2){
  lat1 <- lat1*pi/180
  lat2 <- lat2*pi/180
  lon1 <- lon1*pi/180
  lon2 <- lon2*pi/180
  distance <- 2*6.3781*10^6*sqrt((sin((lat2-lat1)/2)^2)+cos(lat1)*cos(lat2)*sin((lon2-lon1)/2)^2)

  return(distance)
}

distance(-32.92927,151.78514,-31.49789,145.84153)
