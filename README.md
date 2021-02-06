IGCparser
===================

Provides functions that enable an IGC file to be parsed, creating a data.frame containing time (s), pressure and GNSS altitude (m), latitude and longitude (DDD.DDDDD°) and climb rate (m/s). Also provides functions for the analysis of the flight recorded within the IGC file.

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
Also ensure dplyr, hms and ggplot2 are installed;

```r
if(!require("dplyr")){
  install.packages("dplyr")
  library("dplyr")
}

if(!require("hms")){
  install.packages("hms")
  library("hms")
}

if(!require("ggplot2")){
  install.packages("ggplot2")
  library("ggplot2")
}

```
Using IGCparser
-----------------
The functions contained within the IGCparser package are;
- ```IGCparse()```, which parses the IGC file into a simple format for analysis.
- ```barogram()```, which creates a ggplot2 object, displaying the barogram for the flight.


Licence
----------------
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

Refer to the above link or the LICENCE file for more information.
