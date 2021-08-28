# Remarque: si vous rencontrez des probl?mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

getwd()

# Les chaines de caracteres
# Les chaines de caractere sont d?limitdes par les caractdres "o '.

a<- "Ceci est une chaine de caractere"
a
class(a)
is (a)

x = as.character(3.14) 
x
class(x) 

# Concatenation de string
# paste : La fonction paste permet de coller des chaines de 
# caracteres, cela peut etre utile pour plein de chose : definir
# le nom d'un fichier de sortie, 
# ecrire une formule pour un modele
?paste
?cat

prenom = "Nelson"; nom = "Mandela" 
paste(nom, prenom)
cat(nom, prenom)

a<-"coucou"
b<-"comment vas-tu?"

paste(a,b)
paste(a,b,sep="+")

# le parametre sep permet de definir le caractere utilise
# pour concatener les chaines de caracteres

#extraire une partie de la chaine de caractere

texte <- "Ceci est une chaine de caractere"
substr(texte, start=12, stop=25) 

#compter la quantite de caractere
?nchar
nchar(texte)

# Comme la plupart des langages de programmation, R trouve des 
# differences entre les majuscules et les minuscules. Les fonctions
# tolower() et toupper() nous aident comprendre ce probleme.

tolower("AlAbAmA")
toupper("AlAbAmA")

# ?sub()? et ?gsub():Nous pourrions egalement avoir la necessite
# de remplacer un caractere particulier dans une chaine de caracteres.
?sub
?gsub

sub("a","A","alabama")
gsub("A","a","AlAbAmA")

#is.character() : Avant de commencer travailler sur des strings,
# il est recommande de verifier si nous allons vraiment travailler
# avec des strings

?is.character
state.name
is.character(state.name)


#as.character(): Si, par exemple, nous devons convertir state.area 
# (vecteur numerique des zones d'etat - en miles carres) en strings
#, nous pouvons facilement appliquer la fonction as.character().

state.area
is.character(state.area)
stateAreachar <- as.character(state.area)
class(stateAreachar)

