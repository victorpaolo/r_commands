#Import dplyr to to use %>% (pipe command)
library(dplyr)
library("tibble")


#assignation variables & maths

a = 5
b = 3 + 2
c = 3 - 2
d = 5 * 9
e = 80 / 10
f = 2^2
f1 = 2**2
g = 5%%2
h = 5%/%2
i = sqrt(25)
j = abs(4.6)


#logic operators

4 < 5
!0
!T
6 != 5
F | T
F & T
isTRUE(F)


#variables

x1 <- 6
x2 = 66
x3 = 4L
##check class
class(x1)
class(x2)
class(x3)
##change class
y1 = as.numeric(x2)
y2 = as.character(x3)




##############################################################################

#vectors

##: --> va de un numero a otro
##c() --> lo hace con el contenido que deseamos
##seq --> que vaya de un valor a otro con un salto de valor
##rep --> que repita un valor un N veces
z1 <- 1:5
z2 <- c(1,2,3,4,5)
z3 <- seq(from=10, to=20, by=2)
z4 <- rep(10, 20)
##checks
length(z4)
##operation with vectors
z1 + 1
z1 * 2
z1 == 4
z1 >= 4
##select elements in a vector
z3[1]
z3[2:4]
z3[c(1,15)]
##replace elements of a vector
z3[1] <- 99
##naming elements of a vector
names(z1) <- c("Uno","Dos","Tres","Cuatro","Cinco")
##cross vectors
z5 <- 1:4
z6 <- 3:7
union(z5,z6)
intersect(z5,z6)
setdiff(z5,z6)
setdiff(z6,z5)
2%in%z5
##Order vector
sort(z5, decreasing = T)
##Count number of element
table(z6)

##Notes number specials
###Inf representa infinito / -Inf representa menos infinito
1/0
###NaN representa un valor indefinido (Not a Number)
0/0
###NA representa un valor inexistente
c(1,NA,2)
###check
z7 <- c(1,NA,0/0)
is.na(z7)
is-nan(z7)

##Delete value NA from the vector
bad <- is.na(z7)
z7[!bad]




##############################################################################

#Matrix
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#dimensiones
dim(m)

m[1,2]
m[1,2:3]
m[,3]

cbind(1:10,101:110)

rbind(1:5,101:105,100)

a <- 1:5
b <- 6:10

cbind(a,b)
rbind(a,b)





##########################################################
#Dataframe
name <- c("pepe","javi")
edad <- c(20,60)
sus <- c(T,F)

df <- data.frame(name,edad,sus)
df

#entrar a una columna
##ver columna
df[2]
df["edad"]

##ver vector
df$edad
##con dplyr
df%>%select(name,edad)

## nueva columna
df$id <- 1:2

df %>% select(-id) <- df

## nueva fila
df_insertar=data.frame(name="yoyo",edad=35,sus=T,id=3)
df
df_insertar
df %>% union(df_insertar)
df






###################################################################
#Real data
library(ggplot2)
msleep %>% head()

msleep %>% 
  select(name,sleep_total) %>% 
  head()


msleep %>% select(-name,-genus) %>% head

##filtros
msleep %>% filter(sleep_total>=16) %>% head()
msleep %>% filter(sleep_total>=16, bodywt>=1) %>% head()

#ordenar
head(arrange(msleep,order))
msleep %>% arrange(sleep_total) %>% head()
msleep %>% arrange(sleep_total) %>% head()


#mutate - nuevas columnas
msleep <- msleep %>% 
  mutate(rem_proportion = sleep_rem/sleep_total)
msleep


msleep %>% mutate(
  rem_proportion2 = 
    case_when(
      is.na((rem_proportion) ~ 0,
            T~rem_proportion)
    )
)


msleep$rem_porportion3 = msleep$sleep_rem/msleep$sleep_total
msleep


##groupby



iris


##########################################################################
#Estadistica dexriptiva

ages <- c(25,22,26,28,29,27,30,41) 
length(ages)
max(ages)
min(ages)
mean(ages)
median(ages)
sd(ages)
var(ages)

##summary y gráficos

summary(ages)
boxplot(ages)
boxplot(iris)
summary(iris)


apply(iris %>% select(-Species), FUN=sd , MARGIN=2)


x <- rnorm(100000, mean=100, sd=10)
sd(x)
mean(x)
hist(x)
plot(runif(1000))


