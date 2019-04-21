# takes a directory of data files and a threshold for complete cases and calculates the correlation 
#between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) 
#is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. 
#If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0.

corr <- function(directory, threshold = 0) {
  FL<- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  cors <- numeric()
  for (i in 1:332) {
    dat <- read.csv(FL[i])
    if (sum(complete.cases(dat)) > threshold) {
      cors <- c(cors, cor(dat[["sulfate"]], dat[["nitrate"]], use = "complete.obs"))
    }
  }
  cors
}