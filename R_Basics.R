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
##Create  matrix
m <- matrix(1:6, nrow = 2, ncol = 3)
m

##Check matrix
class(m)
dim(m)

##Select elements in a matrix
m[2,c(1,3)]
m[1:2, 3]
m[2, 1:3]
m[,3]
m[2]
###get all elements unless the number specified 
m[-1] 
m[-2]
m[-3]

##operations with a matrix
m + m
###multiply elements in the same position
m * m
###real multiplication of a matrix
m %*% m

##manipulations of a matrix
t(m)

##vector + matrix
v1 <- 1:5
v2 <- c(11,12,13,14,15)
v3 <- seq(from=10, to=20, by=2)
v4 <- rep(5, 5)

cbind(v1,v2,v3,v4)
rbind(v1,v2,v3,v4)




##############################################################################

#Lists



##############################################################################

#Dataframe (df)

##Create a df
name <- c("pepe","javi","rosario","valeria","anna")
number <- c(20,60,36,25,45)
boolean <- c(T,F,F,T,T)
df <- data.frame(name,number,boolean)
df

##columns
###get a column
df$name
df[1]
df["name"]
df$number
df[2]
de["number"]
df$boolean
df[3]
df["boolean"]
####get an element of a column
df$number[2]

###add a column
df$id <- 1:2
df

###remove a column
df$id<-NULL
df
df %>% select(-id) <- df ## tengo dudas
df

###names
names(df)

##rows
###add a row
df_insertar=data.frame(name="yoyo",number=35,boolean=T)
df
df_insertar
df<-rbind(df,df_insertar)
df
df %>% union(df_insertar)
df

###names
row.names(df)


##manipulation
###select columns
df$name
df[1]
df["name"]
df[c("name","boolean")]
df[c(1,3)]

###filtering
####first 4 rows and all columns
df[1:4,]

####first 4 rows and selected columns
df[1:4,c("name","boolean")]

####by condition
df[df$number>=35,]
df[df$number>=35 & df$boolean == T,]

####filtering rows and columns
df[df$number>=35,c(1,3)]


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


