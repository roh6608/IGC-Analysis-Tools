% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/time_in_lift.R
\name{time_in_lift}
\alias{time_in_lift}
\title{Time in lift}
\usage{
time_in_lift(data, launch_type, launch_height)
}
\arguments{
\item{data}{data frame from the output of the IGCparse() function}

\item{launch_type}{string of either "tow", "winch", "self"}

\item{launch_height}{numeric height of the launch (in metres), for tow and winch launch height is synonymous with
release height, for self launch it is height of launch.}
}
\value{
numeric object of time in lift in decimal hours
}
\description{
Time in lift
}
\examples{
df <- IGCparse("2021-02-05-XCS-AAA-03.igc")
time_in_lift(data,"tow",1500)

}
