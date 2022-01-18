
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

############### Dicas para aumentar a velocidade de execução do programa


# Faça tudo o que você puder fora do loop, se uma linha precisar ser
# executada uma vez só, faça-a fora do loop

# Tenha certeza que o objeto de armazenamento seja grande 
# o suficiente para armazenar todo o resultado do loop

# teste 1:

output <- rep(NA, 1000000)

system.time(
  for(i in 1:length(output)){
    output[i] <- i + 1
  }
)

#teste 2

output_2 <- NA

system.time(
  for (i in 1:1000000){
    output_2[i] <- i + 1
  }
)

# usando for para calcular a estimativa de pagamentos do slot machine


winnings <- vector(length = 10000000)

for (i in 1:10000000){
  winnings[i] <- play()
}

mean(winnings)

# verificando o tempo de execução da função

system.time(for (i in 1:10000000){
  winnings <- play()
})

# formas de tornar a função mais rápida

# gerando os símbolos aleatórios e 
# armazenando em uma matriz

get_many_symbols <- function(n){
  wheel <- c("DD", "7", "BBB", "BB", 
             "B", "C", "0")
  vec <- sample(wheel, size = 3 * n,
                replace = TRUE,
                prob = c(0.03, 0.03, 0.06, 0.1,
                         0.25, 0.01, 0.52))
  matrix(vec, ncol = 3)
}

get_many_symbols(5)

# ajustando a função play()

play_many <- function(n){
  symb_mat <- get_many_symbols(n = n)
  data.frame(w1 = symb_mat[,1], w2 = symb_mat[,2],
             w3 = symb_mat[,3], prize = score_many(symb_mat))
  
}

# criando uma versão vetorizada de score

# symsbols deve ser uma matrix com uma coluna para cada item do
# slote machine

score_many <- function(symbols){
  
  # Step 1: assign base prize based on cherries and diamonds
  # Count the number of cherries and diamonds in each combination
  
  cherries <- rowSums(symbols == "C")
  diamonds <- rowSums(symbols == "DD")
  
  # Wild diamonds count as cherries
  prize <- c(0, 2, 5)[cherries + diamonds + 1]
  
  # ...but not if there are zero real cherries
  # (cherries is coerced to FALSE where cheries == 0)
  
  prize[!cheries] <- 0
  
  # Stepe 2: change prize for combinations that contain threee of a king
  
  same <- symbols[,1] == symbols[,2] &
    symbols[, 2] == symbols[, 3]
  payoffs <- c("DD" = 100, "7" = 80, "BBB" = 40,
               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize[same] <- payoffs[symbols[same, 1]]
  
  # Stepe 3: Change prize for combinations that contain all bars
  
  bars <- symbols == "B" | symbols == "BB" | symbols = "BBB"
  all_bars <- bars[, 1] & bars[, 2] & bars [, 3] & !same
  prize[all_bars] <- 5

  # Step 4: Handle wilds
  
  # Combos with two diamonds
  two_wilds <- diamonds == 2
  
  # Identify the nonwild symbol
  one <- two_wilds & symbols[, 1] != symbols[, 2] &
    symbols[, 2] == symbols[, 3]
  two <- two_wilds & symbolic[, 1] != symbols[, 2] &
    symbols[, 1] == symbols[, 3]
  three <- two_wilds & symbols[, 1] == symbols[, 2] &
    symbols[, 2] != symbols[, 3]
  
  #Treat as threee of a kind
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  prize[three] <- payoffs[symbols[three, 3]]

  # Combos with one wild
  one_wild <- diamonds == 1
  
  # Treat as all bars (if appropriate)
  wild_bars <- one_wild & (rowSums(bars)==2)
  prize[wild_bars] <- 5
  
  # Treat as three of a kind (if appropriate)
  one <- one_wild & symbols[, 1] == symbols[, 2]
  two <- one_wild & symbols[, 2] == symbols[, 3]
  three <- one_wild & symbols[, 3] == symbols[, 1]
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  prize[three] <- payoffs[symbols[three, 3]]
  
  #Step 5: double prize for every diamond in combo
  unname(prize * 2^diamonds)
}


