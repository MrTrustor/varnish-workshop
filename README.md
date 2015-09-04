# Oxalide Workshop #2

## Contenu

 * ESI/Ajax, du dynamique dans du statique
 * Vmods principaux et leur utilite
 * Cache hierarchique
 * Partage de cache entre plusieurs Varnish

## Notes

 * Le user vagrant a tous les droits via sudo

## Exercice
On a un fichier index.php qui compte le nombre de visite que l'on a fait.
Probleme:
 * Si on le met en cache, les sessions vont se melanger entre les users, ce qui est un gros probleme,
 * Ce script est lent: avec un nombre de users eleve et sans cache, notre serveur ne va pas supporter.

Il faut donc modifier ce script pour arriver a mettre en cache cette page tout en gardant la
fonctionnalite principale.

Deux methodes possibles :
 * AJAX: deporter la partie dynamique de la page dans un appel AJAX
 * ESI: deporter la partie dynamique de la page dans un appel ESI. Attention a l'initialisation des sessions.
