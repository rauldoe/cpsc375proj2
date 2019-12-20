
# install.packages("sparklyr")
# library(sparklyr)
# spark_install()

library(tidyverse)
library(sparklyr)

# mylocaldata <- read_csv ("http://staff.pubhealth.ku.dk/~tag/Teaching/share/data/Bodyfat.csv")
mylocaldata <- read_csv("Bodyfat.csv")

sc <- spark_connect(master = "local")
myremotedata <- copy_to(sc, mylocaldata)
mymodel <- ml_linear_regression(x=myremotedata , formula = bodyfat ~ Weight + Height)
summary(mymodel)
