rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(igraph)
MyGraphData <-
  read.graph(file = "facebook/0.edges", directed = FALSE)#read.graph(file,directed)

#Nombredenoeudsdanslegraphe
Nb_noeuds <- vcount(MyGraphData)

#Pourenleverlesdoublonsetlesbouclesdanslegraphe
MyGraphData <-
  simplify(MyGraphData,
           remove.multiple = TRUE,
           remove.loops = TRUE)#simplify(graph,remove.multiple,remove.loops)

#Nombred'arrêtesdanslegraphe
Nb_arretes <- ecount(MyGraphData)

cluster <- edge.betweenness.community(MyGraphData)
plot_dendrogram(cluster)

set.seed("20180507")
#Ajouterlacommunautéindiquantlescouleursd'arrièreplan
plot(
  MyGraphData,
  vertex.color = cluster$membership,
  vertex.size = log(degree(MyGraphData) + 1),
  mark.groups = by(seq_along(cluster$membership), cluster$membership, invisible)
)

# Centralité intermédiaire de chaque noeud Centralitémoyennedesnoeudsdanslegraphe
C_i <- betweenness (MyGraphData)
C_i_norm <- (C_i - min (C_i) / (max (C_i) - min (C_i)))


plot (C_i_norm ,
      xlab = "Noeuds",
      ylab = "Centralité intermédiaire",
      col = "red")

C_i_moyenne <- mean (C_i_norm)