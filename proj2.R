
# install.packages("sparklyr")
# library(sparklyr)
# spark_install()

library(tidyverse)
library(sparklyr)

setwd("c:/temp/cpsc375proj2/")

# mylocaldata <- read_csv ("http://staff.pubhealth.ku.dk/~tag/Teaching/share/data/Bodyfat.csv")
mylocaldata <- read_csv("Bodyfat.csv")

sc <- spark_connect(master = "local")
myremotedata <- copy_to(sc, mylocaldata, overwrite = TRUE)
# our group's formula for the best model that describes bodyfat
# bodyfat ~ Wrist + log(Abdomen) + Weight^2
# unfortunately, ml_linear_regression has a problem with the log and exponent functions \
# so we have to simplify the formula
mymodel <- ml_linear_regression(x=myremotedata , formula = bodyfat~Wrist+Abdomen+Weight)

summary(mymodel)

spark_web(sc)
