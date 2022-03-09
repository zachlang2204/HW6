library(tidyverse)
HAPPY = readRDS('data/HAPPY.RDS')

levels(HAPPY$happy)
head(HAPPY)

HAPPY <- replace(HAPPY, HAPPY == "IAP" , NA)
HAPPY <- replace(HAPPY, HAPPY == "DK" , NA)
HAPPY <- replace(HAPPY, HAPPY == "NA" , NA)

HAPPY <- HAPPY %>% mutate(
  age = replace(AGE, AGE == "89 AND OLDER", 89),
  age = as.numeric(age)
) %>% select(-AGE)

HAPPY$HAPPY = as.factor(HAPPY$HAPPY)
HAPPY$SEX = as.factor(HAPPY$SEX)
HAPPY$MARITAL = as.factor(HAPPY$MARITAL)
HAPPY$DEGREE = as.factor(HAPPY$DEGREE)
HAPPY$FINRELA = as.factor(HAPPY$FINRELA)
HAPPY$HEALTH = as.factor(HAPPY$HEALTH)
HAPPY$PARTYID = as.factor(HAPPY$PARTYID)
HAPPY$POLVIEWS = as.factor(HAPPY$POLVIEWS)

HAPPY$DEGREE = factor(HAPPY$DEGREE, levels=c("LT HIGH SCHOOL", "HIGH SCHOOL", "JUNIOR COLLEGE", "BACHELOR", "GRADUATE"))
HAPPY$HEALTH = factor(HAPPY$HEALTH, levels=c("POOR","FAIR","GOOD","EXCELLENT"))
HAPPY$FINRELA = factor(HAPPY$FINRELA, levels=c("FAR BELOW AVERAGE","BELOW AVERAGE","AVERAGE","ABOVE AVERAGE","FAR ABOVE AVERAGE"))


ggplot(HAPPY, aes(x = HAPPY, fill=SEX))+ geom_bar() + facet_wrap(HAPPY$MARITAL) +coord_flip()
