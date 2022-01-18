
# teste de um loop não vetorizado transforma os valores negativos
# de um vetor, para um valor positivo

vetor <- c(-1, -2, 1, 5)

abs_loop <- function(vec){
  
  for(i in 1:length(vec)){
    if (vec[i] < 0){
      
      vec[i] <- -vec[i]
      
    }
  }
  
  vec
}

abs_loop(vetor)  

# realiza a mesma função de transforma o contúdo do vetor 
# em ítens positivos

abs_sets_vetorizado <- function(vec){
  negs <- vec < 0
  vec[negs] <- vec[negs] * -1
  vec
}

abs_sets_vetorizado(vetor)

# verificando a velocidade de execução das funções

long <- rep(c(-1, 1), 5000000)

system.time(abs_loop(long))

system.time(abs_sets_vetorizado(long))

# criando uma função para mudar o nome dos símbolos

vec_symbols <- c("DD", "C", "7", "B",
                 "BB", "0")

vec_symbols[vec_symbols == "DD"]

change_vec <- function(vec){
  vec[vec == "DD"] <- "joker"
  vec[vec == "C"] <- "ace"
  vec[vec == "7"] <- "king"
  vec[vec == "B"] <- "queen"
  vec[vec == "BB"] <- "jack"
  vec[vec == "BBB"] <- "ten"
  vec[vec == "0"] <- "nine"
  
  vec
}

change_vec(vec_symbols)

# fazendo a mesma função só que utilizado lookup table

change_vec2 <- function(vec){
  tb <- c("DD" = "joker", "C" = "ace", "7" = "king",
          "B" = "queen", "BB" = "jack", "BBB" = "ten",
          "0" = "nine")
  unname(tb[vec])
}

change_vec2(vec_symbols)

system.time(change_vec(vec_symbols))
system.time(change_vec2(vec_symbols))
