# Creer des conditions

#If : executer une action si la condition est verifiee
if (maCondition){ action }
# Si la condition est vrai (TRUE), alors l'action contenue entre crochets 
# est declenchee.  Sinon, les lignes contenues entre crochets sont 
# ignorees.

# Else : executer une action si la condition n'est pas verifiee
# Il est possible de declencher une action si la condition n'est pas 
# verifiee  grace ‡ l'element else.  L'element else doit etre situe sur 
# la meme ligne que le crochet fermant la condition.

if (variable == TRUE) { print("Ma condition est validee") } else {
  print("Ma condition n'est pas valid√ee") }

B<-TRUE
x<-2

if (B==TRUE){
  x<-x+1
  y<-10
}
x

x=9
if (x < 7) {
  "ce nombre est inferieur a 7"
} else {
  "ce nombre n'est pas inferieur a 7"
}

#La fonction ifelse()
#La fonction ifelse() peut etre utilisee afin de simplifier l'ecriture 
# de certaines conditions.
ifelse(maCondition, actionSiVrai, actionSiFaux)

x = 5
ifelse (x < 6, "bien!", NA)

x = 9
ifelse (x < 6, "bien!", NA)

#expressions ifelse imbriquees

x = c(7,5,4)
ifelse(x < 5, "inferieur a 5", 
       ifelse(x == 5, "egal e 5", "superieur a 5"))

# Repeat
?repeat
x = 1
repeat {
  x = x + 3
  if (x > 99)
    break
  print(x)}

# Rep
?rep
?rnorm
rep(rnorm(10), 5)

