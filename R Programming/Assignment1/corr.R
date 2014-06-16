corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  cmaux <- complete(directory)
  cm <- cmaux[cmaux[,2] >= threshold,]
  correl <- vector(mode="numeric", length=0)
  for (i in cm$id) {
    filename <- sprintf("%03d.csv", i)
    data <- read.csv(filename,header=T)
    correl <- c(correl, cor(data$sulfate, data$nitrate, use="complete.obs"))
  }
  correl
}
