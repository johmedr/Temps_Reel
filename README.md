# Temps_Reel

## I- Exigences et tests

### 1°) Le système est réinitialisable. (i.e. on peut le remettre dans l’état initial) - Possibilité de reprendre une connexion après un échec et assurance d’une communication fiable avec le robot, sans influence de pertes sur le comportement du système

Test 1 : Tout lancer normalement, puis éteindre le moniteur et le relancer. 
Résultats attendus : La communication se rétablit entre le moniteur et le robot, sans pertes de fonctionnalités. 

Test 2 : Envoyer des messages au robot, à travers un obstacle pour générer des messages incorrects. 
Résultats attendus : Le robot détecte les messages incorrects, peut se reconnecter au moniteur (se réinitialise), et est toujours pilotable.

### 2°) Éteindre le robot quand le moniteur est éteint

Test : On envoie au robot des ordres de position, et on éteint subitement le moniteur.
Résultats attendus : Le robot continue d’exécuter les ordres pendant 7 secondes, puis s’éteint devant l’absence de communication avec le moniteur.

### 3°) Contrôler déplacements et vitesse du robot toutes les 1 secondes. 

Test : Envoyer différents ordre de position, contrôler la position réelle du robot.
Résultats attendus : Tous les ordres sont bien exécutés : le robot se place à la bonne position, avec la bonne vitesse.

### 4°) Contrôler l’état de la batterie 

Test : thread apériodique “checkant” la batterie avant toute tentative d’action de la part du robot. Si batterie < seuil, alors l’action n’est pas réalisé et le robot est réinitialisé.
Résultats attendus : Le robot vérifie l’état de sa batterie avant chaque action intentée et n’exécute pas l’action demandée si l’état de la batterie n’est pas suffisant pour réaliser l’action désirée.

### 5°) Être capable d’enchaîner les consignes (le robot doit pouvoir exécuter une consigne après exécution d’une consigne extérieure). 

Test : Envoyer rapidement des ordres différents au robot 
Résultats attendus : Le robot exécute bien les consignes dans l’ordre d’émission, il n’y a pas de problème dans l’exécution de ces consignes. Une consigne attend que la consigne antérieure se produise entièrement avant de s’exécuter (pas de chevauchement).


### 6°) Connaître position robot dans l’arène grâce à la caméra

Test : placer le robot aléatoirement dans l’arène et vérifier si la position qu’il renvoie correspond bien à celle occupée physiquement par le robot.
Résultats attendus : Le robot renvoie les bonnes coordonnées de sa position.

## II- Enumération des threads

### 1°) th_deplacer :
type : périodique de période 1s.
port d’entrée : reponse (retour du robot)
ports de sortie : * ordre (de déplacement et/ou de vitesse)
              * message

### 2°) th_controler_batterie :
type : apériodique
ports d’entrée : * message (venant d’une action qui est intentée)
            * réponse (retour du robot)
ports de sortie : * message (etat_batterie)
            * ordre (autoriser_action ou refuser_action)

### 3°) th_controler_deplacement :
type : apériodique
ports d’entrée : * message (venant du th_deplacer)
            * réponse (retour du robot)
port de sortie : * message (true or false selon comparaison message et reponse)

### 4°) th_reinitialiser_et/ou_eteindre :
type : apériodique
ports d’entrée : * message (etat de la communication venant du th_communiquer)
            * message (etat_batterie)
            * réponse (retour du robot)
port de sortie : * ordre (pour arrêter ou réinitialiser le robot)
            *  rt_task_suspend() (à toutes les tâches en action)

### 5°) th_communiquer : 
type : apériodique
ports d’entrée : * inputStream (communication depuis le moniteur)
 * ordre_connecterServeur 
ports de sortie : * ordre_connecterRobot
          * message_etat_connection (pour le th_reinitialiser_et/ou_eteindre) 

### 6°) th_connecter : 
type : apériodique
ports d’entrée : * ordre_connecterRobot
             * reponse
ports de sortie : * ordre 
 * message

### 7°) th_envoyer 
type  : apériodique
ports d’entrée : * message
ports de sortie : * outputStream
         
### 8°) th_controler_position : 
type : apériodique
ports d’entrée : * inputStream (communication depuis le moniteur)
 * ordre_connecterServeur 
ports de sortie : * ordre_connecterRobot
          * message_etat_connection (pour le th_reinitialiser_et/ou_eteindre) 

