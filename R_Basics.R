library(dplyr)
library("tibble")

#asignación
b = 2
c = 3 + 2
2-1
5%%2
4<5
!0
!T
F | T
isTRUE(F)
f <- 6
a = 66
h = 4L
class(a)
class(h)
k = as.numeric(h)
p = as.character(h)
k
p



#Crea dos variables, x e y, y asígnales un valor numérico

x <- 40
y <- 60

#Crea una tercera variable (z),suma de las dos anteriores
z <- x+y
z

#Consulta su valor y tipo de dato
z
class(z)

#Crea una cuarta variable (a), resultado de dividir z entre 2
a <- z/2

#Consulta su valor y tipo de dato
a
class(a)

#Conviértela a entera y comprueba que lo ha hecho bien
b = as.integer(a)
class(b)

##############################################################################

#vectores
v <- 1:5
w <- c(1,2,3,4,5)
t <- seq(from=10, to=20, by=2)

#seleccion
v[1]
v[2:4]



##############################################################################
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


