library(tidyverse)


#------------#lire données#----------#
df <-read.csv2("https://raw.githubusercontent.com/adeymier/Rugby/master/Changement_hemisphere/df_cght_hemisphere.csv",sep = ';', stringsAsFactors=FALSE)
colnames(df) <-c(' ', 'Nom', 'Prenom', 'Club', 'Saison', 'Pays', 'Competition', 'Nationalite', 'Lien')


#------------#Faire graphique#----------#
df %>%
  filter(Pays %in% c("France", "Japon", "Angleterre", "Irlande", "Ecosse", "Pays de Galles")) %>%
  group_by(Pays, Saison) %>%
  summarise(n=n()) %>%
  ggplot(aes(x=Saison, y=n, group =Pays, color = Pays)) + geom_line(size = 1)+
  ylab("Nombre joueurs")+xlab("Saisons") +theme_minimal() +
  ggtitle("Nombre de joueurs de l'hemisphere sud qui font leur premiere saison\ndans championnat europeen/japonais")+
  labs(caption = "source: itsrugby.com")