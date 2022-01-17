score <- function(symbols){
  
  # identify case
  same_symbols <- all(symbols == symbols[1])
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if (same_symbols){
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, 
                 "BB" = 25, "B" = 10, "C" = 10, "0" = "0")
    prize <- as.integer(unname(payouts[symbols[1]]))
    
  }else if (all(bars)){
    prize <- 5
  }else {
    
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries_double + 1]
    
  }
  
  diamonds <- sum(symbols == "DD")
  prize <- prize * (2 ^ diamonds)
  
  return(prize) 
  
}
