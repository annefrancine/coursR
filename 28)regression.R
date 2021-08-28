#Regression
#La régression linéaire est une modélisation linéaire qui permet d'établir des 
#estimations dans le futur à partir d'informations provenant du passé. Dans ce modèle
#de régression linéaire, on a plusieurs variables dont une qui est une variable 
#explicative et les autres qui sont des variables expliquées. Cet outil est utilisé 
#pour les analyses techniques boursières mais aussi pour la gestion de budgets. 
#Elle est souvent calculée avec la méthode des moindres carrés qui permet de réduire 
#les erreurs en ajoutant de l'information.

Y= ß0+ß1x1+ß2x2+e

#Y correspond à la variable dépendante
#x1 et x2 correspondent aux variables explicatives
#e correspond à l'erreur d'estimation
#ß0 ß1 et ß2 correspondent aux coefficients qui permettent de réduire l'erreur e

# Exemple 1: dataset mtcars
data(mtcars)
View(mtcars)

#Si nous nous intéressons à la relation entre l'efficacité énergétique ( mpg ) et
#le poids ( wt ), nous pouvons commencer à tracer ces variables avec:

plot(mpg ~ wt, data = mtcars, col=2)

#Les graphiques montrent une relation (linéaire)! Alors, si nous voulons effectuer 
#une régression linéaire pour déterminer les coefficients d’un modèle linéaire, 
#nous utiliserons la fonction lm :

fit <- lm(mpg ~ wt, data = mtcars)

#Le ~ signifie ici "expliqué par", donc la formule mpg ~ wt signifie que nous 
#prédisons mpg comme expliqué par wt. Le moyen le plus utile de visualiser le 
#résultat est le suivant:

summary(fit)

#Cela fournit des informations sur:

#la pente estimée de chaque coefficient ( wt et l'ordonnée à l'origine), 
#ce qui suggère que la meilleure prévision de mpg est 37.2851 + (-5.3445) * wt

#La valeur p de chaque coefficient, ce qui suggère que l'interception et le poids 
#ne sont probablement pas dus au hasard

#Les estimations globales de l'ajustement telles que R ^ 2 et R ^ 2 
#(coefficient de determination ou r-squared) ajusté, 
#qui montrent combien de variation du mpg est expliqué par le modèle

#Le R², ou R-carré est appelé coefficient de détermination. C’est un indicateur 
#utilisé en statistiques pour juger de la qualité d’une régression linéaire.
#Mathématiquement, il s’agit de la proportion de la variance d’une variable 
#dépendante qui s’explique par une ou plusieurs variables indépendantes dans le 
#modèle de régression. On l’exprime soit entre 0 et 1, soit en pourcentage

#Si le R² est proche de zéro, alors la droite de régression colle à 0% avec 
#l’ensemble des points donnés.

#Si le R2 d’un modèle est de 0,50, alors la moitié de la variation observée dans 
#le modèle calculé peut être expliquée par les points

#Si le R² est de 1, alors la régression détermine 100% de la distribution des points.
#En pratique, il est impossible d’obtenir un R2 de 1 à partir de données empiriques.
#On considère qu’un R carré est élevé lorsqu’ils se situe entre 0.85 et 1


#Nous pourrions ajouter une ligne à notre premier tracé pour montrer le mpg prévu:
abline(fit,col=3,lwd=2)

# Il est également possible d'ajouter l'équation à cette parcelle. 
#Premièrement, obtenez les coefficients avec coef . Ensuite, en utilisant paste0 
#nous paste0 les coefficients avec les variables appropriées et +/- , pour construire
#l'équation. Enfin, nous l’ajoutons au graphique en utilisant mtext :

bs <- round(coef(fit), 3) 
lmlab <- paste0("mpg = ", bs[1],
                ifelse(sign(bs[2])==1, " + ", " - "), abs(bs[2]), " wt ")
mtext(lmlab, 3, line=-2) 

#exemple 2
#Essayons de voir si on peut retrouver la relation entre taille,
#poids et IMC sachant qu'on connait pour une fois la réponse 
#IMC= poids/(taille/100)²

# Etape 0: Simulons ce jeu de données :

nb = 180 ; poids <- round(rnorm(nb,65,11),0)  ; imc <- rnorm(nb,22,5) ; # IMC 
taille <- round(sqrt(poids/imc)*100,0) ; taille_bis <- round(rnorm(nb,170,11),0)
taille_biss <- round(rnorm(nb,170,11),0) ; taille <- round((taille+taille_bis+taille_biss)/3,0)
imc <- round(poids/(taille/100)^2,1)
compil <- data.frame(poids,taille,imc) # Compilation des valeurs
View(compil)

# Etape 1: Décrire le jeu de données afin de comprendre les relations
#entre Y (l'IMC) et les variables X1 et X2 (poids et taille)

plot(compil) 
# Permet d'établir directement une relation entre toutes les 
#variables d'un data.frame.

#On voit ainsi que poids et IMC sont bien liés et que l'IMC 
#a tendance à baisser si la taille augmente.

#1.1- Établir un lissage de la relation poids // IMC. 
#Un lissage permet de se donner une idée précise de la relation
#existante entre deux variables et d'estimer la linéarité
#de cette relation !

install.packages("car")
library(car)


#On peut utiliser la commande par défaut scatterplot() de la 
#librairie car :
scatterplot(imc~poids, data=compil, regLine=list(method=lm, lty=1, lwd=2, col="red"))

#On y voit ainsi figurer la courbe de lissage moyenne, les 
#courbes de lissage des intervalles de confiance et une 
#régression obtenue par les moindres carrés (en rouge ici)


#1.2 - Décrire les relations statistiques entre les variables
#X1, X2... et Y avec les fonctions cor(), cor.test() et le R²

#Afficher un tableau de variance, covariance avec cor()
round(cor(compil),2)

#Le tableau renvoyé permet d'un seul coup d'œil de voir le niveau de corrélation entre les variables.

#Mais cela ne suffit pas, une faible corrélation peut être très
#significative. Un paramètre peut jouer un peu mais de façon
#certaine.

#On peut aussi afficher un diagramme de corrélation avec 
#la librairie corrplot

library(corrplot)
corrplot(cor(compil))

#Établir la significativité de l'influence de chaque
#paramètre avec cor.test()

# Je teste une relation linéaire entre poids et imc
cor.test(compil$imc,compil$poids)
cor.test(compil$imc,compil$taille)

#La p-value renvoyé à chaque fois montre ici un lien 
#significatif entre poids et imc et légèrement significatif 
#entre taille et IMC. 

#Remarque : la méthode par défaut ici est la méthode de Pearson. Il en existe d'autres.

#Analyser la forme de la relation avec le R² (coefficient de détermination)
#Si R² = 1, le nuage est très allongé, X et Y tracent une droite.

#Si R² = 0, le nuage se disperse dans tous les sens et une 
#régression linéaire ne permettra pas de faire des prédictions.

# Je calcule mon R²
cor(compil$imc,compil$poids)^2
cor(compil$imc,compil$taille)^2

#Etape 2:  Réaliser le modèle de régression linéaire

#Je tente un premier modèle de régression :
reg1 <- lm(imc~poids, data=compil)

#J'affiche le résultat :

plot(imc~poids,pch=16,data=compil)
abline(reg1,col="red",lwd=2)

#Je décris ma régression avec les commandes :
summary(reg1) # décris la régression
coef(reg1) # affiche les coefficients de la droite
residuals(reg1) # donne les résidus

#Extraire les p-values de chaque coefficient :

summary(reg1)[[4]][,4]

#Extraire la p-value finale de la régression
str(summary(reg1))

# Extraction de la p-value
pf(summary(reg1)$fstatistic[1],summary(reg1)$fstatistic[2],summary(reg1)$fstatistic[3],lower.tail=FALSE)

#Etape 3: Contrôler le modèle de régression linéaire

#3.0- On va vérifier d'abord que le modèle de régression semble adapté.
plot(reg1, which = 1) 
#Sur ce graphique, la ligne rouge doit être approximativement
#horizontale s'il y a bien une relation linéaire en X et Y. 

#Ici, cette relation se vérifie mais on voit qu'elle n'est pas
#parfaite !
  
#Vérification l'adéquation par le test de Rainbow (adéquation : p-value > 0,05)

install.packages("lmtest") ; library("lmtest") ;
raintest(reg1) # test de rainbow

#Il y a adéquation du modèle de régression si la 
#p-value est supérieur à 0,05.

#3.1) Indépendance des résidus
#Les résidus ne doivent pas être liés les uns aux autres. 
#En gros : on ne doit pas pouvoir anticiper en résidu par la 
#connaissance d'un autre résidu.

#On veut éviter les phénomènes d'auto-corrélation : les résidus
#augmenteraient ensemble dans une zone donnée et seraient liés 
#les uns aux résidus précédents ou suivants (cas typiques 
#lorsque X est un enregistrement du temps).

#Vérification par le test de Durbin-Watson (indépendance : p-value > 0,05)

durbinWatsonTest(reg1) # nécessite la librairie car
dwtest(reg1) # nécessite la librairie lmtest

#Attention : 0,05 n'est qu'une limite, il ne faut pas renoncer
#si on a 0,03 !
  
#Autre remarque : ce test n'évalue que l'autocorrélation entre
#résidus et le résidus qui suit directement (n+1) et non ceux 
#séparés d'un intervalle (résidus+2) qui pourraient être 
#autocorrélés dans un phénomène cyclique.

#On peut aussi visualiser l'indépendance avec ce graphique suivant :

acf(residuals(reg1), main="Regression IMC = f(poids)")

#L'interprétation de ce graphique se fait de la manière suivante :

#Le premier bâtonnet est très élevé, c'est l'auto-corrélation 
#des résidus avec eux-même !

#Le deuxième bâtonnet indique l'auto-corrélation entre les
#résidus et les résidus n+1 : il y a auto-corrélation dès que
#le bâtonnet (lag) dépasse les pointillés.

#Le troisième bâtonnet entre les résidus n et les résidus n+2... etc.

#3.2- Distribution normale des résidus
#On peut vérifier que les résidus suivent la loi normal avec 
#un histogramme classique (cela devrait dessiner une courbe de
#gauss approximativement).

hist(residuals(reg1),col="yellow",freq=F)
densite <- density(residuals(reg1)) # estimer la densité que représente ces différentes valeurs
lines(densite, col = "red",lwd=3) # Superposer une ligne de densité à l'histogramme


#Vérification par le test de Shapiro-Wilk (normalité : p-value > 0,05)
#Un test permet de trancher sur la normalité de la distribution des résidus : c'est le test de normalité de Shapiro-Wilk

shapiro.test(residuals(reg1))

#On peut considérer qu'il y a normalité tant que la p-value 
#reste supérieure à 0,05 (mais on le rappelle que c'est une 
#frontière floue : on peut tolérer 0,03).

#Etape 4: Estimer la pertinence du modèle
#Voici quelques indices qui permettent de prouver qu'un modèle de régression est bon.
#C'est le cas du RSS, de l'AIC, du BIC, du MSE.

# Le RSS (Residual Sum of Squares), la somme des résidus
#au carré, illustre la pertinence d'un modèle de régression.
#Plus le RSS est petit, mieux c'est !

#Le R² ajusté, R squared adjusted. Ce R² doit tendre vers 1.
#Il se calcule à partir du RSS. Mais attention ! On peut avoir 
#un R² proche de 1 si on a compilé un grand nombre de variable 
#et fait le modèle à partir d'un seul échantillon sans jamais
#le tester.

#L'AIC (Critère d'Information d'Akaike) est plus pertinent que
#le RSS car elle va simuler un RSS si on avait eu des données
#inconnues. Elle va aussi pénaliser l'augmentation du nombre 
#de variables. Plus l'AIC est petit, mieux c'est !

#Le BIC (Critère d'Information Bayésien) pénalise encore plus 
#que l'AIC le nombre de variables. On doit donc trouver un
#compromis entre le nombre de variables et le BIC le plus bas.
#Plus le BIC est petit, mieux c'est !

#Le MSE (Mean Sqare Error). Équivalent au RSS, le MSE est 
#calculé sur un échantillon test que l'on va appliquer au
#modèle établi à partir d'un échantillon d'apprentissage.
#La MSE tient compte du nombre d'individus. Critère pertinent !
#Plus le MSE est petit, mieux c'est !

#Le biais, distance entre le modèle et la réalité. C'est plus souvent d'ailleurs la différence entre le modèle et l'échantillon.
#Plus le biais est petit, mieux c'est !

#La variance, potentialité des coefficients du modèle à bouger
#d'un échantillon à l'autre.
#Moins ils bougent, mieux c'est !

summary(reg1) # A regarder : Adjusted R-squared:

#Si le coefficient intercept (la valeur b dans une équation 
#y = ax + b), et les autres coefficients directeurs sont associés à des valeurs Pr petites (et plusieurs étoiles), alors ils ont un impact significatif et sont pertinents.
#Le R² ajusté vaut ici de 0,5869 ce qui n'est pas énorme. 
#On pourrait améliorer le modèle de régression pour approcher 1.
#La p-value très basse (2.2e-16) montre aussi que le modèle établit une relation pertinente entre poids et IMC.
#Ce lien ne peut être nié mais il peut probablement être ajusté.


#La fonction confint() permet d'accéder facilement aux
#intervalles de confiance sur les coefficients.

coef(reg1) # affiche les coefficients du modèle
confint(reg1, level = 0.95)
# affiche les coefficients min et max correspondant aux 
#intervalles de confiance à 95%

#La fonction predict() en paramètrage "prediction" va renvoyer 
#le domaine où se situeraient toutes les droites possibles. 
#matplot() pourra afficher le tout.

# Où se trouvent les droites possibles du fait de la fluctuation des coefficients ?
new <- data.frame(poids = seq(30, 50, 0.5),taille<-rep(mean(taille),41))
yy <- predict(reg1, new, interval="prediction")
matplot(new$poids,yy,lty=c(1,3,3), type="l",ylab="predicted y" ,col=c('black','green','green'))

#Étape 5 - Régression multiple
#Créons donc des modèles de régressions pour essayer de 
#retrouver la relation entre IMC et poids / taille

reg2 <- lm(imc~poids+taille,data=compil)
reg3 <- lm(imc~poids*taille,data=compil)
reg4 <- lm(imc~poids*poly(taille,2),data=compil)
reg5 <- lm(imc~poids:taille,data=compil)
reg6 <- lm(imc~poids*I(taille^2),data=compil)
reg7 <- lm(imc~poids*I(1/(taille/100)^2)+0,data=compil)
reg8 <- lm(imc~poids:I(1/(taille/100)^2)+0,data=compil)# C'est le vrai modèle où IMC = poids/taille_en_cm² - pas de valeur B

#La fonction coef() permet d'afficher l'ensemble des
#coefficients de la régression.

coef(reg2)

#Étape 6 - Sélectionner le meilleur modèle

#On y accède avec summary() sinon on peut regarder les R²
#non ajustés (très proches, moins fiables).

summary(reg1)  # 0.54
summary(reg2)  # 0.98
summary(reg3)  # 0.99
summary(reg4)  # 0.99
summary(reg5)  # 0.29
summary(reg6)  # 0.98
summary(reg7)  # 1
summary(reg8)  # 1

#On voit ici que le modèle reg1 qui ne dépend que du poids
#n'est pas pertinent à côté des autres, tout comme reg5

#6.2) Comparer les modèles de régression avec la fonction anova()
?anova
#La fonction anova() permet de faire des comparaisons entre modèles. 
anova(reg2,reg3,reg4,reg6,reg7)

#Il suffit de regarder le RSS (en gras) pour savoir quelle est le meilleur modèle. Le 3ème (reg4) et le cinquième (reg7).
#On peut comparer ces deux modèles reg4 et reg7.

anova(reg4,reg7) 
# L'absence d'étoiles indique bien que ces modèles peuvent 
#être considérés comme équivalent en termes de relations 
#linéaires.

#6.3- Comparer les modèles de régression par l'intermédiaire des RSS
#Calculer les RSS des modèles : ce calcul peut se faire de la
#façon suivante - sans passer par la fonction anova().

sum(reg7$residuals^2)
# sommes des résidus mis au carré pour le modèle reg7


#Etape 7: Faire des prédictions
#La commande predict est excellente pour pouvoir prédire les
#valeurs possibles à partir d'un modèle de régression.

# Pour que predict() fonctionne, les données de prédictions 
#doivent être sous forme de data.frame.

new <- data.frame(poids = seq(30, 50, 0.5),taille<-rep(mean(taille),41))
pred_droites <- predict(reg2, new, interval="confidence",level=0.95)

#En paramétrage confidence (+ level=0.95), predict() prédit 
#des valeurs à partir d'un modèle de régression et donne les
#intervalles de confiance des estimations.

# Trace les trois courbes
matplot(new$poids,pred_droites,lty=c(1,2,2), type="l",xlab ='x',ylab="predicted y",col=c('black','blue','blue'))
