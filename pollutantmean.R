pollutantmean <- function (directory, pollutant, id = 1:332){
  files <- list.files(directory, full.names = 1)
  data <- data.frame()
  for (i in id){
    data <- rbind(data, read.csv(files[i]))
  }
  mean(data[,pollutant], na.rm =1 )
}