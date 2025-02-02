
##Pour installer le package EnhancedVolcano
#if (!requireNamespace('BiocManager', quietly = TRUE)):
#install.packages('BiocManager')

#BiocManager::install('EnhancedVolcano')
print("coucou")
library("FactoMineR")
library("factoextra")
print("les facto sont charges")

library(DESeq2)

print("DESeq2 est charge")

chemin = getwd()
setwd(chemin)

load("fichier.Rdata")


########################################
# Analyse en composantes principales : #
########################################


#install.packages("FactoMineR")
#install.packages("factoextra")

head(essai)

essai2 = t(essai)

head(essai2)

res_pca2 = PCA(X = essai2, graph = FALSE)
# --> regarder le PCA graph of individuals : on a bien 5 groupés et 3 pas groupés ! Et c'est les bons (mutés) qui sont pas groupés!

png(filename = "graph_individuals_pca.png")
fviz_pca_ind (res_pca2,
              repel = TRUE, # Évite le chevauchement de texte, 
              col.ind = mutations, # colorer by groups
              palette = c("#00AFBB", "#E7B800"),
              legend.title = "Groups",
              mean.point = FALSE
)
dev.off()

print("premiere_image_good")


########################################
# Analyse expression différentielle :  #
########################################


#library(EnhancedVolcano)

#On enlève les NA du tableau
#resultats <- resultats[complete.cases(resultats[,6]),]

##Comme on ne veut pas afficher de noms car cela rend le graphique moins lisible
#On veut lui dire de n'afficher les noms que des genes etant tres a gauche ou tres a droite du graphe
#keyvals <- ifelse(resultats$log2FoldChange < -10, 'petit',
#                  ifelse(resultats$log2FoldChange > 10, 'grand','normal'))

#png(filename = "enhancedVolcano.png")
#EnhancedVolcano(resultats,
#                lab = rownames(resultats),
#                x = 'log2FoldChange', selectLab = rownames(resultats)[which(keyvals %in% c('petit', 'grand'))],
#                y = 'padj', 
#                title = 'WT VS muté avec p-value ajustée', xlim = c(-10,10), ylim = c(-1,20),
#                pCutoff = 0.05,
#                FCcutoff = 1,
#                pointSize = 3.0, drawConnectors = TRUE,widthConnectors = 0.75,
#                labSize = 6.0)
#dev.off()
