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
This library is licenced under the GNU Lesser General Public License v2.1, for more information read the LICENCE file.
