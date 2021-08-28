
# Dataset
?cars
View(cars)
df = cars$speed

# Construire un histogramme
?hist
hist(df)

# Comme indique dans help, le parametre breaks peut etre l'un des elements ci-dessous :
# Un vecteur pour les points d'arret entre les cellules de l'histogramme
# Une fonction pour calculer le vecteur de point d'arret
# Un seul nombre representant le nombre de cellules pour l'histogramme
# Une chaine qui nomme un algorithme pour calculer le nombre de cellules
# Une fonction pour calculer le nombre de cellules.


hist(df, breaks = 10, main = ""Histogramme des vitesses")
hist(df, labels = T, breaks = c(0,5,10,20,30), main = "Histogramme des vitesses")
hist(df, labels = T, breaks = 10, main = "Histogramme des vitesses")
hist(df, labels = T, ylim = c(0,10), breaks = 10, main = "Histogramme des vitesses")


# Ajout de lignes à l'histogramme
graf <- hist(df, breaks = 10, main = "Histogramme des vitesses")

xaxis = seq(min(df), max(df), length = 10)
yaxis = dnorm(xaxis, mean = mean(df), sd = sd(df))
yaxis = yaxis*diff(graf$mids)*length(df)

lines(xaxis, yaxis, col = "red")



