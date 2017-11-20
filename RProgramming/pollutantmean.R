return_filename <- function(i){
        if (i < 10) {
                file_name <- paste("00",i,".csv",sep="")       
        } else if (i < 100) {
                file_name <-  paste("0",i,".csv",sep="")
        } else {
                file_name <- paste(i,".csv",sep="")
        }
        #print(file_name)
}

pollutantmean <- function(directory, pollutant, id = 1:332){
        old_dir <- getwd()
        setwd(directory)
        wk_data_frame = data.frame(row.names=c("Date","sulfate", "nitrate", "ID" ))
        for (i in id){
               tmp_data <- read.csv(return_filename(i))
               wk_data_frame <- rbind(wk_data_frame, tmp_data)
        }
        setwd(old_dir)
        mean(wk_data_frame[[pollutant]], na.rm = TRUE)
}