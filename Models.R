source(str_c(ps::ps_cwd(),"/Cleaning.R"))
source(str_c(ps::ps_cwd(),"/Functions.R"))


# Modelling before

dfmodelbefore <- casseroledf2(dfbefore, casseroles[1])

for (i in 2:10){
  dftemp <- casseroledf2(dfbefore,casseroles[i])
  dfmodelbefore <- rbind(dfmodelbefore,dftemp)}


dfmodelbefore <- dfmodelbefore%>% mutate(food=ifelse(casserole%in%isnotfood,"No","Yes"),
                                   dish=ifelse(casserole%in%isindish,"Yes","No"),
                                   argued=ifelse(casserole%in%notargued,"No","Yes"))


# Modelling after

dfmodelafter <- casseroledf2(dfafter, casseroles[1])

for (i in 2:10){
  dftemp <- casseroledf2(dfafter,casseroles[i])
  dfmodelafter <- rbind(dfmodelafter,dftemp)}

dfmodelafter <- dfmodelafter%>% mutate(food=ifelse(casserole%in%isnotfood,"No","Yes"),
                                         dish=ifelse(casserole%in%isindish,"Yes","No"),
                                       argued=ifelse(casserole%in%notargued,"No","Yes"))

rm(df1,df,dftemp,i)
