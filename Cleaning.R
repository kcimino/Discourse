library(tidyverse)
library(qacBase)
library(INLA)
df <- read_csv("Discourse Voting (Responses) - Form Responses 1(4).csv")
df <- df %>% 
  select(-Timestamp,-Name,-`Who had the most pedantic/punny argument?  (Only answer this if it is after arguments have been made)`) %>%
  # This example replaces spaces and periods with an underscore and converts everything to lower case
  select_all(~gsub("\\s+|\\.", "_", .)) %>% 
  select_all(tolower)

casseroles <- c(names(df[-1]))

df1 <- pivot_longer(df,cols=casseroles, names_to = "casserole", values_to = "casseroleness")

notargued <- c("broccoli_casserole","dirt")
isnotfood= c("a_flower_pot","dirt","a_desert_valley")
isindish= c("water_baked_in_a_casserole_dish","a_dessert_casserole","broccoli_casserole","a_flower_pot","french_onion)soup")

df1 <- df1 %>%  mutate(food=ifelse(casserole%in%isnotfood,0,1),
                       dish=ifelse(casserole%in%isindish,1,0),
                       argued=ifelse(casserole %in% notargued,0,1)) %>% 
  rename("before_or_after"="is_this_before_or_after_arguments?")

dfbefore <- df1 %>% filter(`before_or_after`=="Before")
dfafter <- df1 %>% filter(`before_or_after`=="After")
