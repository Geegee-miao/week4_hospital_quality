# Programming Assignment: Week 4 - Hospital Quality

### 1 Plot the 30-day mortality rates for heart attack
Read the outcome data into R via the read.csv function and look at the first few rows.
> outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
> head(outcome)
>
### 2 Finding the best hospital in a state
The function should use the following template.
best <- function(state, outcome) {
        ## Read outcome data
}

The function should check the validity of its arguments. If an invalid state value is passed to best, the function should throw an error via the stop function with the exact message “invalid state”. If an invalid outcome value is passed to best, the function should throw an error via the stop function with the exact message “invalid outcome”.

### 3 Ranking hospitals by outcome in a state

Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. For example, the call

> rankhospital("MD", "heart failure", 5)


The function should use the following template.
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
}

The function should check the validity of its arguments. If an invalid state value is passed to rankhospital, the function should throw an error via the stop function with the exact message “invalid state”. If an invalid outcome value is passed to rankhospital, the function should throw an error via the stop function with the exact message “invalid outcome”.


Here is some sample output from the function.
> source("rankhospital.R")
> rankhospital("TX", "heart failure", 4)
[1] "DETAR HOSPITAL NAVARRO"
> rankhospital("MD", "heart attack", "worst")


### 4 Ranking hospitals in all states

Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital rank- ing (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The first column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.


The function should use the following template.
rankall <- function(outcome, num = "best") {
        ## Read outcome data
}

NOTE: For the purpose of this part of the assignment (and for efficiency), your function should NOT call the rankhospital function from the previous section.
The function should check the validity of its arguments. If an invalid outcome value is passed to rankall, the function should throw an error via the stop function with the exact message “invalid outcome”. The num variable can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA.

