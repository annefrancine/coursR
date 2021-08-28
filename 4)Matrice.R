# Remarque: si vous rencontrez des problÃ¨mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

?getwd()

# Une matrice est un tableau en deux dimensions dont tous les elements 
#sont du meme type. A l'instar des vecteurs, il ne s'agit pas ici de la
# notion algebrique de matrice, mais R dispose tout de meme des operateurs
# matriciels classiques. Pour R, un vecteur n'est pas la meme chose
# qu'une matrice ligne ou colonne

?matrix

nom <- c("Anne", "Stephan", "Ricardo", "Louis", "Marie")
prenom <- c("Souza", "Routel", "Bernard", "Dubois", "Lambert")

# La commande suivante cree une matrice de 4 lignes et de 5 colonnes.

x<-matrix(1:20, ncol=5, nrow=4, byrow=FALSE)
x
# Si byrow=TRUE, la matrice est remplie par ligne. 
# Si byrow=FALSE, la matrice est remplie par colonne.

z<-matrix(1:20, ncol=5, nrow=4, byrow=TRUE)
z

#Une matrice colonne s'obtient avec la commande rbind (row bind, association de lignes)
#coller horizontalement les deux vecteurs

?rbind
prenom_nom_hmatrix <- rbind(prenom, nom)
prenom_nom_hmatrix

#une matrice ligne s'obtient avec la commande cbind (column bind, association de colonnes)
#coller verticalement les deux vecteurs

?cbind
prenom_nom_vmatrix <- cbind(prenom, nom)
prenom_nom_vmatrix

# creation de matrices
# par ligne

matrix (c(1,2,3,4,5,6), nr = 2)
matrix (c(1,2,3,4,5,6), nr = 3)
matrix (c(1,2,3,4,5,6), nr = 6)

# par colonne
matrix (c( 1,2,3,4,5,6), nc = 2)

#Les matrices doivent avoir un nombre d'elements qui est multiple du
# nombre des lignes

matrix (c(1,2,3,4,5,6), nc = 2)


# Arithmetique des matrices
a <- matrix (c(1,2,3,4,5,6), 2, 3)
a

b <- matrix (c(5,1,3,4,1,0), 2, 3)
b

# Addition terme a terme
a+b

#Soustraction terme a terme
a-b


#Multiplication terme a terme
a*b

#Division terme a terme
a/b

#multiplication matrice avec vecteur
x = c(1:4)
x
y <- matrix(c(2,3,4,5), nr = 2)
y
x * y 

#nommer une matrice
mat3 <- matrix(c('Terre', 'Mars', 'Saturne', 'Neptune'), nr = 2)
mat3
dimnames(mat3) = (list( c("Ligne1", "Ligne2"), c("Colonne1", "Colonne2")))
mat3

#matrice diagonale
matriz <- 1:3
diag(matriz)

#Extraction d'un vecteur d'une matrice diagonale
vetor <- diag(matriz)
vetor
diag(vetor)

#transposition d'une matrice
W <- matrix (c(2,4,8,12 ), nr = 2, ncol = 2)
W
t(W)
U <- t(W)
U

#inverse d'une matrice
solve(W)

# Acces aux elements d'une matrice :De meme que pour les vecteurs, 
#les indices vont de 1 a nrow et de 1 a ncol.

# a[i, j] designe l'element de la ligne i et de la colonne j de la matrice a ;
# a[i, ] designe le vecteur correspondant a la i-ieme ligne de la matrice a ;
# a[, j] designe le vecteur correspondant a la j-ieme colonne de la matrice a ;

a <- matrix (c(1,2,3,4), 2, 2, byrow=TRUE)
a

a[2,1]
a[1,]
a[,1]

mat <- matrix(c(2,3,4,5), nr = 2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[,2]
