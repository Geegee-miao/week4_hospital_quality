rankhospital <- function(state, outcome, rank = "best") {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fd <- as.data.frame(cbind(data[, 2],
                              data[, 7],
                              data[, 11],
                              data[, 17],
                              data[, 23]),
                        stringsAsFactors = FALSE)
    colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    
    if(!state %in% fd[, "state"]) {
        stop("invalid state")
    } else
    
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("invalid outcome")
    } else
    
    if(is.numeric(rank)) {
        si <- which(fd[, "state"] == state)
        ts <- fd[si, ]
        ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
        ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"]), ]
        output <- ts[, "hospital"][rank]
    } else
        
    if(!is.numeric(rank)) {
        if(rank == "best") {
            output <- best2(state, outcome)
        } else
    
    if(rank == "worst") {
        si <- which(fd[, "state"] == state)
        ts <- fd[si,]
        ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
        ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"], decreasing = TRUE), ]
        output <- ts[, "hospital"] [1]
    } else {
        stop("invalid rank")
    }
        
    }
    return(output)
}


> rankhospital("NC", "heart attack", "worst")
[1] "WAYNE MEMORIAL HOSPITAL"
Warning message:
    In rankhospital("NC", "heart attack", "worst") : NAs introduced by coercion
> 
    > rankhospital("WA", "heart attack", 7)
[1] "YAKIMA VALLEY MEMORIAL HOSPITAL"
Warning message:
    In rankhospital("WA", "heart attack", 7) : NAs introduced by coercion
> 
    > rankhospital("TX", "pneumonia", 10)
[1] "SETON SMITHVILLE REGIONAL HOSPITAL"
Warning message:
    In rankhospital("TX", "pneumonia", 10) : NAs introduced by coercion
>
