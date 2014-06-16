complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  setwd(directory)
  cm <- data.frame(id=1:332, nobs=NA)
  for (i in id) {
    filename <- sprintf("%03d.csv", i)
    data <- read.csv(filename,header=T)
    cm[i,2] <- sum(complete.cases(data))
  }
  completeframe <- cm[!is.na(cm[,2]),]
}
