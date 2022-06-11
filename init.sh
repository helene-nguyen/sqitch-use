#~ Création d'un script via les commandes POSTGRES
# https://docs.postgresql.fr/10/reference-client.html

#& 0. je prends l'identité de postgres (si non config sur les variables d'env.)
# On utilise cette commande pour facilité les futurs utilisateurs en parametrant directement le PGUSER en postgres
export PGUSER=postgres

#& 1 - Création d'un utilisateur en BDD (with login)
# createuser [option_connexion...] [option...] [nom_utilisateur]
# createuser à la même fonction que CREATE ROLE
# le -W force une demande de mdp, même si celle-ci n'en contient pas
# le -P demande à l'utilisateur de crée un password pour le nouvelle utilisateur
createuser -l -P ocolis
# Reviens à faire : createuser --login --password --pwprompt ocolis

#& 2 - Création d'une BDD ainsi que le propriétaire
# createdb [option_connexion...] [option...] [nombase] [description]
createdb -O ocolis ocolis
# Reviens à faire : createdb --owner=ocolis ocolis

#& 3 - Initialiser Sqitch
# on indique le nom et le moteur utilisé (ici postgres) 
# + possibilité d'indiqué un chemin avec --uri https://github.com/hello/
sqitch init ocolis_sqitch --engine pg

#& 4 - Création d'une version 1 pour la BDD
sqitch add ocolis_v1 -n "Initialisation : First version"