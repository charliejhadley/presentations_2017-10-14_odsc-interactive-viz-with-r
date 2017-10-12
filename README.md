# Interactive Data Visualisation with R (and just R) Workshop for ODSC 2017

These training materials are made available for attendees of the Interactive Data Visualisation with R (and just R) workshop for ODSC 2017.

Details about the workshop are available here: https://odsc.com/training/portfolio/interactive-visualisation-r-just-r

# Workshop Attendees: BEFORE ATTENDING PLEASE DO THE FOLLOWING

## Setting up R, RStudio and all the packages

You must follow all of these steps BEFORE arriving to the workshop:

- An installation of R [https://cran.r-project.org/](https://cran.r-project.org/)
- An installation of RStudio [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/)

Before arriving at the workshop, please run the following code in RStudio:

```r
install.packages("tidyverse")
install.packages("gapminder")
install.packages("shiny")
install.packages("leaflet")
install.packages("highcharter")
install.packages("plotly")
install.packages("visNetwork")
install.packages("RColorBrewer")
```

The following package also needs to be installed, if you have ANY problems when installaing the package please refer to the instructions [https://github.com/r-spatial/sf](https://github.com/r-spatial/sf):


```r
install.packages("sf")
```

Provided the above package installs correctly please also run the following code:

```r
install.packages("statesRcontiguous")
```

## Obtaining the course materials

*As close as possible to the course* please download the materials in this repository ([https://github.com/martinjhnhadley/2017-odsc-interactive-viz-with-R](https://github.com/martinjhnhadley/2017-odsc-interactive-viz-with-R)). Here's a short URL [https://goo.gl/TXTrz3](https://goo.gl/TXTrz3).

Click on "Clone or download" and select "Download as ZIP". Ensure to unzip the folders to a convenient location.

<img src="/download-repo.png" width="400">

# About the instructor

The instructor for this course is [Martin John Hadley](https://www.linkedin.com/in/martinjohnhadley/). Martin delivers training courses and workshops on R for data science for a variety of online learning platforms, he's also available for independent consultancy work (if you're interested).

# License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.