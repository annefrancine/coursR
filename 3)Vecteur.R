# Remarque: si vous rencontrez des probl√®mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Un vecteur est un ensemble elements de meme nature
# La fonction c permet de creer un vecteur. 
# Tous les elements d'un vecteur doivent etre du meme type.

#il existe quatre types fondamentaux de vecteurs :
# les nombres reels (cest-a-dire les nombres decimaux que nous utilisons au quotidien)
# les nombres entiers
# les chaines de caracteres (qui correspondent a du texte)
# les valeurs logiques ou valeurs booleennes (vrai ou faux)

a<- c(12,7,5.3,9.1,24)
is(a)
class(a)

b <- c("Vecteur", "de", "chaine", "de", "caracteres")
b
is (b)

nom <- c("Ana", "Jhon", "Chloe", "Louis", "Alexandre")
prenom <- c("Durand", "Laurent", "Girard", "Lefevre", "Martin")
nom
prenom

?is
is(nom)

is.vector(nom)
length(nom)
class(nom)
typeof(nom)

?paste
prenom_nom_age <- paste(prenom,nom)
prenom_nom_age

# On peut creer un autre objet y a partir de l'objet x 
x <- 10
x
y <- x^2+2*x+1 
y

#Quelques vecteurs remarquables
LETTERS
month.name
pi
month.abb

#rep:Dans certaines situations, on peut avoir besoin de creer un vecteur d'une 
# certaine longueur mais dont toutes les valeurs sont identiques. Cela se
# realise facilement avec rep qui on indiquera la valeur a repeter puis
# le nombre de repetitions 

?rep

rep(2, 10)
rep(c("a", "b"), 3)

#La fonction seq peut generer des sequences de nombres reels
?seq
seq(1, 5, 0.5)

#ou` le premier nombre indique le debut de la sequence,
# le second la fin, et le
#troisieme increment utilise dans la progression de la sequence

seq(length=9, from=1, to=5)

c(1:5, seq(10, 11, 0.2))

# Soit v un vecteur contenant 6 entiers allant de 1 ‡ 6 :
v <- c(1, 2, 3, 4 , 5, 6)
v<- 1:6
v

# Arithmetique des vecteurs
# Les operations arithmetiques entre deux vecteurs de meme dimension sont des operations
# terme ‡ terme. Une operation arithmetique entre deux vecteurs de meme dimension retourne 
# un vecteur dont les elements correspondent ‡ l'operation arithmetique effectuee pour l'indice correspondant 
# des vecteurs donnes en argument.

a <- c(1, 6, 2, 4)
a
b <- c(9, 2, 6, 1)
b
a+b

# Si un vecteur est plus petit que l'autre, R repete les valeurs du plus petit
# vecteur jusqu'‡ generer  un vecteur de meme taille que le 
# plus grand. En particulier, si un des vecteurs est un scalaire, 
# alors R applique l'operation entre le scalaire et tous les elements du vecteur

a <- 1:10
a
a+5

alfa = c(10, 20, 30) 
alfa
beta = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
beta
alfa + beta 

# Pour determiner les nombres impairs :

a %% 2 == 1

# Ainsi, l'operation multiplication d'un vecteur par un scalaire correspond a l'operation algebrique.
v <- c(2, 3)
4*v

# combinaison de vecteurs
v1 = c(2, 3, 5) 
v2 = c("aa", "bb", "cc", "dd", "ee") 
c(v1, v2) 

# min(), max() : donne la valeur respectivement minimale et maximale 
# de la suite ;

a;b
min(a)
max(b)

#cumsum() : effectue la somme cumulee du vecteur ; cela correspond ‡ 
# la somme de la serie ; cette fonction renvoie
cumsum(a)

#cumprod() : effectue le produit cumule du vecteur ; cette fonction renvoie
# un vecteur de meme taille que le vecteur initial

cumprod(a)

#cummax(), cummin() : renvoie respectivement le maximum et le minimum cumule
cummax(a)

# Valeurs manquantes

# Lorsqu'on travaille avec des donnees d'enquete, il est frequent 
# que certaines donnÈes soient manquantes, en raison d'un refus du participant 
# de repondre ‡ une question donnee ou d'un oubli ou d'un dysfonctionnement 
# du materiel de mesure, etc.
#Une valeur manquante s'indique sous R avec NA (pour not available).
#Cette valeur peut s'appliquer ‡ n'importe quel type de vecteur, qu'il 
# soit numerique, textuel ou logique.


taille <- c(1.88, NA, 1.65, 1.92, 1.76, NA)
sexe <- c("h", "f", NA, "h", NA, "f")

length(taille)

a<- c(NA, NA, NA)
length(a)

# Des vecteurs nommes
# Les differentes valeurs d'un vecteur peuvent etre nommees. 
#Une premiere maniere de nommer les elements d'un vecteur est de le 
# faire ‡ sa creation

sexe <- c(Michel = "h", Anne = "f", Dominique = NA, Jean = "h", 
         Claude = NA, Marie = "f")
sexe

# La liste des noms s'obtient avec names
names(sexe)

# Pour ajouter ou modifier les noms d'un vecteur, on doit attribuer
#un nouveau vecteur de noms 
names(sexe) <- c("Michael", "Anna", "Dom", "John", "Alex", "Mary")
sexe

# Pour supprimer tous les noms, il y a la fonction unname
?unname
anonyme <- unname(sexe)
anonyme

# Extraire ou assigner une composante
# Pour avoir acces ‡ la valeur du i-eme element, 
# on utilise la notation [i]

x <- c(1:5, 10:15)
print(x)
x[6]
x[4:7]
x[c(1, 3, 6)]

# On peut aussi utiliser un vecteur de booleens ; 
# R extrait alors les elements correspondant aux valeurs vraies.
# Par exemple :

x <- c(1:5, 10:15)
x
indices = x > 5
x[indices]

# Indexation par nom

#Lorsqu'un vecteur est nomme, il est des lors possible d'acceder ‡ ses
# valeurs ‡ partir de leur nom.
# Il s'agit de l'indexation par nom.


sexe["Anna"]
sexe[c("Mary", "Michael", "John")]
sexe[c(TRUE, FALSE, FALSE, TRUE, FALSE, FALSE)]# indexation par condition

# Modification d'un vecteur

d <- 1:5
d
d[1] <- 3
d

sexe
sexe["Alex"] <- "f"
sexe
