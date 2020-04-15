# Load the necessary packages
library(readr)
library(readxl)
library(tidyr)
library(tidyverse)
library(plyr)
library(data.table)

# Load all data tables
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

# Load code list tablee
CodeList <- read_excel("Downloads/UNSD — Methodology.xlsx", sheet = "Sheet1")

# Store the names of dataframes into a vector
DFs <- list(PopulationGrowth, MigrantsRefugees, PopulationDensity, Fertility, EducationSpending, Education,
         Unemployment, GDP, HealthSpending, WomenPolitics, Industry, Patents, MFEducation, RDStaff,
         RDGDP, Crime, HealthStaff, WaterSanitation, CO2, Internet, Land, Energy, ThreatenedSpecies)

# Spread all dataframes, make row-row variables into row-column variables
DFs <- lapply(DFs, function(x) {x <- spread(x, Series, Value)})

# Keep only the most recent entry for each country
DFs <- lapply(DFs, function(x){x[tapply(1:nrow(x),x$"Region/Country/Area",function(ii) ii[which.max(x$"Year"[ii])]),]})
DFs <- lapply(DFs, function(x){x[,-2]})

# Join all dataframes into one by country name (X2)
UNData <- Reduce(function(...) merge(..., all=TRUE), DFs)

# Remove all non-country rows and substitute codes for country names
UNData <-UNData[(UNData$"Region/Country/Area" %in% CodeList$"Code"),]
names(UNData)[1] <- "Code"
names(CodeList)[1] <- "Region/Country/Area"
UNData <- join(UNData, CodeList); rm(CodeList)
UNData <- UNData[,c(139,2:138)]
names(UNData)[1] <- "Country"

# Keep columns with at least 50 non-NA values
UNData <- as.data.frame(UNData)
iKeep <- as.logical(c())
for(i in 1:ncol(UNData)){
  iKeep <- c(iKeep, sum(is.na(UNData[,i])) <= (nrow(UNData)-50))
}
UNData <- UNData[,iKeep]

# Keep rows with at least 50 non-NA values
iKeep <- as.logical(c())
for(i in 1:nrow(UNData)){
  iKeep <- c(iKeep, sum(is.na(UNData[i,])) <= (ncol(UNData)-50))
}
UNData <- UNData[iKeep,]

# Create histograms for each variable
plotnum <- 0
for(i in 2:ncol(UNData)){
  ivar <- names(UNData[i])

  plotname <- paste0("Plot",plotnum+1,".png")

  png(paste0("Plots/", plotname),width=750,height=500,units="px")

  hist(UNData[,i], col="#2C3E50", breaks=100,
                    main = paste("Histogram of:", ivar, sep="\n"),
                    xlab= ivar)

  dev.off()

  cat(paste("Variable index =", i),
      paste("Plot name:", plotname),
      paste("Plotted variable:",ivar),
      paste("DONE!"),
      cat("\n"),
      sep ="\n")

  plotnum <- plotnum + 1
}

# Calculate Rsquared and Pvalue of Ftest of univariate linear fit
UnivarSumm <- NULL

for(i in 2:(ncol(UNData)-1)){
  for(j in (i+1):ncol(UNData)){
    itest1 <- !is.na(UNData[i])
    itest2 <- !is.na(UNData[j])
    itest <- itest1 + itest2
    itest[itest == 1] <- 0
    itestsum <- sum(itest)
    if (itestsum > 0){
      imod <- lm(UNData[,i] ~ UNData[,j], na.action = na.exclude)
      isumm <- summary(imod)
      irsq <- isumm["adj.r.squared"]
      ipval <- pf(isumm$fstatistic[1],isumm$fstatistic[2],isumm$fstatistic[3],lower.tail=F)
      UnivarSumm <- rbind(UnivarSumm, data.frame(i, j, irsq, ipval))
    }
    else {
      next
    }
  }
}

# Keep only the high regressions and low pvalues
UnivarSumm <- UnivarSumm[abs(UnivarSumm$adj.r.squared) <= .75, ]
UnivarSumm <- UnivarSumm[abs(UnivarSumm$adj.r.squared) >= .50, ]
UnivarSumm <- UnivarSumm[UnivarSumm$ipval < 0.01, ]

# Create scatterplots for each variable pair
for(z in 1:nrow(UnivarSumm)){
    i <- UnivarSumm$i[z]
    j <- UnivarSumm$j[z]
    ivar1 <- names(UNData[i])
    ivar2 <- names(UNData[j])

    plotname <- paste0("Plot",plotnum+1,".png")

    png(paste0("Plots/", plotname),width=750,height=500,units="px")

    plot(UNData[,i], UNData[,j], col="#2C3E50",
         main = paste("Scatterplot for:", ivar1, ivar2, sep="\n"),
         xlab= ivar1,
         ylab= ivar2)

    dev.off()

    cat(paste("Variable index =", i),
        paste("Plot name:", plotname),
        paste("Plotted variables:",ivar1,ivar2),
        paste("DONE!"),
        cat("\n"),
        sep ="\n")
    plotnum <- plotnum + 1
}
