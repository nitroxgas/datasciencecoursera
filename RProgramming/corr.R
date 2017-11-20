return_filename <- function(i){
        paste(sprintf("%03d", as.numeric(i)), ".csv", sep="")
}
corr <- function(directory, threshold = 0){
        old_dir <- getwd()
        setwd(directory)
        ids <- complete("./")
        ids <- subset(ids$id, ids$nobs >= threshold)
        if (length(ids)==0) {
                setwd(old_dir)
                return(vector('numeric'))
        } else {
                wk_data_frame  <- numeric(0) 
                for (i in seq_along(ids)){
                        tmp_data <- read.csv(return_filename(ids[i]))
                        wk_data_frame <- c(wk_data_frame, cor(tmp_data$sulfate, tmp_data$nitrate, use = "pairwise.complete.obs"))
                }
                setwd(old_dir)
                wk_data_frame
        }
}