rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(igraph)
MyGraphData <-
  read.graph(file = "Wiki-Vote.txt", directed = T)#directedgraph

#Nombredenoeudsdanslegraphe
Nb_noeuds <- vcount(MyGraphData)

#Pourenleverlesdoublonsetlesbouclesdanslegraphe
MyGraphData <-
  simplify(MyGraphData,
           remove.multiple = TRUE,
           remove.loops = TRUE)#simplify(graph,remove.multiple,remove.loops)

#Nombred'arrêtesdanslegraphe
Nb_arcs <- ecount(MyGraphData)

#probabilitéquelesnoeudsadjacentsàunnoeuddonnésoientconnectésesttrèsfaible0.12
transitivitedugraphe <-
  transitivity(MyGraphData, type = "localaverage", isolates = "zero")

longueurmoyennedescheminsentredeuxnoeuds <-
  average.path.length(MyGraphData)

#CentralitéintermédiairedechaquenoeudCentralitémoyennedesnoeudsdanslegraphe
C_i <- betweenness(MyGraphData)

#Normalisation
Ci_norm <-
  (C_i - min(C_i)) / (max(C_i) - min(C_i))

plot(Ci_norm,
     xlab = "Noeuds",
     ylab = "Centralitémoyennenormalisée",
     col = "red")

C_i_moyenne <- mean(Ci_norm)

print(summary(degree(MyGraphData, mode = "in")))
noeuds_isoles <- V(MyGraphData)[degree(MyGraphData, mode = "in") < 200]

#Créerlenouveaugrapheensupprimantlesnoeudsisolés
nouveau_graphe <- delete.vertices(MyGraphData, noeuds_isoles)
plot(nouveau_graphe)