best <- function(state, outcome) {
        
    data_outcome <- read.csv("/Users/irenew/Desktop/jhcoursera/class/week_4/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    if(!any(state == data_outcome$State)) {
        stop("State NA")
    }
    
    if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))) {
        stop("Outome NA")
    }
    
    if(outcome == "heart attack") {
        splitted_state <- split(data_outcome, data_outcome$State)
        data_outcome <- splitted_state[[state]]
        
        hospital_name <- data_outcome[(data_outcome[, 11] == min(na.omit(splitted_state[[state]][, 11]))),]$Hospital.Name
        
    }
    
    else
    if(outcome == "heart failure") {
        splitted_state <- split(data_outcome, data_outcome$State)
        data_outcome <- splitted_state[[state]]
        hospital_name <- data_outcome[(data_outcome[, 17] == min(na.omit(splitted_state[[state]][, 17])))]$Hospital.Name
    }
    
    else
    if(outcome == "pneumonia") {
        data_outcome <- 
    }
    
    print(sort(hospital_name)[1])
    
}


> best("SC", "heart attack")
[1] "MUSC MEDICAL CENTER"


## set workspace and edit functions

setwd("~/Desktop/jhcoursera/class/week_4/rprog-data-ProgAssignment3-data")


best2 <- function(state, outcome) {
    outcome2 <- read.csv("outcome-of-care-measures.csv", header = TRUE, stringsAsFactors = F)
    outcomevector <- c("heart attack", "heart failure", "pneumonia")
    if(!(state %in% unique(outcome2$State))) stop("invalid state")
    if(!(outcome %in% outcomevector)) stop("invalid outcome")
    
    X <- outcome2[outcome2$State == state,]
    names(X)[c(11, 17, 23)] <- outcomevector
    answer <- X[X[, outcome] == min(X[, outcome]), ][2]
    FA <- answer[with(answer, order(Hospital.Name)), ]
    FA[1]
}
