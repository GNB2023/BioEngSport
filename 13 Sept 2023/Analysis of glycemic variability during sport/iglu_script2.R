# tidyverse package installation
install.packages("tidyverse")

# iglu package installation with vignette
devtools::install_github("irinagain/iglu", build_vignettes = TRUE)

# call libraries
library(tidyverse)
library(iglu)

# set path from which get the data to be analyzed
setwd('C:yourpath/data')
files <-list.files(path = ".")

#START ANALYSIS

data_all=data.frame()
active_all=data.frame()


for (i in 1: 5)
{

  data <- read.csv(files[i])
  active<- active_percent(data)
  
  
  data_all<-rbind(data_all,data)
  active_all<-rbind(active_all,active)
  
  # yourcode

}

#END ANALYSIS


