#Dataviz avec ggplot2
# Par exemple
install.packages("ggplot2")
install.packages("ggridges")
library(ggplot2)
library(ggridges)

?ggplot

ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(aes(fill = Species)) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FC4E07"))

p <- ggplot(mpg, aes(class, hwy))
  p + geom_boxplot()
  
#1) Definition de la couche canevas
#Pour definir ce que j'appelle la couche canevas, on utilise 
#la fonction ggplot() et son argument aes().
#Les graphs construits avec ggplot2 commencent toujours 
#par ce type de ligne de code :

ggplot(dataset, aes(x=, y = ))

# Par exemple:
ggplot(mtcars, aes(x=disp, y=mpg))

#2)Definition du type de plot : geom_XXX
#Il s'agit ensuite de definir le type de graph que l'on souhaite 
#realiser : un scatter plot, un boxplot, un barplot, etc� 
#Pour cela, on rajoute un signe plus en bout de la premiere
#ligne (celle du canevas), et on ajoute une nouvelle ligne 
#avec la fonction adequate : geom_point() pour un scatter plot, 
#geom_boxplot() pour un boxplot, geom_bar() pour un barplot etc�

ggplot(mtcars, aes(x=disp, y=mpg))+
  geom_point()


#3) Definition des options du graph
#Dans un troisieme temps, on affine le graph, en precisant differentes couches
# concernant :

#les echelles des axes : avec la fonctions scale_x_continuous(), par exemple
#les couleurs : avec la fonction scale_colour_manual(), par exemple
#les noms des axes, avec les fonctions xlab(), ylab(), par exemple
#la legende avec, par exemple, avec la fonction theme(legend.position,=”bottom”)

#Par exemple, pour passer l'axe des x dans l'echelle log, on ajoute la couche correspondante, grâce à la fonction coord_trans().

ggplot(mtcars, aes(x=disp, y=mpg))+
  geom_point() +
  coord_trans(x="log10")

#Dataviz iris
?iris
View(iris)

#1)Le scatterplot de base
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))+
  geom_point()

#2)Definir des couleurs selon une variable
#Le jeu de donnees comporte, en realite, trois especes 
#differentes (variable Species). Pour representer les points avec 
#une couleur differente par espece, on va definir l'argument colour dans 
# la fonction aes() 

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()

#3)Choisir autres couleurs
#Pour choisir autres couleurs que celles appliquees par defaut, 
#on utilise la fonction scale_colour_manual(). 

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))

#4)Utiliser des formes de points differentes
#Pour cela, on utilise argument shape dans aes() :

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, shape=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))

#5)Choisir les formes des points
#Pour cela, on utilise scale_shape_manual()

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, shape=Species))+
  geom_point()+
  scale_shape_manual(values=c(21,23,25))

#6)Gerer la taille des points
#On peut representer les points avec des tailles différentes,
#par exemple en fonction de la valeur d'une variable. 
#Pour cela, on utilise argument size dans aes().

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, size=Petal.Length))+
  geom_point()

#7)Ajouter une courbe ou droite de regression
#Pour cela on utilise la fonction geom_smooth(). 
#Par defaut, cest une courbe de regression locale (LOESS) 
#si n < 1000. Sinon, cest une courbe de modele additif generalise qui est employee.  

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))+
  geom_smooth( colour="red")

# Il est possible d'obtenir une droite de regression,
#en ajoutant argument method=lm

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))+
  geom_smooth(method="lm", colour="red")

#Il est aussi possible obtenir une droite par espece, 
#en utilisant argument group dans la fonction aes() de 
#la premiere ligne.

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, colour=Species, group=Species))+
  geom_point()+
  scale_colour_manual(values=c("magenta", "orange", "blue"))+
  geom_smooth(method="lm", colour="red")

#Boxplot de base
#on utilise la fonction geom_boxplot()

ggplot(iris, aes( y=Sepal.Length,x=Species))+
  geom_boxplot()

#Pour utiliser des couleurs dans les boites, ici on utilise
#argument fill et non colour, dans la fonction aes() :


ggplot(iris, aes( y=Sepal.Length,x=Species, fill=Species))+
  geom_boxplot()

#Pour ajouter les observations, on utilise la couche geom_jitter().
ggplot(iris, aes( y=Sepal.Length,x=Species, fill=Species))+
  geom_boxplot()+
  geom_jitter()

#Les axes, titres et legende
#Vous pouvez donner un titre  avec la fonction
#ggtitle(), puis renommer les axes avec ylab() et xlab().
#La position de la legende se gere avec theme(legend.position=).

ggplot(iris, aes( y=Sepal.Length,x=Species, fill=Species, colour=Species))+
  geom_boxplot(alpha=0.5)+
  geom_jitter(width=0.25)+
  ggtitle("Mon super premier boxplot")+
  ylab("Longueur des sepales")+
  xlab("Especes")+
  theme(legend.position="bottom")

#Les themes
#Il existe egalement des themes de graphs 
#classic

ggplot(iris, aes( y=Sepal.Length,x=Species, colour=Species))+
  geom_boxplot(alpha=0.5)+
  geom_jitter(width=0.25)+
  theme_classic()

#dark
ggplot(iris, aes( y=Sepal.Length,x=Species, colour=Species))+
  geom_boxplot(alpha=0.5)+
  geom_jitter(width=0.25)+
  theme_dark()


##########################################################

#Barplot 
#En utilisant le jeu de donnees mtcars, imaginons, par exemple, que je veuille
# representer le nombre de voitures ayant 3,4 ou 5 vitesses (variables gear) :
  # pas de y car c'est un comptage
View(mtcars)
?mtcars

ggplot(mtcars,aes(as.factor(gear)))+
  geom_bar()

#Pour ajouter des couleurs aux barres, comme precedemment,
#utiliser argument fill et indiquer quelle variable doit 
#etre consideree 

ggplot(mtcars,aes(as.factor(gear), fill=as.factor(gear)))+
  geom_bar()

#Pour representer le nombre de donnees par vitesse, 
#en fonction d' autre variable (ici le nombre de carburateurs),
#il suffit d'indiquer dans l'argument fill

# en prenant en compte deux variables categorielles (ici carb et gear)
ggplot(mtcars,aes(as.factor(gear), fill=as.factor(carb)))+
  geom_bar()

# On peut encore ramener la somme des comptages a 1,
#autrement dit de representer les comptages
#sous la forme de pourcentages. Pour cela,
#on utilise argument position=fill :

ggplot(mtcars,aes(as.factor(gear)))+
  geom_bar(aes(fill=as.factor(carb)),position = "fill")

#Il est egalement possible de representer ces donnees avec
#un autre positionnement, en utilisant option dodge.

ggplot(mtcars,aes(as.factor(gear), fill=as.factor(carb)))+
  geom_bar(position = "dodge")

#Le facetting
#C'est une des grandes possibilites de ggplot2. Ca consiste
# sous diviser un graph, selon les modalites d'une ou plusieurs
#variables. Ici par exemple, je vais utiliser le jeu de donnees
#Melanoma du package MASS, et je vais etudier les relations entre
#la variable thickness et time, pour chacune des modalites de 
#la variable status

install.packages("MASS")
library(MASS)
View(Melanoma)
head(Melanoma)
str(Melanoma)

ggplot(Melanoma, aes(y=thickness, x=time))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~status)

#La division peut egalement ere faite en fonction de deux variables
ggplot(Melanoma, aes(y=thickness, x=time))+
  geom_point()+
  geom_smooth()+
  facet_grid(sex~status)

dev.print(png,filename="melanoma.png", width=7, height=7,units="in",res = 200)
dev.off()

#pie charts
df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
)
head(df)

bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")
bp

pie <- bp + coord_polar("y", start=0)
pie
