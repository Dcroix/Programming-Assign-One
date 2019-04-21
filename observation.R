#Reads a directory full of files and reports the number of completely observed cases in each data file. 
#The function should return a data frame where the first column is the name of the file and the second 
#column is the number of complete cases.

observation <- function (directory, id = 1:332){
  files <- list.files(directory, full.names =1)
  data <- data.frame(id = integer(), nobs = integer())
  for (i in 1:length(id)){
    data[i,1]<- id[i]
    data[i,2]<- sum(complete.cases(read.csv(files[i])))
  }
  data
}