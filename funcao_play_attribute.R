
# função play() com atributos

play_attribute <- function(){
  
  symbols <- get_symbols()
  prize <- score(symbols)
  attr(prize, "symbols") <- symbols
  prize
}

# funcao play atibuindo atributos através da função
# structure

play_attribute_2 <- function(){
  
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}

play_attribute_2()

# função para tratar o resultado com atributo

slot_dysplay <- function(prize){
  
  # extract symbols
  symbols <- attr(prize, "symbols")
  
  # collapse symbols into single string
  symbols <- paste(symbols, collapse = " ")
  
  # combine symbol with prize as a regular expression
  # \n is regular expression for new line (i.e. reuturn or enter)
  string <- paste(symbols, prize, sep = "\n$")
  
  # display regular expression in consule without quotes
  cat(string)
}

slot_dysplay(play_attribute())


