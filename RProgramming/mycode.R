myfunction <- function(){
      x <- rnorm(100)
	mean(x)
}

second <- function(x){
	x + rnorm(length(x))
}

f <- function(x){
     g <- function(y){
             y + z
     }
     z <- 4
     x + g(x)
}

x <- 5
y <- if(x < 3){
        NA
} else {
        10
}