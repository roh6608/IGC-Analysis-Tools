#' Decode IGC file
#' This function decodes an IGC file
#' @param filepath filepath of IGC file contained within ""
#'
#' @return data frame
#' @export
#'
#' @examples
#' IGCdecode("2021-02-05-XCS-AAA-03.igc)
#'
#'
IGCdecode <- function(filepath){
  `%>%` <- dplyr::`%>%`

  #data import
  df <- read.csv(paste0(filepath), header = F)

  #manipulating data
  data <- as.data.frame(df[grep("B", df$V1),])
  colnames(data) <- c("V1")
  data$fix <- substr(data$V1,1,1)
  data$time <- substr(data$V1,2,7)
  data$lat_deg <- paste0(substr(data$V1,8,9),substr(data$V1,15,15))
  data$lat_min <- as.numeric(paste0(substr(data$V1,10,11),".",substr(data$V1,12,14)))
  data$lon_deg <- paste0(substr(data$V1,16,18),substr(data$V1,24,24))
  data$lon_min <- as.numeric(paste0(substr(data$V1,19,20),".",substr(data$V1,21,23)))
  data$fix_val <- substr(data$V1,25,25)
  data$press_alt <- substr(data$V1,26,30)
  data$GNSS_alt <- substr(data$V1,31,35)
  data$V1 <- NULL
  data$fix <- NULL
  data$fix_val <- NULL
  data$lat <- NULL
  data$lon <- NULL
  data <- data %>% dplyr::mutate_at(dplyr::vars(lat_deg, lon_deg),
                             dplyr::funs(as.numeric(gsub("[NE]$", "", gsub("^(.*)[WS]$", "-\\1", .)))))
  for(item in data$lat_deg){
    if(item < 0){
      data$lat <- item - data$lat_min/60
    }
    else{
      data$lat <- item + data$lat_min/60
    }
  }

  for(item in data$lon_deg){
    if(item < 0){
      data$lon <- item - data$lon_min/60
    }
    else{
      data$lon <- item + data$lon_min/60
    }
  }
  data$press_alt <- as.numeric(data$press_alt)
  data$GNSS_alt <- as.numeric(data$GNSS_alt)

  return(data)
}
