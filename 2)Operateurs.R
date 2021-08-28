# Remarque: si vous rencontrez des probl?mes d'accentuation, consultez ce lien:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding


# What are the differences between = and <- assignment operators in R?
# https://stackoverflow.com/questions/1741820/what-are-the-differences-between-and-assignment-operators-in-r

?Syntax
<-
getwd()

#Operateurs arithmetiques

#Addition  (+): L'operateur  ajoute deux operandes. Par exemple, x+y.
#Soustraction (-): l'operateur soustrait deux operandes. Par exemple, x-y.
#Multiplication (*): l'operateur '*' multiplie deux operandes. Par exemple, x*y.
#Division (/): l'operateur divise le premier op?rande par le second. Par exemple, x/y.
#Module (%%): l'operateur renvoie le reste lorsque le premier operande est divis? par le second. Par exemple, x%%y).
#Division entire (%/%) : Lorsque nous divisons des entiers avec %/% , le quotient est egalement un entier.Par exemple, x%/%y
#Exposant(^ ou **): consiste ? multiplier un element par lui-meme plusieurs fois de suite


7 + 7
7 - 4
5 * 5
6 / 6
3^2
3**2
16 %% 3 
3+7/5
((1+sqrt(5))/2)

# L'acte d'assignation / Objet

a <- 1.2
a

# a est une variable, en interne c'est un vecteur de taille 1 et il peut contenir des donnees
# Dans R, un objet repr?sente un concept, une idee. Il se materialise par une entite qui possede sa propre identite

nom <- "Keila"
prenom <- "Mobido"
annee_arrivee_pouvoir <- 1960
nom
prenom
annee_arrivee_pouvoir
a <- 5; a + 2

# Conventions pour les noms d'objets
# Les noms des objets ne peuvent commencer par un chiffre
# Le R est sensible  la casse, ce qui signifie que foo, Foo et FOO sont trois objets distincts.
# n'employer que des lettres minuscules.
# x Certains noms sont utilises par le systeme R, aussi vaut-il mieux eviter de les utiliser

# La notion de classe et de type

#Quand on a faire ? des objets dont on ignore l'identite, l'on peut s'appuyer la fonction class. Celle-ci permet de connaitre la classe de l'objet. La classe est un attribut qui contribue ? la formation de l'id?e d'un objet. Avec quoi se m?lange-t-il?
# A quelles regles de transformation se soumet-il.Basiquement, la classe dicte les principes regissant la manipulation de cet objet. Testons la fonction sur les objets que nous venons de cr?er pour bien confirmer les identit?s qu'on leur a attribu?es.
?class
class(nom)
class(annee_arrivee_pouvoir)

# Operateurs relationnels
# >  strictement superieur
# <  strictement inferieur
#  >= # superieur ou egal
#  <= # inferieur ou egal
# != # different
#  == # egal   ( oui il faut mettre == et pas =)
# And
x<-7
(x==8) & (x==6)
(x==7) & (x>=5)
(x==8) & (x==7)

# Or
(x==8) | (x>5)
(x==8) | (x>=5)

# Not
x > 8
print(!x > 8)

x <- 7

x > 8
x < 8
x <= 8
x >= 8
x == 8
x != 8
