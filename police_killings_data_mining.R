# Süha TANRIVERDI 201611689 CENG 464 Data Mining   -   FINAL PROJECT

# =========================== PREPARING for WORKING DIRECTORY ===========================

# Get Current Working Directory
getwd()
# setwd(choose.dir()) # Select the working directory interactively
# select a different working directory with the function setwd(), 
# and thus avoid entering the full path of the data files.
setwd("C:/Users/melo/Desktop/Projects/CENG464 Data Mining FINAL PROJECT")

# Sample Installing Package Format
# install.packages("ABC") # This will install the package –-ABC--. A window will pop-up, select a
# # mirror site to download from (the closest to where you are) and click ok.
# library(ABC) # Load the package –-ABC-– to your workspace

# DataSet Import
# This is default(Original), initial dataset, it has missing, NA, empty, outliers!
dataset = read.csv('police_killings2.csv')

# Following will remove all Rows including at least one NA(s), We dont want this one!
# dataset_clear_nas = na.omit(dataset)
# Because there may have some rows that have useful information, eventhough they have NAs!
# We can do that but we will not for now, let's analyze, preprocess and clean the data;


# =========================== ANALYZE the DATA ===========================

# **********************************
# This three lines of code will bring everything we need and report actually, but we need to learn :)
install.packages("DataExplorer")
library(DataExplorer)
DataExplorer::create_report(dataset)
# **********************************

# Some R functions for computing descriptive statistics:
# Mean	mean()
# Standard deviation	sd()
# Variance	var()
# Minimum	min()
# Maximum	maximum()
# Median	median()
# Range of values (minimum and maximum)	range()
# Sample quantiles	quantile()
# Generic function	summary()
# Interquartile range	IQR()

dim(dataset) # dimensions of data
# Data Types
# list types for each attribute
sapply(dataset, class)

# Many ways
library(Hmisc)
Hmisc::describe(dataset)

# with desc
library(pastecs)
stat.desc(dataset)
# 
library(psych)
psych::describe(dataset)

# This is better, it will create a table
descData <- summarytools::descr(convertedData)
View(descData)

# Another Sample Summary
colSummary = apply(dataset, 2, summary)
colSummary

#Data Summary
summary(dataset) # Provides basic descriptive statistics and frequencies.

# edit(dataset) # Open data editor, for quick usage
# Alternative Data Types and Structure
str(dataset) # Provides the structure of the dataset

# Variable types in R;
# The basic types in R are as follows;
# numeric -> Numeric data (approximations of the real numbers, R)
# integer -> Integer data (whole numbers, ℤ)
# factor -> Categorical data (simple classifications, like gender)
# ordered -> Ordinal data (ordered classifications, like educational level)
# character -> Character data (strings)
# raw Binary -> Data

names(dataset) # Lists variable names in the dataset

# Other Samples
head(dataset) # First 6 rows of dataset
head(dataset, n=10)# First 10 rows of dataset
head(dataset, n= -10) # All rows but the last 10
tail(dataset) # Last 6 rows
tail(dataset, n=10) # Last 10 rows
tail(dataset, n= -10) # All rows but the first 10
dataset[1:10, ] # First 10 rows
dataset[1:10,1:3] # First 10 rows of data of the first 3 variables

# We have many different types of data, so we need to seperate them to plot;
AttrTypes <- split(names(dataset),sapply(dataset, function(x) paste(class(x), collapse=" ")))

# ------> NUMERIC ATTRIBUTES
numericAttr <- unlist(lapply(dataset, is.numeric))  
numberOfNumerics = sum(numericAttr, na.rm = TRUE) # It counts TRUE values in our dataset, means that
# Number of Numeric Attributes we have -> 17

# With the par() function, we can include the option mfrow=c(nrows, ncols)
# to create a matrix of nrows x ncols plots that are filled in by row.
# mfcol=c(nrows, ncols) fills in the matrix by columns.
# Create HISTOGRAMS for each Numeric attribute
par(mfrow=c(1,6))
# par(mar = rep(2, 3)) # img size
for(col in 1:ncol(dataset)) {
  if(numericAttr[col]) {
    hist(dataset[,col], main=names(dataset)[col], breaks=12, col="gray")
  }
}

# Create DENSITY PLOT for each Numeric attribute
par(mfrow=c(1,6))
# par(mar = rep(2, 3)) # img size
for(col in 1:ncol(dataset)) {
  if(numericAttr[col]) {
    d <- density(dataset[,col])
    plot(d, main=names(dataset)[col])
    polygon(d, col="gray", border="blue")
  }
}
# Because some attributes contains missing values it gives an error, here


# ------> CATEGORICAL ATTRIBUTES
numberOfCategoricals = sum(numericAttr, na.rm = FALSE) # It counts FALSE values in our dataset, means that
# Number of Categorical Attributes we have -> 17
# Create HISTOGRAMS for each Numeric attribute
par(mfrow=c(1,1))
# par(mar = rep(2, 3)) # img size
for(col in 1:ncol(dataset)) {
  if(numericAttr[col] == "FALSE") {
    plot(dataset[,col], main=names(dataset)[col],  breaks=0.1)
  }
}

# We can also use ggplot2 library
library(ggplot2)
library(magrittr)
library(ggpubr)
# This operation take some time, be aware of that!
ggplot(dataset, aes(dataset$name, fill=name)) + geom_bar()
ggplot(dataset, aes(dataset$age, fill=age)) + geom_density()
ggplot(dataset, aes(dataset$gender, fill=gender)) + geom_bar()
ggplot(dataset, aes(dataset$raceethnicity, fill=raceethnicity)) + geom_density()
ggplot(dataset, aes(dataset$month, fill=month)) + geom_bar()
ggplot(dataset, aes(dataset$streetaddress, fill=streetaddress)) + geom_bar()
ggplot(dataset, aes(dataset$city, fill=city)) + geom_bar()
ggplot(dataset, aes(dataset$state, fill=state)) + geom_bar()
ggplot(dataset, aes(dataset$namelsad, fill=namelsad)) + geom_bar()
ggplot(dataset, aes(dataset$lawenforcementagency, fill=lawenforcementagency)) + geom_bar()
ggplot(dataset, aes(dataset$cause, fill=cause)) + geom_bar()
ggplot(dataset, aes(dataset$armed, fill=armed)) +geom_bar(width = 1)+
  coord_polar("y")
ggplot(dataset, aes(dataset$share_white, fill=share_white)) + geom_bar()
ggplot(dataset, aes(dataset$share_black, fill=share_black)) + geom_bar()
ggplot(dataset, aes(dataset$share_hispanic, fill=share_hispanic)) + geom_bar()
ggplot(dataset, aes(dataset$p_income, fill=p_income)) + geom_line()
ggplot(dataset, aes(dataset$pov, fill=pov)) + geom_bar()

# geom_density(), geom_point(), 

# Fit The Screen, One by One
plot(dataset$name, main=names(dataset)["name"],  breaks=0.1)
plot(dataset$age, main=names(dataset)["age"],  breaks=0.1)
plot(dataset$gender, main=names(dataset)["gender"],  breaks=0.1)
plot(dataset$raceethnicity, main=names(dataset)["raceethnicity"],  breaks=0.1)
plot(dataset$month, main=names(dataset)["month"],  breaks=0.1)
plot(dataset$streetaddress, main=names(dataset)["streetaddress"],  breaks=0.1)
plot(dataset$city, main=names(dataset)["city"],  breaks=0.1)
plot(dataset$state, main=names(dataset)["state"],  breaks=2)
plot(dataset$namelsad, main=names(dataset)["namelsad"],  breaks=0.1)
plot(dataset$lawenforcementagency, main=names(dataset)["lawenforcementagency"],  breaks=0.1)
plot(dataset$cause, main=names(dataset)["cause"],  breaks=0.1)
plot(dataset$armed, main=names(dataset)["armed"],  breaks=0.1)
plot(dataset$share_white, main=names(dataset)["share_white"],  breaks=0.1)
plot(dataset$share_black, main=names(dataset)["share_black"],  breaks=0.1)
plot(dataset$share_hispanic, main=names(dataset)["share_hispanic"],  breaks=0.1)
plot(dataset$p_income, main=names(dataset)["p_income"],  breaks=0.1)
plot(dataset$pov, main=names(dataset)["pov"],  breaks=0.1)

# For Categorical Data, We can also use Tables;
table(dataset$raceethnicity)
readgender <- table(dataset$raceethnicity,dataset$gender)
readgender
addmargins(readgender) # Adding row/col margins

# Some Interesting Parts about Race
table(dataset$raceethnicity)
readgender <- table(dataset$raceethnicity, dataset$cause)
readgender
addmargins(readgender) # Adding row/col margins
hist(readgender)

# Some Interesting Parts about Armed
table(dataset$raceethnicity)
readgender <- table(dataset$raceethnicity, dataset$armed)
readgender
addmargins(readgender) # Adding row/col margins
hist(readgender)

# Some Interesting Parts about state
table(dataset$raceethnicity)
readgender <- table(dataset$raceethnicity, dataset$state)
readgender
addmargins(readgender) # Adding row/col margins
hist(readgender)


# ============= Dealing with Missing data ==========

datasetRem = dataset # removed some attributes
# when the data contains missing values, 
# some R functions will return errors or NA even if just a single value is missing.

sapply(datasetRem, function(x) sum(is.na(x)))
rowSums(is.na(datasetRem)) # Number of missing per row
colSums(is.na(datasetRem)) # Number of missing per column/variable

# We can now save all attributes which have missing values
missingAttr = colnames(datasetRem)[colSums(is.na(datasetRem)) > 0]

# ============= REMOVING UNNECESSARY ATTRIBUTES! ============= 

# There are also some attributes which contains NAs. If ratio is over the 20% they will be removed
sum(is.na(datasetRem))/prod(dim(datasetRem))
# There are many attributes(columns) which do not effect the result of mining process such as;
# ID, Street Adress, Name, latitude, longitude(Coordinates),  etc.
# and "year" attribute is also unnecessary because this data is already for year 2015.
# We can use following format to remove an attribute;
# datasetRem$columnname <- NULL
# Let's remove these attributes;
datasetRem$name <- NULL
datasetRem$streetaddress <- NULL
datasetRem$month <- NULL # Not Sure
datasetRem$day <- NULL # Not Sure (Some Special Days like Victory Day can have impact?? vs..)
datasetRem$year <- NULL # All of them are already 2015 
# datasetRem$city <- NULL # Not Sure, Some cities may have more crime rates than other, this may be important actually
# datasetRem$state <- NULL # Not Sure
datasetRem$latitude <- NULL
datasetRem$longitude <- NULL
datasetRem$state_fp <- NULL
datasetRem$county_fp <- NULL
datasetRem$tract_ce <- NULL
datasetRem$geo_id <- NULL
datasetRem$county_id <- NULL
datasetRem$namelsad <- NULL
datasetRem$lawenforcementagency <- NULL

# See Cleared Attributes, Updated Dataset;
dim(datasetRem)

# !!!! AGE -> FACTOR!
# AGE attribute is factor we need to convert to numeric
datasetRem$age <- as.numeric(as.character(datasetRem$age))
# NOW AGE is NUMERIC

# FILLING MISSINGS with COLUMN MEAN
# We can Automatically Fill over Missing Values over all Attributes with Columwise MEAN
for(i in 1:ncol(datasetRem)){
  datasetRem[is.na(datasetRem[,i]), i] <- mean(datasetRem[,i], na.rm = TRUE)
}

# ROUNDING FILLED VALUES
# [1] "h_income"   "comp_income"  "county_bucket"   "nat_bucket"   "urate"   "college" -> FILLED ATTRIBUTES
# Since we are not interested in having decimal places for Filled Attributes 
# We will round it up using the below code.
# The argument 0 in the round function means no decimal places.

# For "age"
datasetRem$age = as.numeric(format(round(datasetRem$age, 0)))
# For "county_bucket"
datasetRem$county_bucket = as.numeric(format(round(datasetRem$county_bucket, 0)))
# For "nat_bucket"
datasetRem$nat_bucket = as.numeric(format(round(datasetRem$nat_bucket, 0)))

# Let's check missings again with new Data
colnames(datasetRem)[colSums(is.na(datasetRem)) > 0]

# ================= UNKNOWN Rows ==============
# We have also many Unknown tuples in  Age, Race, Cause and Armed
# ****** 
# Raceethnicity, Cause and Armed Attributes also have Unknown values, But these are categorical not numeric so we need to fix this issue;
# Number of Unknown rows are 25 which is not so much so we can ignore them
Race = datasetRem[!grepl("Unknown", datasetRem$raceethnicity),]
Cause = Race[!grepl("Unknown", Race$cause),]
DataUn = Cause[!grepl("Unknown", Cause$armed),]

# No missings, and unknowns anymore here!
dataFD = DataUn

# ================= Some Rows(2 actually) Contains "-" and "0"  ==============
# We rearrenge row-id's
row.names(dataFD) <- NULL
# Remove specific rows in r
# remove rows by row number
dataFD <- dataFD[-c(178),] 
# We rearrenge row-id's again because we changed id's order by deleting a row
row.names(dataFD) <- NULL
dataFD <- dataFD[-c(363),] 
# These two rows contained "-" we removed them
row.names(dataFD) <- NULL

# ***
dataLatest = dataFD

# ================= EMPTY / BLANK Rows ==============
# Only CITY attribute has blank rows
# We can convert tham to NA
dataLatest[dataLatest==""]<-NA
# Then we remove that rows
dataLatest = na.omit(dataLatest)
row.names(dataLatest) <- NULL

## =================  Ekstra CHARACTERS Filtering, there is one row city named "CaÌ_å±on City" we need to fix this;
# This must be probably -> "Carlton City"
dataLatest$city <- as.character(dataLatest$city)
dataLatest[345,4] <- 'Carlton City'
dataLatest$city <- factor(dataLatest$city)
# value = "Carlton City"

# We export clear Dataset as CSV
write.csv(dataLatest, file = "datasetBACKUP.csv")

dataFD = dataLatest

# ================ CONVERTING CATEGORICAL ATTRIBUTES TO NUMERIC ================

# We can see how many different types the attributes have;
for (i in colnames(dataFD)){
    cats <- unique(dataFD[[i]])
    # print(unique(dataFD[[i]])) # show also all types
    print(i)
    print(length(cats))
}

# We have only 5 Categorical attributes right now, we need to convert them;
# Convert Gender 1 -> Female, 2 -> Male
dataFD$gender <- as.numeric(factor(dataFD$gender))
unique(dataFD$gender)

# Convert raceethnicity [1]Black [2]White [3]Hispanic/Latino [4]Unknown [5]Asian/Pacific Islander [6]Native American 
dataFD$raceethnicity <- as.numeric(factor(dataFD$raceethnicity))
unique(dataFD$raceethnicity)

# Convert city
# 306 Levels:  ... 
dataFD$city <- as.numeric(factor(dataFD$city))
unique(dataFD$city)

# Convert state
# 47 Levels: AK[1] AL AR AZ CA CO CT DC DE FL GA ... WY[47]
dataFD$state <- as.numeric(factor(dataFD$state))
unique(dataFD$state)

# Convert cause -> [1]Death in custody [2]Gunshot [3]Struck by vehicle [4]Taser [5]Unknown
dataFD$cause <- as.numeric(factor(dataFD$cause))
unique(dataFD$cause)

# Convert armed -> [1]Disputed [2]Firearm [3]Knife [4]No [5]Non-lethal [6]firearm [7]Other [8]Unknown [9]Vehicle
dataFD$armed <- as.numeric(factor(dataFD$armed))
unique(dataFD$armed)

row.names(dataFD) <- NULL # Fix Indexes

# */*/*/*/*/**

dataFS = dataFD
# There are still 4 factor attribute but contains numeric data, let's fix them (pov, share_white, share_black, share_hispanic, p_income);
str(dataFS)
sapply(dataFS, class)

# Care pov attribute, some problems while converting here, CONVERT pov to NUMERIC here;
dataFS <- transform(dataFS, class=as.numeric(as.character(dataFS$pov)))
# Then remove OLD POV attribute
dataFS$pov <- NULL
# Rename new Pov again;
colnames(dataFS)[20] <- "pov"

# Now we can Convert All Directly
indx <- sapply(dataFS, is.factor)
dataFS[indx] <- sapply(dataFS[indx], function(x) as.numeric(as.character(x)))

# Now every attribute is NUMERIC, we have all NUMERIC attributes!
dataAllNum = dataFS
# Take BACKUP, Just in Case
write.csv(dataAllNum, file = "dataAllNumeric.csv")

# Check OUTLIERS
boxplot(dataAllNum)


# =========================== FEATURE SELECTION ===========================
# There are probably unnecessary attributes, we choose best ones among them,
# The main reason why we use feature selection is there may have some unnecessary attributes in our data,
# We need to find the most valuable ones for our goal, and we need to continue with them.
# We need to find to best attributes, we can also have a look at correlated attributes! and missings.

# =------------> CORRELATION ANALYSIS
# Our data may contain attributes that are highly correlated with each other. 
# Many methods perform better if highly correlated attributes are removed.
# Correlation matrix is a table of correlation coefficients 
# for a group of attributes used to determine if a relationship exists between them. 
# A negative correlation describes the extent to which two variables move in opposite directions.
# We will have a look at our table attributes if there are any correlations between them;
# Simple method, The default method is Pearson, but we can also compute Spearman or Kendall coefficients.
Data_Cor = cor(dataAllNum)
hist(Data_Cor)

# Visualizing the correlation matrix
# There are several packages available for visualizing a correlation matrix in R. 
# One of the most common is the corrplot function. 
# We first need to install the corrplot package and load the library.
install.packages("corrplot")
library(corrplot)
# A default correlation matrix plot (called a Correlogram) is generated. 
corrplot(Data_Cor)

# We can also generate a Heatmap object again using our correlation coefficients as input to the Heatmap.
# Because the default Heatmap color scheme is quite unsightly, 
# we can first specify a color palette to use in the Heatmap. 
# The value at the end of the function specifies the amount of variation in the color scale. 
# Typically no more than 20 is needed here. We then use the heatmap function to create the output:
palette = colorRampPalette(c("green", "white", "red")) (20)
heatmap(x = Data_Cor, col = palette, symm = TRUE)

# Simple Correlatoin Analysis
cor(dataAllNum)

# *** Nice and simple visualisation, Half Version:
library(corrplot)
x <- cor(dataAllNum)
corrplot(x, type="upper", order="hclust")

# Other Correlogram Example
library(corrgram)
corrgram(dataAllNum, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Correlation Analysis")

# POV vs URATE? COMP_INCOME vs COLLEGE?
# There is a similarity between poverty - unemployment and comp_income - college. 
# I've hesitated between which one will be deleted.
# _-_-_-_-_-_- WE DECIDE REMOVING CORRELATED ATTRIBUTES (nat_bucket, p_income, h_income, country_bucket)
dataAllNum$p_income <- NULL
dataAllNum$h_income <- NULL
dataAllNum$nat_bucket <- NULL
dataAllNum$county_bucket <- NULL

# Now We have 16 Attributes
dim(dataAllNum)

# The Caret R package provides the findCorrelation which will analyze a correlation matrix of your data’s attributes 
# report on attributes that can be removed.
# Generally, you want to remove attributes with an absolute correlation of 0.75 or higher.
# *-*-*-*-*-*-*-*-*-*-*-> Remove Redundant Features
# Ensure the results are repeatable
set.seed(7)
# load the library
library(lattice)
library(mlbench)
library(caret)
# calculate correlation matrix
correlationMatrix <- cor(dataAllNum)
# summarize the correlation matrix
print(correlationMatrix)
# find attributes that are highly corrected (ideally > 0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
# print indexes of highly correlated attributes
print(highlyCorrelated)
# dataAllNum[16] -> pov
# dataAllNum[9] -> share_white
# dataAllNum[13] -> comp_income
# dataAllNum[14] -> urate
# SO WE ALSO NEED TO REMOVE THESE REDUNDANT ATTRIBUTES
dataAllNum$pov <- NULL
dataAllNum$share_white <- NULL
dataAllNum$comp_income <- NULL
dataAllNum$urate <- NULL
# we also don't need CAUSE
dataAllNum$cause <- NULL
# I think we also do not need County-level median household income,
# All these criminal events depends on personal evidences rather than the household income or any income
# Now We have 10 Attributes
dataAllNum$county_income <- NULL
# Now;
dim(dataAllNum)
# Let's Check Again
# *** Nice and simple visualisation, Half Version:
# AFTER REMOVING CORRELATED ATTRIBUTES, NEW DATA LOOKS LIKE;
library(corrplot)
x <- cor(dataAllNum)
corrplot(x, type="upper", order="hclust")

dataClear = dataAllNum


# =================== IMPORTANCE on ARMED Attribute =================== 
set.seed(4543)
dataRF <- randomForest(dataClear$armed ~ ., data=dataClear, ntree=1000,
                          keep.forest=FALSE, importance=TRUE)
importance(dataRF)
importance(dataRF, type=1)
# OUTPUT;
# The second measure is the total decrease in node impurities from splitting on the variable, averaged  over all trees. 
# For classification, the node impurity is measured by the Gini index. For regression, it  is measured by residual sum of squares


# =================== RANDOM FOREST on ARMED Attribute  ^+^+^+^^^^^^^^^^^^^^^^^^^^
# Import the random forest library and fit a model
library(randomForest)
fit_rf = randomForest(dataClear$armed~., data=dataClear)
# Create an importance based on mean decreasing gini
importance(fit_rf)
varImpPlot(fit_rf)
# # run for each Attribute
# for (i in colnames(dataClear)){
#   fit_rf = randomForest(dataClear[[i]]~., data=dataClear)
#   # Create an importance based on mean decreasing gini
#   importance(fit_rf)
# }


# =================== RANDOM FOREST SHOW IMPORTANCE
set.seed(71)
rf <-randomForest(dataClear$armed~.,data=dataClear, importance=TRUE,ntree=500)
print(rf)
#Evaluate variable importance
importance(rf)
varImpPlot(rf)


# ================== RFCV (Random Forest Cross-Valdidation for feature selection)
# This function shows the cross-validated prediction performance of models with sequentially reduced
# number of predictors (ranked by variable importance) via a nested cross-validation procedure.
result <- rfcv(dataClear, dataClear$armed, cv.fold=3)
with(result, plot(n.var, error.cv, log="x", type="o", lwd=2))

# We can use now feature selection algorithms to find which one is more valuable for us?
randFor = randomForest::randomForest(dataClear$armed~. , data = dataClear)
randFor
plot(randFor)

# BACKUP
remCorData = dataClear

# ====================== RECURSIVE FOREST ELIMINATION TEST (RFE)
# Recursive feature elimination (RFE) is a feature selection method that fits a model and 
# removes the weakest feature (or features) until the specified number of features is reached. 
# Features are ranked by the model’s coef_ or feature_importances_ attributes, and by recursively 
# eliminating a small number of features per loop, RFE attempts to eliminate dependencies and collinearity that may exist in the model.
# ensure the results are repeatable
set.seed(7)
# define the control using a random forest selection function
control <- rfeControl(functions=rfFuncs, method="cv", number=10)
# run the RFE algorithm
results <- rfe(remCorData[,1:10], remCorData[,10], sizes=c(1:10), rfeControl=control)
# summarize the results
print(results)
# list the chosen features
predictors(results)
# plot the results
plot(results, type=c("g", "o"))


# -----------> PCA(Principal Component Analysis)
# PCA can be applied only to numeric data!
Data_pca <- prcomp(remCorData, center = TRUE, scale. = TRUE)
summary(Data_pca)
str(Data_pca)
# Plotting PCA
# library(ggfortify)
plot(Data_pca)


# -----------> BORUTA ALGORITHM
# install.packages('Boruta')
install.packages('ranger')
library(ranger)
library(Boruta)
# Run Boruta Algorithm
set.seed(456)
boruta <- Boruta(remCorData$college~., data = remCorData, doTrace = 2)
print(boruta)
plot(boruta)
# Let's apply this for all attributes
for (i in colnames(dataFD)){
  boruta <- Boruta(remCorData[[i]]~., data = remCorData, doTrace = 2)
  print(boruta)
  # plot(boruta)
  # # Save Each Plot, name as attributes
  # png(sprintf("%s.png",i)) 
  # # Plots here
  # plot(boruta)
  # dev.off() 
}


# -----------RANDOM FOREST ALGORITHM 
randFor = randomForest::randomForest(remCorData$armed~. , data = remCorData)
randFor
plot(randFor)
# run for each Attribute
for (i in colnames(remCorData)){
  randFor = randomForest::randomForest(remCorData[[i]]~. , data = remCorData)
  randFor
  plot(randFor)
  # # Save Each Plot, name as attributes
  # png(sprintf("RF_%s.png",i)) 
  # # Plots here
  # plot(boruta)
  # dev.off() 
}


# =========================== DIMENSIONALITY REDUCTION ===========================
# We combine such attributes and decrease number of attributes while no change features values
# Why we use Dimentionality Reduction?
# If we have huge volume, hundreds of Attributes
# Reduces Training and Computational time
# Increase Accuracy
# Model Interpretability is high if many attributes
# Dimensionality reduction or dimension reduction is the process of 
# reducing the number of random variables under consideration
reduce = remCorData
# install.packages("reduce")
data_pca <- prcomp(reduce, scale.=T)
class(data_pca)
plot(data_pca)

winePCA <- prcomp(scale(reduce[,-1]))
class(winePCA)
plot(winePCA)
summary(winePCA)

reduce_pca <- prcomp(reduce, center = TRUE, scale = TRUE) 
summary(reduce_pca)
biplot(reduce_pca)

str(reduce_pca)

# =========================== CLUSTERING ===========================
# FINDING the OPTIMAL CLUSTER NUMBER
# Here we will use the Elbow method
# The Elbow method looks at the total WCSS as a function of the number of clusters.
# We should choose the apropriate number(s) of clusters
#Elbow Method
set.seed(6)
v = vector()
for (i in 1:10) v[i] = sum(kmeans(remCorData, i)$withinss)
plot(1:10,
     v,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
# Above is for plotting Elbow Method, shows us the number of clusters
# Elbow method is used to find the optimum number of clusters, We can say that 6-8 is optimum number of cluster from plot.
# However we will use 2 as k because we are looking for Armed or not Armed for now;

#  --------------------> K-MEANS 
# Applying K-Means to Our the dataset, we choosed clusters as 2 by using elbow method above;
set.seed(123)
kmeans = kmeans(x = remCorData, centers = 2)
y_kmeans = kmeans$cluster
# For Plotting the clusters;
library(cluster)
clusplot(dataAllNum,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Police Killings'),
         xlab = 'x',
         ylab = 'y')

# We have very bad results with k-means, let's go on with Agglomeration Method;

# ----------------> HIERARCHIAL CLUSTERING WARD'S METHOD 
# Here the Link means the agglomeration method to be used, we will use ward's method
# There are different functions available in R for computing hierarchical clustering. The commonly used functions are:
# hclust() and agnes() for agglomerative hierarchical clustering (HC)
# hclust() is the built-in R function [in stats package] for computing hierarchical clustering.
# The simplified format is:
# hclust(d, method = "complete")
# The dist() function is used to compute the Euclidean distance between points
# METHOD ONE by USING Dissimilartiy Matrix and HCLUST
# Dissimilarity matrix
# Compute distances and hierarchical clustering
# the agglomeration method to be used. This should be (an unambiguous abbreviation of) one of 
# "ward.D", "ward.D2", "single", "complete", "average" (= UPGMA), "mcquitty" (= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC).

dist_mat <- dist(remCorData, method = 'euclidean')
hclust_avg <- hclust(dist_mat, method = 'ward.D2')
plot(hclust_avg)
# We can cut the dendrogram in order to create the desired number of clusters.
# 2 means that -> ARMED or -> NOT-ARMED
cut_avg <- cutree(hclust_avg, k = 2)

# Visualize
plot(hclust_avg)
rect.hclust(hclust_avg , k = 2, border = 2:6)
abline(h = 2, col = 'red')

# Now we will append the cluster results obtained back in the original dataframe under column name the cluster with mutate(), 
# from the dplyr package and count how many observations were assigned to each cluster with the count() function.
suppressPackageStartupMessages(library(dplyr))
dataClus <- mutate(remCorData, cluster = cut_avg)
count(dataClus,cluster)
# We export CLUSTER Dataset as CSV
write.csv(dataClus, file = "DataCluster.csv")
# SHOW
# install digest
suppressPackageStartupMessages(library(ggplot2))
ggplot(dataClus, aes(x=dataClus$armed, y = dataClus$age, color = factor(cluster))) + geom_point()
# Table
table(dataClus$cluster, dataClus$armed)


# WE CAN ALSO USE ECLIDEAN DISTANCE, Difference Performance Factors
disMatrix <- dist(remCorData, method = "euclidean")
# Hierarchical clustering using Ward's method
hc <- hclust(disMatrix, method = "ward.D2" )
# Plot the obtained dendrogram
plot(hc, cex = 0.6, hang = -1)

# COLORFUL HISTOGRAM
install.packages(c("factoextra", "dendextend"))
library(ggplot2)
library(factoextra)
fviz_dend(hc, k = 4,                 # Cut in four groups
    cex = 0.5,                 # label size
    k_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
    color_labels_by_k = TRUE,  # color labels by groups
    ggtheme = theme_gray()     # Change theme
)


# METHOD TWO by USING Directly HCLUSTER package in AMAP
# We need to install amap package first -> install.packages("amap")
library(amap) 
hc <- hcluster(remCorData, method = "euclidean", diag = FALSE, upper = FALSE,
               link = "ward", members = NULL, nbproc = 2,
               doubleprecision = TRUE)
# We Plot The Dendogram
plot(hc)
plot(hc, hang = -1)

# -------------> COMPARISON Between Two Methods
# Method the cluster analysis method to be used. This should be one of: "ward.D",
# "ward.D2", "kmeans".
# We need to install the package -> install.packages("NbClust")
library("NbClust")
NbClust(remCorData, NULL, distance = "euclidean", min.nc = 2, max.nc = 10,
        method = "kmeans", index = "all", alphaBeale = 0.1)

NbClust(remCorData, NULL, distance = "euclidean", min.nc = 2, max.nc = 10,
        method = "ward.D2", index = "all", alphaBeale = 0.1)



# =========================== CLASSIFICATION ===========================
# SPLITTING DATA
## 75% of the sample size
smp_size <- floor(0.75 * nrow(dataClus)) # Get Sample Size, 75% Percentage of Number Of Rows We Have
## set the seed
set.seed(123)
train_ind <- sample(seq_len(nrow(dataClus)), size = smp_size)

train <- dataClus[train_ind, ] # 75%
test <- dataClus[-train_ind, ] # 25%
# Dimensions
dim(train)
dim(test)
# The train dataset has 288 rows while the test dataset has 96 rows.



# =============> DECISION TREES <============== 
# We are ready to build model
install.packages("rpart.plot")	
library(rpart)
library(rpart.plot)
# We use the class method because we predict a class. (Data -> TRAIN and Class Attr -> Cluster)
fit <- rpart(train$cluster~ + train$armed + train$age + train$gender + train$raceethnicity  + train$city + train$state
             + train$share_black + train$share_hispanic + train$college, data=dataClus, method = 'class')
rpart.plot(fit, extra = 106)
# We Make a prediction
predict_unseen <-predict(fit, test, type = 'class')
# Testing the Armed who didn't have and those who have
table_mat <- table(test$cluster, predict_unseen)
table_mat
# Measure performance
# We can compute an accuracy measure for classification task with the confusion matrix:
accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
print(paste('Accuracy for test', accuracy_Test))

# graphics.off()
# CART model
dt = rpart(train$cluster~ + train$armed + train$age + train$gender + train$raceethnicity  + train$city + train$state
+ train$share_black + train$share_hispanic + train$college, data=dataClus)
# Plot the tree using prp command defined in rpart.plot package
prp(dt)
# rpart.plot(dt, extra = 100)




# ==============> ARTIFICIAL NEURAL NETWORK (ANN) <============== 
# Random sampling
samplesize = 0.60 * nrow(dataClus)
set.seed(80)
index = sample( seq_len ( nrow ( dataClus ) ), size = samplesize )

# Create training and test set
datatrain = dataClus[ index, ]
datatest = dataClus[ -index, ]

## Scale data for neural network
max = apply(dataClus , 2 , max)
min = apply(dataClus, 2 , min)
scaled = as.data.frame(scale(dataClus, center = min, scale = max - min))

## Fit neural network 
# install library
install.packages("neuralnet")
# load library
library(neuralnet)
# creating training and test set
trainNN = scaled[index , ]
testNN = scaled[-index , ]
# fit neural network
set.seed(2)
NN = neuralnet(trainNN$cluster ~., trainNN, hidden = 3 , linear.output = T )
# plot neural network
plot(NN)

## Prediction using neural network
predict_testNN = compute(NN, testNN[,c(1:10)])
predict_testNN = (predict_testNN$net.result * (max(dataClus$cluster) - min(dataClus$cluster))) + min(dataClus$cluster)
plot(datatest$cluster, predict_testNN, col='blue', pch=16, ylab = "predicted rating NN", xlab = "real rating")
abline(0,1)
# Calculate Root Mean Square Error (RMSE)
# Predicted rating vs. real rating using neural network
RMSE.NN = (sum((datatest$cluster - predict_testNN)^2) / nrow(datatest)) ^ 0.5
RMSE.NN

# SAVING DATA, EXPORTING CSV
dataFinal = dataClus
# We export clear Dataset as CSV
write.csv(dataFinal, file = "CENG464-ProjectGroup10-FinalProjectDataFile.csv")