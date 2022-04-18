# Functions

casseroleinla <- function(df,casserolename){
  formula <- casseroleness ~ food + dish + argued
  dftemp <-  filter(df, casserole==casserolename)
  assign(paste("imod",casserolename), inla(formula, family="gaussian", data=dftemp))
}

casseroledf1 <- function(df, casserolename){
  assign(paste("imod",casserolename),casseroleinla(df, casserolename))
}
casseroledf2 <- function(df, casserolename){
  (casseroledf1(df, casserolename))$summary.fitted.values %>% mutate(casserole=casserolename)
}