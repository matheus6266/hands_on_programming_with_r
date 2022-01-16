##                                                    Capítulo 1

## Criando o objeto "die"
die <- 1:6

# Função "ls()" mostra todos os objetos criados
ls()

# Realizando operações com o vetor "die"
# As operacoes com vetores são feitas elementos por elemento

soma <- die +1
subtracao <- die -1
multiplicacao <- die * 2
divisao <- die/3

# Realizando multiplicacao de vetores

# Criando um segundo vetor de mesmo comprimento do "die"

vector_1 <- 1:3

# Realizando operacoes com o novo vetor

vector_2 <- die * vector_1

# As operações são realizadas elemento por elemento, mas para isto ocorrer o menor vetor
# tem que ser multiplo do maior vetor, caso isto não ocorra, teremos uma mensagem de "warning"

vector_3 <- 1:4
vector_4 <- die + vector_3

# Criando funções

# Exemplo de funcções nativas do "R"

round(3.1415)
factorial(5)

# Os argUmentos podem ser números, objetos e ate mesmo resultado de outras funções

mean(1:6)
mean(die)
round(mean(die))

# Função "Sample"

sample(x = 1:6, size = 2)

# Verificando quais são os argumentos das funções

args(sample)

# Criando a função "roll"

roll <- function(){
  
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  return(sum(dice))
  
}

# Para mostrar o que tem dentro da função, basta executa-la sem o "()"

roll

# Criando funções com argumentos

die_2 <- 1:20

roll_with_args <- function(die_2){
  
  dice_2 <- sample(x = die_2, size = 2, replace = TRUE)
  return(sum(dice_2))
}

roll_with_args(die_2)  

#                                             Capítulo 2  

# Instalando pacotes no R

# install.packages("ggplot2")

# Carregando pacotes

library("ggplot2")

# Criando o primeiro gráfico

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
y <- x^3

qplot(x,y)

# Plotando um histrograma

x1 <- c(1, 2, 2, 2, 3, 3)

qplot(x1, binwidth = 1)

x2 = c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)

# Usando a função "replicate"

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

# Abrindo o "Help" para identificar algumas informações sobre as funções

?qplot

# Criando a função roll com probabilidade

roll_with_probability <- function(){
  
  die_3 <- 1:6
  dice_3 <- sample(die_3, size = 2, replace = TRUE,
                   prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  return(sum(dice_3))
}

rolls_plot <- replicate(10000, roll_with_probability())
qplot(rolls_plot, binwidth = 1)

# Capítulo 3

# Criando vetores atônicos

vector_5 <- 1:5

# Função que verifica se é um vetor atômico

is.vector(vector_5)

# Função que retorna o tamanho do vetor

length(vector_5)

# Tipos de vetores atômicos

# Função para verificar o tipo do vetor
typeof()

# Doubles - números reais, negativos ou positivos

vector_6 <- c(1, 2, 3, 4, 5, 6)

# Integer - números inteiros

vector_7 <- c(1L, -1L, 2L)

# Characters

vector_8 <- c("Hello", "World")


# Criando um vetor atômico para as cartas

hand <- c("ace", "king", "queen", "jack", "ten")

# Função que verifica se o objeto possui atributos

atributes(nome_da_funcao)

# Atribuindo atributos à função

names(die) <- c("one", "two", "three", "four", "five", "six")

# Remover atribuições 

names(die) <- NULL

die

# Atribuindo dimensões ao objeto

dim(die) <- c(2, 3)

die

# Criando matrizes

matrix <- matrix(die, nrow = 2, byrow = TRUE)

# Criando matrix de cartas

hand_1 <- c("ace", "king", "queen", "jack", "ten",
            "spades", "spades", "spades", "spades", "spades")

matrix(hand_1, nrow = 5)

# Criando classes
# Note que mudando as dimensões do objeto não mudam
# o tipo, mas mudam a classe do objeto

x3 <- c(1, 2, 3, 4, 5, 6)

dim(x3) <- c(2,3)

# Verificando o tipo do objeto

typeof(x3)

# Verificando a classe do objeto

class(x3)

# Data e horário

now <- Sys.time()

# Verificando o tipo

typeof(now)

# Verificando a classe

class(now)

# Fatores são usados para armanezar informações categóricas, como a cor dos olhos

gender <- factor(c("male", "female", "female", "male"))

typeof(gender)

attributes(gender)

# Transformando "factor" em "character"

as.character(gender)

# Coerção - se existe algum character no vetor, tudo se transforma para o tipo vetor
# se existir algum item lógico, ele se tranforma no tipo numérico

card <- c("ace", "hearts", 1)

typeof(card)
class(card)

# Listas conseguem criar vetores com tipos diferentes de dados

list1 <- list(100:130, "R", list(TRUE, FALSE))

list1

# Data frames são similiares a uma tabela no Execel, cada vetor se torna uma coluna
# Os vetores devem ter o mesmo tamanho

df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"),
                 value = c(1, 2, 3))

df

# Criando o baralho manualmente

deck_original <- data.frame(
  face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
           "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten",
           "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace",
           "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five",
           "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine",
           "eight", "seven", "six", "five", "four", "three", "two", "ace"),
  suit = c("spades", "spades", "spades", "spades", "spades", "spades",
           "spades", "spades", "spades", "spades", "spades", "spades", "spades",
           "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs",
           "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts"),
  value = c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8,
            7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11,
            10, 9, 8, 7, 6, 5, 4, 3, 2, 1),
  stringsAsFactors = FALSE
)

# Verificando os primeiros elementos do data set

# Verificando os dois primeiros elementos

head(deck_original, 2)

# Verificando os últimos cinco elementos

tail(deck_original, 5)

# Salvando data sets

write.csv(deck, file = "cars.csv", row.names = FALSE)

# Capítulo 3

# Selecionando o elemento da primeira linha e primeira coluna
# Do data set

card1 <- deck_original[1, 1]

# Selecionando todos os elementos da primeira linha

card1 <- deck_original[1, c(1,2,3)]

# Ao usar notação negativa você retorna tudo menos o range selecionado
# Vamos retornar tudo, menos as linha de 1 a 10 da coluna 1 a 3

card1 <- deck_original[-(1:10), 1:3]

# Ao se usar um espaçõ em branco você seleciona tudo
# Retorna toda as três colunas da primeira linha

card1 <- deck_original[1, ]

# Usando operadores logicos para buscar dados no
# Data frame

card1 <- deck_original[1, c(TRUE, TRUE, FALSE)]

# Selecionando elementos através dos nomes da colunas

card1 <- deck_original[1, "value"]

# Função que retorna a primeira linha do data frame

deal <- function(deck){
  deck[1, ]
}

deal(deck_original)

# Criando um novo deck

deck_war <- deck_original[1:52, ]

# Criando um baralho randomico

random <- sample(1:52, size = 52)

deck_ramdom <- deck_original[random, ]

head(deck_ramdom)

# Criando uma função para gerar um baralho aleatório

shuffle <- function(deck){
  random <- sample(1:52, size = 52)
  deck[random, ]
}

deck_ramdom <- shuffle(deck_original)

head(deck_ramdom)

# Selecionando todo o valor de uma coluna

deck_original_colum <- deck_original$value

# Realizando operacoe

media <- mean(deck_original$value)

# O operador $ tambem pode ser usado em listas

lista <- list(numbers = c(1,2), logical = TRUE, strings = c("a", "b", "c"))

# Pegando os valores de numbers

num <- lista$numbers

# Realizando operações com lista

soma <- sum(lista$numbers)
soma

# Criando um vetor

vec <- c(0, 0, 0, 0, 0, 0)
vec

# Selecionando o primeiro elemento do vetor

vec[1]

# Modificando o primeiro elemento do vetor

vec[1] <- 1000
vec

# Substituindo valores específicos

vec[c(1,3,5)] <- c(1,1,1)
vec

vec[4:6] <- vec[4:6] + 1
vec

# criando e adicionando um novo valor para o vetor

vec[7] <- 0
vec

# adicionando uma nova coluna ao dataset

deck_war

deck_war$new <- 1:52

# removendo uma coluna do dataset

deck_war$new <- NULL

deck_war

# modificando os valores dos "ases"

deck_war[c(13, 26, 39 ,52), ]

deck_war$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)

head(deck_war, 13)


# criando um novo deck

deck_war_random <- shuffle(deck_original)

# Comparadores lógicos

logic1 <- 1>2

logic2 <- 1 > c(0, 1, 2)

c(1, 2, 3) == c(3, 2, 1)


# o operadora %in% teste elemento por elemento
# se eles estão contidos no vetor

logi3 <- c(1, 2, 3, 4) %in% c(3, 4, 5)

logi3

# verificando a quantidade de "aces" presentes

logic4 <- deck_war_random$face == "ace"

# somando a quantiadade de "aces" no deck

sum(logic4)

# indentificando no dataset onde temo o "ace"

logic5 <- deck_war_random$value[deck_war_random$face == "ace"]

# substituindo os valores do ace por 14

deck_war_random$value[deck_war_random$face == "ace"] <- 14

# verificando a substituicao

head(deck_war_random,52)

# criando um deck para jogar "hearts"

deck_hearts <- deck_original

deck_hearts$value <- 0

head(deck_hearts, 13)

# atribuindo o valor 1 para cada carta de "hearts" do deck

logic6 <- deck_hearts$suit == "hearts"

deck_hearts$value[deck_hearts$suit == "hearts"] <- 1

deck_hearts$value[deck_hearts$suit == "hearts"]

# operadores lógicos

a <- c(1, 2, 3)
b <- c(1, 2, 3)
c <- c(1, 2, 4)

# selecionando a "queen of spades"

queenOfSpades <- deck_hearts$face == "queen" & deck_hearts$suit == "spades"

# verificando se a linha esta correta

deck_hearts[queenOfSpades, ]

# exemplo 

deck_hearts[c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE), ]

# atribuindo o valor 13 a queen of spades

deck_hearts$value[queenOfSpades] <- 13

deck_hearts[queenOfSpades, ]

# Exercício de testes lógicos

w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")
days_week <- c("Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "Saturday")

# w é positivo

teste1 <- w > 0

teste2 <- x > 10 & x <20

teste3 <- y == "February"

teste4 <- z %in% days_week

# criando o jogo black jack

deck_black_jack <- deck_original

head(deck_black_jack, 13)

# selecionando as cartas "king", "queen", "jack"

face_card <- deck_black_jack$face %in% c("king", "queen", "jack")

# substituindo os valores 

deck_black_jack$value[face_card] <- 10

# verificando a substituicao dos valores

head(deck_black_jack, 13)

# nao considerando os "na's" nos calculos

# criando um objeto com "na"

calc <- c(NA, 1:50)
calc

# nao conseguimos realizar a media, pois temos um valor na no objeto

mean(calc)

# para realizar calculos com objetos com na devemos usar o na.rm = TRUE

mean(c(NA, 1:50), na.rm = TRUE)

# funcao que verifica se há algum NA no objeto

vector_6 <- c(1, 2, 3, NA)
is.na(vector_6)

# atribuindo o valor NA para o deck de black jack

deck_black_jack$value[deck_black_jack$face == "ace"] <- NA

head(deck_black_jack, 13)

deal
shuffle

# Capítulo 6

# Trabalhando com environment

install.packages("devtools")
install.packages("pryr")
library(devtools)
library(pryr)
parenvs(all = TRUE)

# verificando um environment específico

as.environment("package:stats")

# funções environment

globalenv()

baseenv()

emptyenv()

# função para verificar the environment's parent

parent.env(globalenv())

# verificando informações sobre os objetos do globa environment

ls(globalenv())

ls.str(globalenv())

# acessando objetos específicos através do global envirnment

head(globalenv()$deck, 3)

# criando e salvando um objeto no environmnet

assign("new", "Hello Global", envir = globalenv())

globalenv()$new

# verificando o origin environment

environment(head)

# ajustando a função deal

deck <- deck2
card_1 <- data

deal <- function(){
  
  card_1 <- deck[1, ]
  assign("deck",deck[-1, ], envir = globalenv())
  card_1
}


deal()
