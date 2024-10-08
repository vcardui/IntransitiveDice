# +----------------------------------------------------------------------------+
# | CARDUI WORKS v1.0.0
# +----------------------------------------------------------------------------+
# | Copyright (c) 2024 - 2024, CARDUI.COM (www.cardui.com)
# | Vanessa Reteguín <vanessa@reteguin.com>
# | Released under the MIT license
# | www.cardui.com/carduiframework/license/license.txt
# +----------------------------------------------------------------------------+
# | Author.......: Vanessa Retegín <vanessa@reteguin.com>
# | First release: September 28th, 2024
# | Last update..: October 7th, 2024
# | WhatIs.......: Lab report 02 (code) - Intransitivity property in dice game
# +----------------------------------------------------------------------------+
# | Major........: Intelligent Computing Engineering - 3rd Semester
# | Subject......: Descriptive statistics and probability
# | Professor....: José Antonio Guerrero Díaz de León
# +----------------------------------------------------------------------------+
# | Acknowledgements: Many thanks to Dr. José Antonio Guerrero Díaz de León for
# |                   providing sample code for the development of this activity
# +----------------------------------------------------------------------------+

#-----------
# Functions 
#-----------

# Dice pseudoclass
dado<-function(caras,nombre){
   d<-list("caras"=caras,"nom"=nombre)
   class(d)<-"dado"
   return(d)
}

# Print dice faces
print.dado<-function(d){
    cat(d$nom,"\n")
		nc<-length(d$caras)
		cat("╔",rep("═╦",nc-1),"═╗\n",sep="")
		for(i in 1:nc) cat("║",d$caras[i],sep="")
		    cat("║\n")
		    cat("╚",rep("═╩",nc-1),"═╝\n",sep="")
}

# Simulate rolling a dice
tirar<-function(d,n=1){
    s<-sample(d$caras,size=n,replace=TRUE)
    t<-sum(s)
    r<-list("s"=s,"t"=t,"nom"=d$nom)
    return(r)
}

# Comparing dice to determine winner
# (Which die is "better"?)
gana<-function(s1,s2){
   # Determine which die has the highest value
   # If both are equal, determine that "white" won
   res<-ifelse(s1$t<s2$t,s2$nom,
	 ifelse(s1$t>s2$t,s1$nom,"white"))
   return(res)
}

#--------------------------------------------------------------------------------
# Simulation #1
#--------------------------------------------------------------------------------
# Dice got from Wikipedia (Non-transitive dice)
# https://es.wikipedia.org/w/index.php?title=Dados_no_transitivos&oldid=138316145
#--------------------------------------------------------------------------------
dado1<-dado(c(2,2,4,4,9,9),"Rojo")
dado2<-dado(c(1,1,6,6,8,8),"Azul")
dado3<-dado(c(3,3,5,5,7,7),"Verde")

# Declare result history vectors as numeric type
res1vs2<-numeric()
res1vs3<-numeric()
res2vs3<-numeric()

# Run 10000 simulations
for(i in 1:10000){
    # Roll each dice
    s1<-tirar(dado1)
    s2<-tirar(dado2)
    s3<-tirar(dado3)
    
    # Determine which die wins and save it in variable
    r1vs2<-gana(s1, s2)
    r1vs3<-gana(s1, s3)
    r2vs3<-gana(s2, s3)
    
    # Concatenate variable value to history vector
    res1vs2<-c(res1vs2, r1vs2)
    res1vs3<-c(res1vs3, r1vs3)
    res2vs3<-c(res2vs3, r2vs3)
}

# Split the canvas into 3 parts
par(mfrow=c(1,3))

# Get the values ​​of the vectors as strings
str(res1vs2)
str(res1vs3)
str(res2vs3)

# Tabulate historical results data and generate graph
t1vs2 <- table(res1vs2)
barplot(t1vs2, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 1 vs el 2", col=c("blue", "red", "white"))

t1vs3 <- table(res1vs3)
barplot(t1vs3, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 1 vs el 3", col=c("red", "green", "white"))

t2vs3 <- table(res2vs3)
barplot(t2vs3, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 2 vs el 3", col=c("blue", "green", "white"))

#--------------------------------------------------------------------------------
# Simulation #2
#--------------------------------------------------------------------------------
# Data given by the professor (José Antonio Guerrero Díaz de León)
#--------------------------------------------------------------------------------
dado1<-dado(c(1,1,5,5,9,9),"Rojo")
dado2<-dado(c(2,2,6,6,7,7),"Azul")
dado3<-dado(c(3,3,4,4,8,8),"Verde")

# Declare result history vectors as numeric type
res1vs2<-numeric()
res1vs3<-numeric()
res2vs3<-numeric()

# Run 10000 simulations
for(i in 1:10000){
    # Roll each dice
    s1<-tirar(dado1)
    s2<-tirar(dado2)
    s3<-tirar(dado3)
    
    # Determine which die wins and save it in variable
    r1vs2<-gana(s1, s2)
    r1vs3<-gana(s1, s3)
    r2vs3<-gana(s2, s3)
    
    # Concatenate variable value to history vector
    res1vs2<-c(res1vs2, r1vs2)
    res1vs3<-c(res1vs3, r1vs3)
    res2vs3<-c(res2vs3, r2vs3)
}

# Split the canvas into 3 parts
par(mfrow=c(1,3))

# Get the values ​​of the vectors as strings
str(res1vs2)
str(res1vs3)
str(res2vs3)

# Tabulate historical results data and generate graph
t1vs2 <- table(res1vs2)
barplot(t1vs2, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 1 vs el 2", col=c("blue", "red", "white"))

t1vs3 <- table(res1vs3)
barplot(t1vs3, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 1 vs el 3", col=c("red", "green", "white"))

t2vs3 <- table(res2vs3)
barplot(t2vs3, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 2 vs el 3", col=c("blue", "green", "white"))

#--------------------------------------------------------------------------------
# Simulation #3
#--------------------------------------------------------------------------------
# Efron's dice obtained from Wikipedia (Non-transitive dice)
# https://es.wikipedia.org/w/index.php?title=Dados_no_transitivos&oldid=138316145
#--------------------------------------------------------------------------------
dado1<-dado(c(4, 4, 4, 4, 0, 0),"Rojo")
dado2<-dado(c(3, 3, 3, 3, 3, 3),"Azul")
dado3<-dado(c(6, 6, 2, 2, 2, 2),"Verde")
dado4<-dado(c(5, 5, 5, 1, 1, 1),"Morado")

# Declare result history vectors as numeric type
res1vs2<-numeric()
res1vs3<-numeric()
res1vs4<-numeric()
res2vs3<-numeric()
res2vs4<-numeric()
res3vs4<-numeric()

# Run 10000 simulations
for(i in 1:10000){
    # Roll each dice
    s1<-tirar(dado1)
    s2<-tirar(dado2)
    s3<-tirar(dado3)
    s4<-tirar(dado4)
    
    # Determine which die wins and save it in variable
    r1vs2<-gana(s1, s2)
    r1vs3<-gana(s1, s3)
    r1vs4<-gana(s1, s4)
    r2vs3<-gana(s2, s3)
    r2vs4<-gana(s2, s4)
    r3vs4<-gana(s3, s4)
    
    # Concatenate variable value to history vector
    res1vs2<-c(res1vs2, r1vs2)
		res1vs3<-c(res1vs3, r1vs3)
		res1vs4<-c(res1vs4, r1vs4)
		res2vs3<-c(res2vs3, r2vs3)
		res2vs4<-c(res2vs4, r2vs4)
		res3vs4<-c(res3vs4, r3vs4)
}

# Split the canvas into 6 parts
par(mfrow=c(2,3))

# Get the values ​​of the vectors as strings
str(res1vs2)
str(res1vs3)
str(res1vs4)
str(res2vs3)
str(res2vs4)
str(res3vs4)

# Tabulate historical results data and generate graph

# 1vs2
t1vs2 <- table(res1vs2)
barplot(t1vs2, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 1 vs el 2", col=c("blue", "red", "white"))

# 1vs3
t1vs3 <- table(res1vs3)
barplot(t1vs3, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 1 vs el 3", col=c("red", "green", "white"))

# 1vs4
t1vs4 <- table(res1vs4)
barplot(t1vs4, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 1 vs el 4", col=c("purple", "red", "white"))

# 2vs3
t2vs3 <- table(res2vs3)
barplot(t2vs3, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 2 vs el 3", col=c("blue", "green", "white"))

# 2vs4
t2vs4 <- table(res2vs4)
barplot(t2vs4, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 2 vs el 4", col=c("blue", "purple", "white"))

# 3vs4
t3vs4 <- table(res3vs4)
barplot(t3vs4, xlab="Ganador", ylab="Frecuencia", main="Resultados del dado 3 vs el 4", col=c("purple", "green", "white"))