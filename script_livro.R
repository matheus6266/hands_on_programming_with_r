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

roll_2 <- function(die_2){
  
  dice_2 <- sample(x = die_2, size = 2, replace = TRUE)
  return(sum(dice_2))
}

roll_2(die_2)  

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

roll_3 <- function(){
  
  die_3 <- 1:6
  dice_3 <- sample(die_3, size = 2, replace = TRUE,
                   prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  return(sum(dice_3))
}

rolls1 <- replicate(10000, roll_3)
qplot(rolls1, binwidth = 1)

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
