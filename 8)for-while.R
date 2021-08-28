# Remarque: si vous rencontrez des problÃ¨mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# La fonction for est tres pratique pour l'execution des boucles dans R. 
#Elle est structuree de la façon suivante:

for(var in seq){
  expr
}

#où var designer une variable dans la sequence seq et expr la transformation à 
#laquelle l'on soumet les elements de cette derniere. Un exemple.

for(i in c(1:10)){
  print(i^2)
}

#applications sur vecteurs

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
# Creation d'une coquille vide de vecteur.
y <- c() 
y
# Pour chaque element dans le vecteur x,
for(i in x){ 
  # creer un element dans le vecteur y qui en serait le carree.
  y[[i]] <- i^2 
}

y

# Prenons un vecteur de caracteres.Cherchons à detecter les prenoms qui 
#contiennent la lettre a (en minuscule)

x <- c("Ana", "Marie", "Jhon", "Stephan", "Alexandre", "Zan", "Chloe", "Laura")
# Creation d'une coquille vide de vecteur.
y <- c() 
# Pour chaque element dans le vecteur x,
for(i in x){ 
  # identifier les elements contenant la lettre "a".
  y[i] <- grepl(pattern = "(a)", x = i) 
}

y

# Application sur matrices

x <- matrix(data = c(1:12), nrow = 3, byrow = TRUE)
x


#Comme avant, elevons les elements à leur carre et stockons dans une matrice nommee y.
# Creation d'une coquille vide de matrice
y <- c() 
# Pour chaque element dans la matrice x,
for(i in x){ 
  # creer un element dans la matrice y qui en serait le carre.
  y[[i]] <- i^2 
}
y

# Loop For
for (i in 1:20) {print(i)}
for (q in rnorm(10)) {print(q)}

# Ignore certains elements à l'interieur de la boucle
for(i in 1:22){
  if(i == 13 | i == 15)
    next
  print (i)}

# interrompre la boucle
for(i in 1:22){
  if(i == 13)
    break
  print (i)}

# Loop While
i <- 1
while (i < 6) {
  print(i)
  i = i+1
}

# La boucle while ne sera pas executee
y = 6
while(y < 5){
  y = y+10
  print(y)
}
