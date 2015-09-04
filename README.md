# Oxalide Workshop #2 - Partage de cache entre deux Varnish

## Contenu

 * ESI/Ajax, du dynamique dans du statique
 * Vmods principaux et leur utilite
 * Cache hierarchique
 * Partage de cache entre plusieurs Varnish

## Notes

 * Le user vagrant a tous les droits via sudo,
 * Deux Varnish tournent : varnish1 sur le port 80 et varnish2 sur le port 81,
 * Les commandes varnishadm, varnishncsa et varnishlog ont ete dupliquee en varnishadm2, varnishncsa2 et varnishlog2 pour la deuxieme instance.

## Exercice
Configurer les deux instances de Varnish pour que si elle n'ont pas l'objet demande, elles interroge l'autre instance de Varnish plutot qu'Apache.
Tips: Attention aux boucles de requetes infinies.
