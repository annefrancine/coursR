
#Dataviz avec plot

?plot

plot(iris)

#Tracer un graphique ( plot) illustrant toutes les
#valeurs de x dans l'ordre et a intervalles reguliers
x <- c(1:10)
x
plot(x) 

#Tracer un graphique, un nuage de points y = f(x) 
y = log10(x)
y
plot(y~x)

#Ajouter un titre
plot(x,y,main="titre")

#Mettre un titre en bas ou sous-titre 
plot(x,y,sub="sous-titre")

#Changer la couleur de la courbe et des points
plot(x,y,col="red")

# Type de graphiques (points seuls, reliees...)
plot(x,y,type="b")    # points reliees - espaces points-lignes
plot(x,y,type="o")    # points reliees - pas d'espace
plot(x,y,type="l")    # que les lignes
plot(x,y,type="p")    # que les points
plot(x,y,type="s")    # en marches type "histogramme"

# Taille des points : changer la taille des points  
plot(x,y, cex=2)
# exemple
x = c(1,3,6) ; y = c(1,5,8) ; plot(x,y, cex=1.5, type="o")
x = c(2,4,5) ; y = c(2,4,7) ; points(x,y, cex=3, type="o") 

#Epaisseur des lignes : faire varier la valeur de l'attribut "lwd"
plot(x,y,lwd=2)

#Type de ligne (continue ou en pointillÃes) : faire varier la valeur de l'attribut "lty" 
plot(x,y, lty=3) 

#Types de points : afficher les points sous forme de rond (1),
#de triangle (2) de croix (3 ou 4) ou de ronds pleins (16)

plot(x,y, pch=16) 

#Donner des titres et unites aux axes

plot(x,y,xlab = "titre de l'axe x",ylab = "axe y")

#Parametrer les limites des axes : limiter le graphique en 
#x (xlim) ou en y (ylim)
plot(x,y,xlim=c(0,10)) # l'axe x va de 0 a 10
plot(x,y,ylim=c(2,5)) # l'axe y va de 2 a 5 

#export des graphiques
#exemple1
x = c(1,3,6) ; y = c(1,5,8)
plot(x,y)
dev.print(png,filename="xy.png", width=7, height=7,units="in",res = 200)
dev.off()

#exemple2
d = c(3,4,3.5,2)
par(lwd=2) # doit preceder la fonction barplot pour changer l'epaisseur
# des traits du diagramme
c<-barplot(d, density=c(5,15,30),angle=c(0,45,70),col=6)
# density = nombres de traits par unite de surface (densite)
# angle = angle des traits

dev.print(png,filename="barplot.png", width=7, height=7,units="in",res = 200)
dev.off()

#exemple3
plot(iris)
dev.print(png,filename="irisdata.png", width=7, height=7,units="in",res = 200)
dev.off()

# mfrow et mfcol
#Le parametre mfrow de la fonction par() permet de definir un 
# decoupage (mf pour multi-frame et row car on va remplir ligne
# par ligne).
#Le parametre mfcol fait de meme en remplissant colonne par colonne.

#Ces parametres mfrow et mfcol prend donc deux valeurs :

#le nombre de lignes
#le nombre de colonnes

#mfrow
#Voici par exemple un decoupage en 2 lignes et 3 colonnes, 
#et l'ordre de remplissage des graphiques.

par(mfrow = c(2, 3))
for (i in 1:6) {
  plot.new()
  rect(0, 0, 1, 1)
  text(.5, .5, i, cex = 2)
}

# mfcol
# Le meme decoupage, mais avec le parametre mfcol, ce qui modifie
# l'ordre de remplissage des zones graphiques.

par(mfcol = c(2, 3))
for (i in 1:6) {
  plot.new()
  rect(0, 0, 1, 1)
  text(.5, .5, i, cex = 2)
}

# layout()
#Les decoupages precedents ne permettent qu'un decoupage en grille.
#Si on veut avoir un decoupage plus fin (une grande zone en haut et
#deux petites en bas, par exemple), il existe la commande layout().
#Celle-ci prend en parametre une matrice indiquant les numeros des
# graphiques, et leur placement.

#En reprenant l'exemple (une grande zone en haut et deux petites
# en bas), il nous faut definir cette matrice :

mat = matrix(c(1, 2, 1, 3), 2, 2)
print(mat)

layout(mat)
for (i in 1:3) {
  plot.new()
  rect(0, 0, 1, 1)
  text(.5, .5, i, cex = 2)
}

# Exemple d'utilisation de layout
#Nous allons utiliser layout pour representer une variable
#quantitative (co2 ici, deje presente dans R), avec les quatre 
#representations suivantes :

#Histogramme (avec la fonction hist())
#Evolution sur le temps (avec plot() - co2 étant une serie temporelle, ts sous R)
# Boite à moustache (avec boxplot())
# qq-plot (avec qqline()et qqnorm())

mat = matrix(c(4, 3, 3, 1, 2, 2, 1, 2, 2), 3, 3)
print(mat)
layout(mat)
par(mar = c(2, 2, 2, 0)+.1)
hist(co2, main = "co2")
plot(co2)
boxplot(co2, axes = FALSE)
qqnorm(co2, main = "");qqline(co2)

