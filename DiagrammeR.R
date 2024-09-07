
# Installation du package
install.packages("DiagrammeR")

# Chargement du package
library(DiagrammeR)

# Création d'un DAG de base
graph <- grViz("
  digraph DAG {
    A [label = 'Exposition', shape = box, color = black , fontcolor = orange4]
    B [label = 'Résultat', shape = box, color = black , fontcolor = green]
    C [label = 'Confondants', shape = circle, color = black, fontcolor = black]
  
    # Définir les relations causales
    A -> B [color = '#6BCB77', penwidth = 2]
    C -> A [color = '#FF6F61', penwidth = 2]
    C -> B [color = '#FF6F61', penwidth = 2]
  }
")

# Affichage du graph
graph


# Créer un diagramme  avec mermaid

mermaid("
graph TD;
    A[X] --> B[Y];
    C[U] --> B;
    D[v] --> B;
    C --> A;
    style A fill:#6BCB77,stroke:#333,stroke-width:2px;
    style B fill:#4D96FF,stroke:#333,stroke-width:2px;
    style C fill:#F7C59F,stroke:#333,stroke-width:2px;
    style D fill:#FF6F61,stroke:#333,stroke-width:2px;
")

# Créer un diagramme  avec create_graph

# Créer un graphique vide
graph <- create_graph()

# Ajouter des nœuds et des arêtes
graph <- graph %>%
  add_node(label = "X", node_aes = node_aes(fillcolor = "#6BCB77")) %>%
  add_node(label = "Y", node_aes = node_aes(fillcolor = "#4D96FF")) %>%
  add_node(label = "U", node_aes = node_aes(fillcolor = "#F7C59F")) %>%
  add_node(label = "V", node_aes = node_aes(fillcolor = "#FF6F61")) %>%
  add_edge(from = 1, to = 2, edge_aes = edge_aes(color = "#4CAF50", penwidth = 2, label = "Effet Direct")) %>%
  add_edge(from = 3, to = 2, edge_aes = edge_aes(color = "#FFC107", penwidth = 2)) %>%
  add_edge(from = 3, to = 1, edge_aes = edge_aes(color = "#FF9800", style = "dashed", penwidth = 1.5, label = "Relation Modératrice")) %>%
  add_edge(from = 4, to = 2, edge_aes = edge_aes(color = "#E91E63", penwidth = 2, label = "Facteur Confondant")) %>%
  add_edge(from = 4, to = 1, edge_aes = edge_aes(color = "#E91E63", penwidth = 2, label = "Facteur Confondant"))

# Afficher le graphique
render_graph(graph)
