# Load the necessary packages
library(readr)
library(readxl)
library(tidyr)
library(tidyverse)
library(plyr)

# Load all tables
PopulationGrowth <- read_csv("Downloads/SYB61_253_Population Growth Rates in Urban areas and Capital cities.csv",
                              col_types = cols(`Capital City` = col_skip(), `Capital City footnote` = col_skip(),
                              Footnotes = col_skip(), `Region/Country/Area` = col_number(), Series = col_character(),
                              Source = col_skip(), Value = col_number(), X2 = col_skip(),Year = col_number()), 
                              na = "NA", skip = 1)
MigrantsRefugees <- read_csv("Downloads/SYB62_327_201907_International Migrants and Refugees.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
PopulationDensity <- read_csv("Downloads/SYB62_1_201907_Population, Surface Area and Density.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Fertility <- read_csv("Downloads/SYB62_246_201907_Population Growth, Fertility and Mortality Indicators.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
EducationSpending <- read_csv("Downloads/SYB62_245_201905_Public Expenditure on Education.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Education <- read_csv("Downloads/SYB62_309_201906_Education.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Unemployment <- read_csv("Downloads/SYB62_329_201904_Labour Force and Unemployment.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
GDP <- read_csv("Downloads/SYB62_230_201904_GDP and GDP Per Capita.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
HealthSpending <- read_csv("Downloads/SYB63_325_202003_Expenditure on Health.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
WomenPolitics <- read_csv("Downloads/SYB62_317_201905_Seats held by Women in Parliament.csv",
                              col_types = cols(Footnotes = col_skip(), `Last Election Date` = col_skip(),
                              `Last Election Date footnote` = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Industry <- read_csv("Downloads/SYB58_35_Index of industrial production.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Patents <- read_csv("Downloads/SYB62_264_201902_Patents.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
MFEducation <- read_csv("Downloads/SYB62_319_201906_Ratio of Girls to Boys in Education.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
RDStaff <- read_csv("Downloads/SYB62_285_201904_Research and Development Staff.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
RDGDP <- read_csv("Downloads/SYB62_286_201904_GDP on R&D.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Crime <- read_csv("Downloads/SYB62_328_201904_Intentional Homicides and Other Crimes.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
HealthStaff <- read_csv("Downloads/SYB62_154_201906_Health Personnel.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
WaterSanitation <- read_delim("Downloads/SYB62_315_201906_Water and Sanitation Services.csv", "\t",
                              escape_double = FALSE, col_types = cols(Footnotes = col_skip(),
                              `Region/Country/Area` = col_number(), Series = col_character(), Source = col_skip(),
                              Value = col_number(), X2 = col_skip(), Year = col_number()), na = "NA",
                              trim_ws = TRUE, skip = 1)
CO2 <- read_csv("Downloads/SYB60_312_Carbon Dioxide Emission Estimates.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Internet <- read_csv("Downloads/SYB62_314_201904_Internet Usage.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Land <- read_csv("Downloads/SYB62_145_201904_Land.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
Energy <- read_csv("Downloads/SYB62_263_201904_Production, Trade and Supply of Energy.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
ThreatenedSpecies <- read_csv("Downloads/SYB62_313_201907_Threatened Species.csv",
                              col_types = cols(Footnotes = col_skip(), `Region/Country/Area` = col_number(),
                              Series = col_character(), Source = col_skip(), Value = col_number(),
                              X2 = col_skip(), Year = col_number()), na = "NA", skip = 1)
CodeList <- read_excel("Downloads/UNSD — Methodology.xlsx", sheet = "Sheet1")

# Remove rows containing regional data
CO2 <- CO2[-c(1:16),]
Crime <- Crime[-c(1:6),]
Education <- Education[-c(1:495),]
Energy <- Energy[-c(1:280),]
Fertility <- Fertility[-c(1:560),]
GDP <- GDP[-c(1:836),]
Internet <- Internet[-c(1:145),]
Land <- Land[-c(1:685),]
MFEducation <- MFEducation[-c(1:329),]
Patents <- Patents[-c(1:22),]
PopulationDensity <- PopulationDensity[-c(1:899),]
PopulationGrowth <- PopulationGrowth[-c(1:290),]
RDGDP <- RDGDP[-c(1:39),]
Unemployment <- Unemployment[-c(1:600),]
WaterSanitation <- WaterSanitation[-c(1:276),]
WomenPolitics <- WomenPolitics[-c(1:240),]

# Spread all dataframes, make row-row variables into row-column variables
CO2 <- spread(CO2, Series, Value)
Crime <- spread(Crime, Series, Value)
Education <- spread(Education, Series, Value)
EducationSpending <- spread(EducationSpending, Series, Value)
Energy <- spread(Energy, Series, Value)
Fertility <- spread(Fertility, Series, Value)
GDP <- spread(GDP, Series, Value)
HealthSpending <- spread(HealthSpending, Series, Value)
HealthStaff <- spread(HealthStaff, Series, Value)
Industry <- spread(Industry, Series, Value)
Internet <- spread(Internet, Series, Value)
Land <- spread(Land, Series, Value)
MFEducation <- spread(MFEducation, Series, Value)
MigrantsRefugees <- spread(MigrantsRefugees, Series, Value)
Patents <- spread(Patents, Series, Value)
PopulationDensity <- spread(PopulationDensity, Series, Value)
PopulationGrowth <- spread(PopulationGrowth, Series, Value)
RDGDP <- spread(RDGDP, Series, Value)
RDStaff <- spread(RDStaff, Series, Value)
ThreatenedSpecies <- spread(ThreatenedSpecies, Series, Value)
Unemployment <- spread(Unemployment, Series, Value)
WaterSanitation <- spread(WaterSanitation, Series, Value)
WomenPolitics <- spread(WomenPolitics, Series, Value)

# Keep only the most recent entry for each country, define the function
RecentEntry <- function(x){x[tapply(1:nrow(x),x$"Region/Country/Area",function(ii) ii[which.max(x$"Year"[ii])]),]}

# Apply the function to all dataframes
CO2 <- RecentEntry(CO2)
Crime <- RecentEntry(Crime)
Education <- RecentEntry(Education)
EducationSpending <- RecentEntry(EducationSpending)
Energy <- RecentEntry(Energy)
Fertility <- RecentEntry(Fertility)
GDP <- RecentEntry(GDP)
HealthSpending <- RecentEntry(HealthSpending)
HealthStaff <- RecentEntry(HealthStaff)
Industry <- RecentEntry(Industry)
Internet <- RecentEntry(Internet)
Land <- RecentEntry(Land)
MFEducation <- RecentEntry(MFEducation)
MigrantsRefugees <- RecentEntry(MigrantsRefugees)
Patents <- RecentEntry(Patents)
PopulationDensity <- RecentEntry(PopulationDensity)
PopulationGrowth <- RecentEntry(PopulationGrowth)
RDGDP <- RecentEntry(RDGDP)
RDStaff <- RecentEntry(RDStaff)
ThreatenedSpecies <- RecentEntry(ThreatenedSpecies)
Unemployment <- RecentEntry(Unemployment)
WaterSanitation <- RecentEntry(Unemployment)
WomenPolitics <- RecentEntry(WomenPolitics)

# Join all dataframes into one by country name (X2)
UNData <- full_join(CO2, Crime, by = "Region/Country/Area"); rm(CO2, Crime)
UNData <- full_join(UNData, Education, by = "Region/Country/Area"); rm(Education)
UNData <- full_join(UNData, EducationSpending, by = "Region/Country/Area"); rm(EducationSpending)
UNData <- full_join(UNData, Energy, by = "Region/Country/Area"); rm(Energy)
UNData <- full_join(UNData, Fertility, by = "Region/Country/Area"); rm(Fertility)
UNData <- full_join(UNData, GDP, by = "Region/Country/Area"); rm(GDP)
UNData <- full_join(UNData, HealthSpending, by = "Region/Country/Area"); rm(HealthSpending)
UNData <- full_join(UNData, HealthStaff, by = "Region/Country/Area"); rm(HealthStaff)
UNData <- full_join(UNData, Industry, by = "Region/Country/Area"); rm(Industry)
UNData <- full_join(UNData, Internet, by = "Region/Country/Area"); rm(Internet)
UNData <- full_join(UNData, Land, by = "Region/Country/Area"); rm(Land)
UNData <- full_join(UNData, MFEducation, by = "Region/Country/Area"); rm(MFEducation)
UNData <- full_join(UNData, MigrantsRefugees, by = "Region/Country/Area"); rm(MigrantsRefugees)
UNData <- full_join(UNData, Patents, by = "Region/Country/Area"); rm(Patents)
UNData <- full_join(UNData, PopulationDensity, by = "Region/Country/Area"); rm(PopulationDensity)
UNData <- full_join(UNData, PopulationGrowth, by = "Region/Country/Area"); rm(PopulationGrowth)
UNData <- full_join(UNData, RDGDP, by = "Region/Country/Area"); rm(RDGDP)
UNData <- full_join(UNData, RDStaff, by = "Region/Country/Area"); rm(RDStaff)
UNData <- full_join(UNData, ThreatenedSpecies, by = "Region/Country/Area"); rm(ThreatenedSpecies)
UNData <- full_join(UNData, Unemployment, by = "Region/Country/Area"); rm(Unemployment)
UNData <- full_join(UNData, WaterSanitation, by = "Region/Country/Area"); rm(WaterSanitation)
UNData <- full_join(UNData, WomenPolitics, by = "Region/Country/Area"); rm(WomenPolitics)

# Remove all the year variables from the data frame
UNData <- UNData[, -grep("^Year", colnames(UNData))]

# Remove all non-country rows and substitute codes for country names
UNData <-UNData[(UNData$"Region/Country/Area" %in% CodeList$"Code"),]
names(UNData)[1] <- "Code"
names(CodeList)[1] <- "Region/Country/Area"
UNData <- join(UNData, CodeList)
UNData <- UNData[,c(139,2:138)]
