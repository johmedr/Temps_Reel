# Projet de Stijl
# _Programmation Système orientée Temps Réel sur Xenomai_

***

# Installation et configuration
## _Remote compilation sur Raspberry Pi avec NetBeans_

***

## Créer une copie locale pour compiler sur la Raspberry 
Cloner le dépot dans un dossier local (sur le PC): 

`$ git clone https://github.com/yop0/Temps_Reel.git`

### Configuration de la Raspberry Pi

Se connecter en SSH au Raspi, avec le login `pi` et le mot de passe `raspberry`.

`$ ssh pi@adresse_rpi`

Si ce n'est pas déjà fait, configurer un compte `root` : 

`$ sudo passwd root`

Entrer le mot de passe `root`. Il faut ensuite autoriser la connection SSH en superutilisateur : 

`$ sudo nano /etc/shh/ssh_config`, 

Puis chercher la ligne `PermitRootLogin` et remplacer la valeur par `yes`. On peut maintenant se connecter en superutilisateur sur la carte. 

Exécuter ensuite : 

`$ ifconfig`

Récupérer l'adresse IP de l'interface ethernet. 

### Configuration de NetBeans

Ouvrir [NetBeans IDE 8.2](https://netbeans.org/downloads/) version C++ sur le PC : 

`$ netbeans`

Cliquer sur `File > Open Project... > /chemin/vers/copie/locale/de/Temps_Reel/ProjetDeStijl_Groupe`

Cliquer sur `Clean and Build`. Une page demandant de configurer la connection SSH s'ouvre. Choisir l'authentification par mot de passe. Une fenêtre de warning s'ouvre, cliquer sur `yes`. 
Entrer l'id `root` et le mot de passe `root` et cocher la case `Remember Password`. 

La configuration de NetBeans est normalement opérationnelle. Tenter de lancer `Clean and Build`, et se reporter à la section [Troubleshooting](https://github.com/yop0/Temps_Reel/wiki/Installation-et-configuration#troubleshooting) si le résultat est différent de `Build successful`. 

### Troubleshooting
#### NetBeans demande d'éditer la correspondance entre les chemins locaux et distants :
Se connecter en superutilisateur à la carte : 

`$ ssh root@adresse_ip_rpi`

Entrer le mot de passe, puis créer ensuite un dossier qui contiendra la copie embarquée du code. 

`$ mkdir -p /root/.netbeans/remote/nom_du_dossier/ProjetDeStijl_Groupe` 

Remplir les correspondances en mettant : 
* Dossier local : `/chemin/vers/copie/locale/de/Temps_Reel/ProjetDeStijl_Groupe`
* Dossier remote : `/root/.netbeans/remote/nom_du_dossier/ProjetDeStijl_Groupe`

_Dans certains cas, il faut entrer deux correspondances : entrer les deux mêmes lignes._

#### NetBeans n'arrive pas a exécuter le fichier `/root/.netbeans/remote/nom_du_dossier/ProjetDeStijl_Groupe/sudo`
Se connecter en superutilisateur à la carte : 

`$ ssh root@adresse_ip_rpi`

Entrer le mot de passe puis créer un lien symbolique vers `/usr/bin/sudo` dans le dossier `/root/.netbeans/remote/nom_du_dossier/ProjetDeStijl_Groupe/` : 

`$ ln -s /usr/bin/sudo /root/.netbeans/remote/nom_du_dossier/ProjetDeStijl_Groupe/`

Relancer la compilation à distance, qui devrait maintenant fonctionner.
