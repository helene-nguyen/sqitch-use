# O'colis

O'colis, c'est l'outil de gestion parfait pour une petite société de transport :truck: Simple, efficace, instinctif et pas cher ! Notre startup va le vendre à des centaines d'entreprises partout en France et même en Europe ! Enfin, pour ça, faut que l'appli soit codée :unamused:

Pour l'heure, on va se concentrer sur la base de données ! Elle ne sera pas commune à tous les clients mais bien déployée pour chaque transporteur (ça évite d'accéder accidentellement aux données du voisin/concurrent, un bug est vite arrivé).

Le MCD et le script de création des tables sont fournis :tada: mais le boulot n'est pas fini, loin de là.

## La demande urgente

Quelques semaines après le lancement de l'appli, un client, parmi la petite centaine qui a signé chez nous, a réveillé notre chef de projet au beau milieu de la nuit : les numéros de série entiers ne lui conviennent pas du tout ! Il utilise de l'hexadécimal et la base de données ne veut rien savoir...

Forcément, tous les clients n'ont pas le même fonctionnement, ce qui convient à certains ne convient pas à d'autres... Il faut que l'application (et sa base, par extension) convienne au plus grand nombre. On va y remédier !

**Modifiez la colonne `serial_number` en champ texte**, ce qui permettra de continuer à accueillir des entiers, mais aussi de l'hexa, de la [base 36](https://fr.wikipedia.org/wiki/Base_36) ou n'importe quoi d'autre.

### Le caillou dans la chaussure

:hand: Hopopop ! Vous avez rouvert `ocolis.sql` là ! Ce fichier a déjà servi à générer les bases de données de tous nos clients depuis quelques temps déjà. Maintenant, il y a des données dans leurs bases. Et lancer une nouvelle version d'un script qui contient `DROP TABLE IF EXISTS`, ça a un tout petit effet de bord : ils perdent toutes leurs données...

Il reste une solution : créer un fichier `ocolis_r2.sql` (_r_ pour révision) avec les modifications à apporter sur la base existante. Allez, faisons comme ça.

Tant qu'on y est, voici quelques autres modifs remontées par des clients mécontents à différentes dates.


<details>
<summary>Fallait s'y attendre, finalement</summary>

<em>À peine deux mois après la sortie de la v1, la base de données du projet a évolué. Ça n'a rien d'étonnant : le code évolue tous les jours, pour corriger des bugs, ajouter des fonctionnalités ; c'est normal que la base évolue pour intégrer tout ça, elle aussi. Le rythme est souvent moindre mais la nécessité est bien là.

Mais parce que chaque script qu'on écrit est destiné à être lancé tout de suite, on est obligés d'en recréer un nouveau à chaque modif, de respecter une nomenclature pour s'y retrouver (on aurait aussi appeler nos scripts `ocolis_20200818.sql`, `ocolis_20200929.sql` etc.) et de bien documenter la façon de déployer la base dans sa toute dernière version, pour éviter que quelqu'un n'exécute les scripts dans le mauvais ordre...</em>

Bref !

</details>

## Les numéros de série uniques

_fichier à produire :_ `ocolis_r3.sql`

Chez l'un de nos clients, la numérotation des colis se fait à la main :scream: Forcément, il n'a pas fallu longtemps avant qu'un employé renseigne un numéro déjà attribué à un ancien colis pour en créer un nouveau... Après inspection de la base, la cause est évidente : le `serial_number` est _NOT NULL_ :+1: mais il n'est pas _UNIQUE_ :-1:

Il faut corriger ça de toute urgence avant que d'autres ne remarquent ce bug :grimacing:

## Un volume plus simple à gérer

_fichier à produire :_ `ocolis_r4.sql`

Les centimètres cubes, c'est traître. Un colis qui fait 1 mètre par 1 mètre par 1 mètre, il fait 1 mètre cube. Mais s'il fait 10 centimètre de large, 10 centimètre de haut et 100 mètres de long, il fait aussi 1 mètre cube, sauf qu'il ne rentre dans aucun camion. Vous voyez le souci ?

Le problème ici, c'est qu'on ne peut pas reconstituer les infos manquantes : on a le volume de chaque colis, mais pas sa forme. On va donc simplement passer d'une à trois colonnes pour le volume : `height` qui est un renommage de la colonne `volume`, et `width` et `depth`, 2 nouvelles colonnes avec pour valeur par défaut 1 (pour que les calculs restent bons).

#### Avant

content_description | volume
--------------|------------
200 flûtes traversières | 154200
1 cactus | 780
1 écran HD 42 pouces | 2975

#### Après

content_description | height | width | depth
--------------|------------|------|------
200 flûtes traversières | 154200 | 1 | 1
1 cactus | 780 | 1 | 1
1 écran HD 42 pouces | 2975 | 1 | 1

## La traçabilité

_fichier à produire :_ `ocolis_r5.sql`

Connaître les colis qu'on gère, c'est bien. Savoir s'ils sont pris en charge, en train d'être livrés ou chez le client depuis une semaine, c'est mieux :slightly_smiling_face:

Pour ça, on va ajouter 3 dates à la table `package` :
- `request_time`, rempli automatiquement à l'insertion d'une ligne
- `expedition_time`, qui représente l'instant où le livreur quitte l'entrepôt avec ce colis chargé dans son camion (celle-ci sera donc nulle jusqu'à ce moment)
- `delivered_time`, l'instant où le colis est livré (idem, la date est nulle avant que le colis soit livré)

Dans la [page Don't Do This du wiki de PostgreSQL](https://wiki.postgresql.org/wiki/Don%27t_Do_This), je crois avoir vu qu'il fallait plutôt utiliser un type bien particulier pour stocker des dates :thinking:

## Ça passe ou ça casse

Il est temps de tester tout ça, non ?

Créez une base de données nommée `ocolis` et lancez les scripts l'un après l'autre avec `psql` :
- si tout roule, vous avez gagné le droit d'aller vous coucher :tada:
- s'il y a des erreurs mais qu'il est plus de 20h30, il est largement temps de décrocher et d'aller vous coucher
- sinon, c'est parti pour une session de débug :nerd_face:
