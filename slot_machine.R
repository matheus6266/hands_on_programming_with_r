# Projeto 3



# geradno os símbolos randomicamente

get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", 
             "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1,
                  0.25, 0.01, 0.52))
}


get_symbols()

# função de jogar 

play <- function(){
  # step 1: generate symbols
  symbols <- get_symbols()
  
  # step 2: display the symbols
  print(symbols)
  
  # step 3: score the symbols
  score(symbols())
}


# utilizando o if

num <- -1

if (num < 0){
  print("num is negative")
  print("Don1t worry,I'll fix it")
  num <- num * -1
  print("Now num is positve ")
  num
}

# first case: three of a kind

symbols <- c("C", "DD", "C")

teste_logic_1 <- symbols[1] == symbols[2] & symbols[1] == symbols[3]
teste_Logic_2 <- symbols[1] == symbols[2] & symbols[1] == symbols[3]
teste_logic_3 <- all(symbols == symbols[1])
teste_logic_4 <- length(unique(symbols) == 1)

same_symbols <- all(symbols == symbols[1])

# second case: all bars

teste_logic_5 <- (symbols[1] == "B" | symbols[1] == "BB" | symbols[1] == "BBB" &
                 symbols[2] == "B" | symbols[2] == "BB" | symbols[2] == "BBB" &
                 symbols[3] == "B" | symbols[3] == "BB" | symbols[3] == "BBB")

teste_logic_6 <- symbols %in% c("B", "BB", "BBB")

bars <- symbols %in% c("B", "BB", "BBB")

# assign prize for symbols: first case

if (same_symbols){
  symbol_test_if <- symbols[1]
  if (symbol_test_if == "DD"){
    prize <- 800
  } else if (symbol_test_if == "7"){
    prize <- 80
  } else if (symbol_test_if == "BBB"){
    prize <- 40
  } else if (symbol_test_if == "BB"){
    prize <- 5
  } else if (symbol_test_if == "B"){
    prize <- 10
  } else if (symbol_test_if == "C"){
    prize <- 10
  } else if (symbol_test_if == "0"){
    prize <- 0
  }
}

# case three: assign prize for cherries

sum(symbols == "C")

if (cherries ==2){
  prize <-5
} else if (cherries == 1){
  prize <- 2
} else {
  prize <- 0
}

# other way to assign cherries

prize <- c(0, 2, 5)[cherries + 1]


