# Faranak Halali
# Week 6, Analysis of longitudinal data, 06.12.2019
# Data source 1: https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt
# Data source 2: https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt


# Reading data
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')


# Exploring BPRS dataset
names(BPRS)
summary(BPRS)
str(BPRS)

# Exploring RATS dataset
names(RATS)
summary(RATS)
str(RATS)

# Convert the categorical variables of BPRS dataset to factors
library(dplyr)
library(tidyr)
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
glimpse(BPRS)

# Convert the categorical variables of RATS dataset to factors
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
glimpse(RATS)

# Converting BPRS data to long form and adding the week variable
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))
glimpse(BPRSL)

# Converting RATS data to long form and adding the Time variable
RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4)))
glimpse(RATSL)

# Exploring new long-form datasets
names(BPRSL)
str(BPRSL)
summary(BPRSL)
names(RATSL)
str(RATSL)
summary(RATSL)

# Saving datasets
write.csv(BPRSL, "~/IODS-project/Data/BPRSL.csv")
write.csv(RATSL, "~/IODS-project/Data/RATSL.csv")
