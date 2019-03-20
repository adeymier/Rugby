#Loading packages
library(tidyverse)
library(wesanderson)

#getting the dbs
df <-read.csv2("https://raw.githubusercontent.com/adeymier/Rugby/master/Insertion_U20/Top14_WRC_U20.csv",sep = ';')
df2 <- read.csv2("https://raw.githubusercontent.com/adeymier/Rugby/master/Insertion_U20/WRC_U20.csv",sep = ';')

#--------------------------------------------------------------#
#--------------------------------------------------------------#
#Est ce que les U20s fr sont différents des autres jeunes fr?
#--------------------------------------------------------------#
#--------------------------------------------------------------#
df %>%
  group_by(age, competition, WC_U20) %>%
  summarise(mean = mean(minutes)) %>%
  ggplot(aes(x=age, y = mean, group = WC_U20, color= WC_U20)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  ylab('Temps de jeu') +
  ggtitle('Progression du temps de jeu moyen des joueurs fr\nayant fait coupe du monde U20 vs autres fr en Top 14') +
  theme_minimal() +
  scale_color_manual(values=c("#EBCC2A", "#78B7C5"), name = "Type jeune", 
                     labels = c('Coupe du Monde U20', 'Autres'))


#--------------------------------------------------------------#
#--------------------------------------------------------------#
#Nombre moyen par génération qui perce.
#--------------------------------------------------------------#
#--------------------------------------------------------------#
df2 %>%
  group_by(age, Competition, year) %>%
  summarise(n= n()) %>%
  group_by(age, Competition) %>%
  summarise(moyenne = mean(n)) %>%
  ggplot(aes(x=age, y = moyenne, group = Competition, color= Competition)) + 
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  ylab('Nombre de joueur') +
  ggtitle('Progression moyenne du nombre de U20\nen 1ere division') +
  theme_minimal() +
  scale_color_manual(values=wes_palette(n=3, name='Zissou1'),name ="Competition", 
                     labels = c('Anglais/Premiership', 'Neo-Z/Super Rugby', 'Francais/Top 14')
  )
#--------------------------------------------------------------#
#--------------------------------------------------------------#  
#Temps de jeu ?
#--------------------------------------------------------------#
#--------------------------------------------------------------#
#Temps de jeu
df2 %>%
  group_by(age, Competition, year) %>%
  summarise(mean = mean(minutes)) %>%
  group_by(age, Competition) %>%
  summarise(moyenne = mean(mean)) %>%
  ggplot(aes(x=age, y = moyenne, group = Competition, color= Competition)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  ylab('Temps de jeu') +
  ggtitle('Progression du temps de jeu moyen des joueurs U20\nen 1ere division par age') +
  theme_minimal() +
  scale_color_manual(values=wes_palette(n=3, name='Zissou1'),name = "Competition", 
                     labels = c('Anglais/Premiership', 'Neo-Z/Super Rugby', 'Francais/Top 14')
  )