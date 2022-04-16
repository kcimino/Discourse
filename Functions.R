# Functions

casseroleinla <- function(casserolename){
  formula <- casseroleness ~ food + dish
  dftemp <-  filter(df1, casserole==casserolename)
  assign(paste("imod",casserolename), inla(formula, family="gaussian", data=dftemp))
}

casseroledf1 <- function(casserolename){
  assign(paste("imod",casserolename),casseroleinla(casserolename))
}
casseroledf2 <- function(casserolename){
  (casseroledf1(casserolename))$summary.fitted.values %>% mutate(casserole=casserolename)
}