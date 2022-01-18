# funcação para verificar todas as combinações possíveis 

die <- 1:6

rolls_combination <- expand.grid(die, die)

rolls_combination

# criando coluna da soma das jogadas

rolls_combination$value <- rolls_combination$Var1 + rolls_combination$Var2

# calculando a probabilidade de ocorrência do dado 1

prob_die <- c("1" = 1/6, "2" = 1/6, "3" = 1/6,
          "4" = 1/6, "5" = 1/6, "6" = 1/6)

# salvando as possibilidade de ocorrência do dado 1 e dado 2

rolls_combination$prob1 <- prob_die[rolls_combination$Var1]
rolls_combination$prob2 <- prob_die[rolls_combination$Var2]

# calculando a probabilidade de cada combinação

rolls_combination$prob_total <- rolls_combination$prob1*rolls_combination$prob2



sum(rolls_combination$value*rolls_combination$prob_total)

# probabilidade da ocorrência da slot machine

wheel <- c("DD", "7", "BBB", 
           "BB", "B", "C", "0")

# gerando a quantidade de combinações possíveis

combos <- expand.grid(wheel, wheel, wheel, strongsAsFactors = FALSE)

# calculando a probabilidade de cada evento

prob_wheel <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06,
                "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)
combos$prob1 <- prob_wheel[combos$Var1]
combos$prob2 <- prob_wheel[combos$Var2]
combos$prob3 <- prob_wheel[combos$Var3]

# calculando a probabilidade total dos eventos

combos$prob_total <- combos$prob1 * combos$prob2 * combos$prob3

# funcionamento do for no R
# for não retorna valor

chars <- vector(length = 4)

words <- c("My", "fourth", "for", "loop")

for(i in 1:4){
  chars[i] <- words[i]
}

# criando um caoluna vazia 

combos$prize <- NA

head(combos, 3)

# preenchendo a coluna prize

for (i in 1:nrow(combos)){
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}

# calculando o valor médio da slot machine

sum(combos$prob_total * combos$prize)

# usando o laço de repetição while

plays_till_broke <- function(start_with){
  cash <- start_with
  n <- 0
  while(cash > 0){
    cash <- cash - 1 + play()
    n <- n + 1
  }
  n
}

plays_till_broke(100)

# a funcao repeat é similar ao while, mas para quando encontra o break
# ou apertando a tecla espaço

plays_till_broke_repeat <- function(start_with){
  cash <- start_with
  n <- 0
  
  repeat{
    cash <- cash - 1 + play()
    n <- n + 1
    if (cash <= 0){
      break
    }
  }
  n
}

plays_till_broke_repeat(100)


# testando o for

n_teste <- vector(length = 10)

for( i in 1:10 ){
  n_teste[i] <- i
  n_teste
}

rm(n_teste)
