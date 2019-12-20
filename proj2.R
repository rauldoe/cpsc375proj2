
# install.packages("sparklyr")
# library(sparklyr)
# spark_install()

library(sparklyr)

mylocaldata <- read_csv ("http://staff.pubhealth.ku.dk/~tag/Teaching/share/data/Bodyfat.csv")
library(sparklyr)
sc <- spark_connect(master = "local")
myremotedata <- copy_to(sc, mylocaldata)
mymodel <- ml_linear_regression(x=myremotedata , formula = bodyfat ~ Weight + Height)
summary(mymodel)
