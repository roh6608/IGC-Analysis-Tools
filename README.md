IGCparser
===================

Provides functions that enable an IGC file to be parsed, creating a data.frame containing time (s), pressure and GNSS altitude (m), latitude and longitude (DDD.DDDDD°) and climb rate (m/s).

Getting started
------------------
To install the version under development;

```r
if (!require("devtools")) {
  install.packages("devtools")
  library("devtools")
}

install_github("roh6608/IGCparser", build_vignettes = TRUE)

```
Also ensure both dplyr and hms are installed;

```r
if(!require("dplyr")){
  install.packages("dplyr")
  library("dplyr")
}

if(!require("hms")){
  install.packages("hms")
  library("hms")
}
 
 
```




 
