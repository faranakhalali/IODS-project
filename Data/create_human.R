# Faranak Halali
# Week 4, Clustering and classification, 23.11.2019

# Reading data
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# Exploring the datasets
str(hd)
dim(hd)
str(gii)
dim(gii)
summary(hd)
summary(gii)

# Renaming the variables in hd data
library(dplyr)
names(hd)[names(hd) == "Human.Development.Index..HDI"] <- "HDI"
names(hd)[names(hd) == "Life.Expectancy.at.Birth"] <- "LE.B"
names(hd)[names(hd) == "Expected.Years.of.Education"] <- "EY.Edu"
names(hd)[names(hd) == "Mean.Years.of.Education"] <- "Mean.Edu"
names(hd)[names(hd) == "Gross.National.Income..GNI..per.Capita"] <- "GNI"
names(hd)[names(hd) == "GNI.per.Capita.Rank.Minus.HDI.Rank"] <- "GNI-HDI.R"

# Renaming the variables in gii data
names(gii)[names(gii) == "Gender.Inequality.Index..GII."] <- "GII"
names(gii)[names(gii) == "Maternal.Mortality.Ratio"] <- "MMR"
names(gii)[names(gii) == "Adolescent.Birth.Rate"] <- "ABR"
names(gii)[names(gii) == "Percent.Representation.in.Parliament"] <- "Perc.R.P"
names(gii)[names(gii) == "Population.with.Secondary.Education..Female."] <- "Second.Edu.F"
names(gii)[names(gii) == "Population.with.Secondary.Education..Male."] <- "Second.Edu.M"
names(gii)[names(gii) == "Labour.Force.Participation.Rate..Female."] <- "Lab.Part.Rate.F"
names(gii)[names(gii) == "Labour.Force.Participation.Rate..Male."] <- "Lab.Part.Rate.M"

# Create 2 new variables in gii data
gii <- mutate(gii, edu2.ratio = Second.Edu.F / Second.Edu.M)
gii<- mutate(gii, LabF.ratio = Lab.Part.Rate.F / Lab.Part.Rate.M)

# Join the two datasets
join_by <- c("Country")
human <- inner_join(hd, gii, by = join_by, suffix = c(".hd", ".gii"))
dim(human)
# Looks good. 195 observations with 19 variables.

# Save the data
write.csv(human, "~/IODS-project/Data/human.csv")




              
