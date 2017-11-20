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

complete <- function(directory, id = 1:332){
        old_dir <- getwd()
        setwd(directory)
        wk_data_frame = data.frame(row.names=c("id","nobs"))
        for (i in seq_along(id)){
               tmp_data <- read.csv(return_filename(id[i]))
               wk_data_frame <- rbind(wk_data_frame, data.frame(id=id[i], nobs=nrow(tmp_data[complete.cases(tmp_data),])))
               #wk_data_frame <- rbind(wk_data_frame, tmp_data[complete.cases(tmp_data),])
        }
        
        #x <- read.csv()
        setwd(old_dir)
        wk_data_frame
}