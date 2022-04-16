source(str_c(ps::ps_cwd(),"/Cleaning.R"))
source(str_c(ps::ps_cwd(),"/Functions.R"))
source("Functions.R")

#Modelling

dfmodel <- casseroledf2(casseroles[1])

for (i in 2:10){
  dftemp <- casseroledf2(casseroles[i])
  dfmodel <- rbind(dfmodel,dftemp)}


rm(df1,df,dftemp,i)
