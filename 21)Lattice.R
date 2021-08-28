# Lattice


# La bibliotheque "lattice" est la version R de la bibliotheque 
#"Trellis" de W. Cleveland.
# Son objectif est de produire des graphiques, souvent multipanneaux,
# qui sont à la fois puissants (beaucoup d'options) et 
#optimises pour la visualisation statique (impression) et de qualite de publication.


# Installer et charger le package
install.packages('lattice')
library(lattice)

# ScatterPlot avec Lattice
View(iris)
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)

# BarPlots avec dataset Titanic
?Titanic

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = "Titanic", columns = 2))

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = " Titanic", columns = 2),
         scales = list(x = "free"))


# Nombre d'elements
PetalLength <- equal.count(iris$Petal.Length, 4)
PetalLength

# ScatterPlots
xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris)


xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris,
       panel = function(...) {
         panel.grid(h = -1, v = -1, col.line = "skyblue")
         panel.xyplot(...)})


xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris,
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         mylm <- lm(y~x)
         panel.abline(mylm)})


histogram(~Sepal.Length | Species, xlab = "",
          data = iris, layout=c(3,1), type = "density",
          main = "Histogramme Lattice", sub = "Iris Dataset, Sepal Length")


# Distribution de donnees
qqmath(~ Sepal.Length | Species, data = iris, distribution = qunif)


# Boxplot
bwplot(Species~Sepal.Length, data = iris)


# ViolinPlot
bwplot(Species~Sepal.Length, data = iris,
       panel = panel.violin)



