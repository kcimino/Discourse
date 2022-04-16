source("CLeaning.R")
source("Functions.R")

#Modelling

dfmodel <- casseroledf2(casseroles[1])
rbind(dfmodel,dfbroc1)

for (i in 2:10){
  dftemp <- casseroledf2(casseroles[i])
  dfmodel <- rbind(dfmodel,dftemp)}
